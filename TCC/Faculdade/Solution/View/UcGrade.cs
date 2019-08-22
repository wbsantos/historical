using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using Kairos.DAO;
using Kairos.Util;

namespace Kairos.View
{
    public partial class UcGrade : UcModel
    {
        List<Curso> _cursos;
        List<Curso> _grade;

        public UcGrade()
        {
            InitializeComponent();
        }

        private void UcGrade_Load(object sender, EventArgs e)
        {
            if (DesignMode)
                return;

            cmbCurso.DataSource = null;
            cmbPeriodo.DataSource = null;
            cmbTurma.DataSource = null;

            _cursos = Curso.get();
            _grade = Curso.get();
            List<Professor> professores = Professor.get();
            List<Disciplina> disciplinas = Disciplina.get();
            foreach (var item in _grade)
            {
                item.carregarGrade(professores, disciplinas);
            }

            cmbCurso.DataSource = _cursos;

            cmbTurma_SelectedIndexChanged(sender, e);
        }

        private void cmbCurso_SelectedIndexChanged(object sender, EventArgs e)
        {
            Curso curso = cmbCurso.SelectedItem as Curso;
            if (curso != null)
            {
                dataGrid.Rows.Clear();
                cmbPeriodo.DataSource = curso.periodos;
            }
        }

        private void cmbPeriodo_SelectedIndexChanged(object sender, EventArgs e)
        {
            Periodo periodo = cmbPeriodo.SelectedItem as Periodo;
            if (periodo != null)
            {
                dataGrid.Rows.Clear();
                cmbTurma.DataSource = periodo.turmas;
            }
        }

        private void btnGerarGrade_Click(object sender, EventArgs e)
        {
            FrmLoad frmLoad = new FrmLoad();
            Cursor oldCursor = this.Cursor;
            this.Cursor = Cursors.WaitCursor;

            frmLoad.TopMost = true;
            this.Parent.Enabled = false;
            frmLoad.Show();
            frmLoad.Update();

            GA.Populacao populacao = new GA.Populacao(frmLoad);
            populacao.gerarPopulacaoInicial();

            frmLoad.setMaxValue(1000 + 10 * _grade.Count);
            populacao.selecaoNatural(1000);
            _grade = populacao.getBestCromossomo();
            cmbTurma_SelectedIndexChanged(sender, e);

            frmLoad.finalizarQuandoCompletar = true;
            frmLoad.Caption = "Salvando Grade...";
            
            Curso.zerarGrade();
            foreach (var item in _grade)
            {
                item.salvarGrade();
                frmLoad.addProgress(10);
            }
            this.Parent.Enabled = true;
            this.Cursor = oldCursor;
        }

        private void cmbTurma_SelectedIndexChanged(object sender, EventArgs e)
        {
            dataGrid.Rows.Clear();

            Turma turma = getTurmaSel();
            if (turma == null)
                return;
            dataGrid.Rows.Add(turma.dias[0].horarios.Count);

            for (int i = 0; i < turma.dias.Count; i++)
            {
                for (int j = 0; j < turma.dias[i].horarios.Count; j++)
                {
                    HorarioTurma horario = turma.dias[i].horarios[j];
                    if (horario.professor != null && horario.disciplina != null)
                        dataGrid[i, j].Value = horario.professor.nome + " / " + horario.disciplina.nome;
                    else
                        dataGrid[i, j].Value = " - ";
                    dataGrid.Rows[j].HeaderCell.Value = horario.horario.ToString();
                }
            }

            for (int i = 0; i < dataGrid.Rows.Count; i++)
            {
                dataGrid.AutoResizeRow(i);
            }
            dataGrid.AutoResizeRowHeadersWidth(DataGridViewRowHeadersWidthSizeMode.AutoSizeToAllHeaders);
        }

        private Turma getTurmaSel()
        {
            Curso cursoSel = cmbCurso.SelectedItem as Curso;
            Periodo periodoSel = cmbPeriodo.SelectedItem as Periodo;
            Turma turmaSel = cmbTurma.SelectedItem as Turma;

            if (cursoSel == null || periodoSel == null || turmaSel == null || _grade == null)
                return null;

            foreach (var curso in _grade)
            {
                if (curso.id == cursoSel.id)
                {
                    foreach (var periodo in curso.periodos)
                    {
                        if (periodo.periodo == periodoSel.periodo)
                        {
                            foreach (var turma in periodo.turmas)
                            {
                                if (turma.id == turmaSel.id)
                                    return turma;
                            }
                        }
                    }
                }
            }

            return null;
        }
    }
}
