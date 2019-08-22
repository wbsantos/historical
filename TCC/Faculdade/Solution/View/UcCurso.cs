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
    public partial class UcCurso : UcModel
    {
        List<Curso> _cursos;

        public UcCurso()
        {
            InitializeComponent();
        }

        private void UcCurso_Load(object sender, EventArgs e)
        {
            if (DesignMode)
                return;

            _cursos = Curso.get();
            cmbCursos.DataSource = null;
            lbxDisciplinas.DataSource = new List<Disciplina>();
            lbxTurmas.DataSource = new List<Turma>();

            cmbCursos.DataSource = _cursos;
            cmbDisciplina.DataSource = Disciplina.get();
            if(lbxDisciplinas.SelectedItem == null)
                cmbDisciplina.SelectedIndex = -1;

            cmbTurno.DataSource = Turno.get();
        }

        private void cmbCursos_SelectedIndexChanged(object sender, EventArgs e)
        {
            Curso curso = cmbCursos.SelectedItem as Curso;
            if (curso == null)
                return;

            numQuantPeriodos.Value = curso.periodos.Count;
            txtDescricaoPeriodo.Text = curso.descricaoPeriodo;
            cmbPeriodo.DataSource = curso.periodos;
            cmbPeriodo_SelectedIndexChanged(sender, e);
        }

        private void atualizarCmbPeriodos()
        {
            Curso curso = salvarCurso();
            if (curso == null)
                return;
            cmbPeriodo.DataSource = curso.periodos;
            cmbPeriodo.RefreshData();
            cmbPeriodo_SelectedIndexChanged(null, null);
        }

        private void numQuantPeriodos_ValueChanged(object sender, EventArgs e)
        {
            if (numQuantPeriodos.Focused)
                atualizarCmbPeriodos();
        }

        private void numQuantPeriodos_KeyUp(object sender, KeyEventArgs e)
        {
            atualizarCmbPeriodos();
        }

        private void txtDescricaoPeriodo_Leave(object sender, EventArgs e)
        {
            atualizarCmbPeriodos();
        }

        private void cmbPeriodo_SelectedIndexChanged(object sender, EventArgs e)
        {
            Periodo periodo = cmbPeriodo.SelectedItem as Periodo;
            if (periodo != null)
            {
                lbxDisciplinas.DataSource = periodo.disciplinas;
                lbxTurmas.DataSource = periodo.turmas;
            }
            else
            {
                lbxDisciplinas.DataSource = new List<Disciplina>();
                lbxTurmas.DataSource = new List<Turma>();
            }
        }

        private void btnDelDisciplina_Click(object sender, EventArgs e)
        {
            Periodo periodo = cmbPeriodo.SelectedItem as Periodo;
            if (periodo == null)
                return;
            if (lbxDisciplinas.DataSource == null)
                return;
            List<Disciplina> disciplinas = (List<Disciplina>)lbxDisciplinas.DataSource;
            if (disciplinas.Count == 0)
                return;
            Disciplina disciplina = (Disciplina)lbxDisciplinas.SelectedItem;
            if (disciplina == null)
                return;

            periodo.deleteDisciplina(disciplina);
            int index = lbxDisciplinas.SelectedIndex;
            disciplinas.RemoveAt(index);
            lbxDisciplinas.RefreshData();

            deletarCurso();
            if (disciplina.quantidadePeriodosUsando() == 0)
            {
                disciplina.delete();
                cmbDisciplina.DataSource = Disciplina.get();
            }
        }

        private void deletarCurso()
        {
            if (cmbCursos.SelectedItem != null)
            {
                int contDisciplinasOrTurmas = 0;
                Curso curso = cmbCursos.SelectedItem as Curso;
                for (int i = 0; i < curso.periodos.Count; i++)
                {
                    contDisciplinasOrTurmas += curso.periodos[i].disciplinas.Count;
                    contDisciplinasOrTurmas += curso.periodos[i].turmas.Count;
                }
                if (contDisciplinasOrTurmas == 0)
                    curso.delete();
            }
        }

        private Curso salvarCurso()
        {
            int contDisciplinas = 0;
            Curso curso = cmbCursos.SelectedItem as Curso;
            if (curso != null)
            {
                for (int i = 0; i < curso.periodos.Count; i++)
                    contDisciplinas += curso.periodos[i].disciplinas.Count;
            }
            if (contDisciplinas == 0)
            {
                foreach (Curso item in _cursos)
                {
                    if (item.nome.ToUpper() == cmbCursos.Text.ToUpper())
                    {
                        curso = item;
                        break;
                    }
                }
                if (curso == null)
                {
                    curso = inserirCurso();
                    _cursos.Add(curso);
                    cmbCursos.RefreshData();
                }
                cmbCursos.SelectedItem = curso;
            }
            atualizarCurso(curso);
            cmbPeriodo.RefreshData();
            return curso;
        }

        private void atualizarCurso(Curso curso)
        {
            curso.setQuantidadePeriodos((int)numQuantPeriodos.Value);
            if (curso.descricaoPeriodo != txtDescricaoPeriodo.Text)
            {
                curso.descricaoPeriodo = txtDescricaoPeriodo.Text;
                curso.update();
            }
        }

        private Curso inserirCurso()
        {
            Curso curso = new Curso();
            curso.nome = cmbCursos.Text;
            curso.descricaoPeriodo = txtDescricaoPeriodo.Text;
            curso.periodos = (List<Periodo>)cmbPeriodo.DataSource;
            curso.insert();
            return curso;
        }

        private void btnAddDisciplina_Click(object sender, EventArgs e)
        {
            if (cmbDisciplina.Text.Trim() == "" || cmbCursos.Text.Trim() == "")
                return;

            salvarCurso();        

            Periodo periodo = cmbPeriodo.SelectedItem as Periodo;
            if (periodo == null)
                return;

            List<Disciplina> disciplinas = (List<Disciplina>)lbxDisciplinas.DataSource;

            Disciplina disciplina = cmbDisciplina.SelectedItem as Disciplina;
            if (disciplina == null)
            {
                disciplina = new Disciplina();
                disciplina.nome = cmbDisciplina.Text;
                disciplina.cargaHorariaSemanal = tmCarga.Value;
                disciplina.insert();
            }
            else if (disciplina.cargaHorariaSemanal != tmCarga.Value)
            {
                disciplina = Disciplina.get(disciplina.id);
                disciplina.nome = cmbDisciplina.Text;
                disciplina.cargaHorariaSemanal = tmCarga.Value;
            }

            foreach (Disciplina d in periodo.disciplinas)
            {
                if (d.id == disciplina.id)
                    return;
            }

            periodo.insertDisciplina(disciplina);
            lbxDisciplinas.RefreshData();
            lbxDisciplinas.SelectedItem = disciplina;

            cmbDisciplina.DataSource = Disciplina.get();
            cmbDisciplina.SelectedIndex = -1;
        }

        private void cmbCursos_TextChanged(object sender, EventArgs e)
        {
            numQuantPeriodos.Value = 0;
            txtDescricaoPeriodo.Text = "Semestre";
            cmbPeriodo.DataSource = new List<Periodo>();
            cmbPeriodo_SelectedIndexChanged(null, null);
        }

        private void lbxDisciplinas_SelectedIndexChanged(object sender, EventArgs e)
        {
            tipLbxDisciplinas.SetToolTip(lbxDisciplinas, lbxDisciplinas.Text);
            Disciplina disciplina = lbxDisciplinas.SelectedItem as Disciplina;
            if (disciplina != null)
            {
                cmbDisciplina.Text = disciplina.ToString();
                tmCarga.Value = disciplina.cargaHorariaSemanal;
            }
        }

        private void cmbDisciplina_TextChanged(object sender, EventArgs e)
        {
            tipCbxDisciplina.SetToolTip(cmbDisciplina, cmbDisciplina.Text);
        }

        private void btnAddTurma_Click(object sender, EventArgs e)
        {
            if (txtTurma.Text.Trim() == "" || cmbTurno.SelectedItem == null)
                return;

            salvarCurso();

            Periodo periodo = cmbPeriodo.SelectedItem as Periodo;
            if (periodo == null)
                return;

            List<Turma> turmas = (List<Turma>)lbxTurmas.DataSource;
            Turno turno = cmbTurno.SelectedItem as Turno;

            Turma turma = null;
            foreach (Turma item in turmas)
            {
                if (txtTurma.Text.ToUpper() == item.nome.ToUpper())
                {
                    turma = item;
                    break;
                }
            }
            if (turma == null || turma.turno.id != turno.id)
            {
                turma = new Turma();
                turma.nome = txtTurma.Text;
                turma.periodo = periodo;
                turma.turno = turno;
                turma.insert();
            }
            else
                return;

            turmas.Add(turma);
            lbxTurmas.RefreshData();
            lbxTurmas.SelectedItem = turma;
        }

        private void btnDelTurma_Click(object sender, EventArgs e)
        {
            Periodo periodo = cmbPeriodo.SelectedItem as Periodo;
            if (periodo == null)
                return;
            if (lbxTurmas.DataSource == null)
                return;
            List<Turma> turmas = (List<Turma>)lbxTurmas.DataSource;
            if (turmas.Count == 0)
                return;
            Turma turma = (Turma)lbxTurmas.SelectedItem;
            if (turma == null)
                return;

            turma.delete();
            int index = lbxTurmas.SelectedIndex;
            turmas.RemoveAt(index);
            lbxTurmas.RefreshData();

            deletarCurso();
        }

        private void UcCurso_Enter(object sender, EventArgs e)
        {
            UcCurso_Load(sender, e);
        }

        private void btnDelCurso_Click(object sender, EventArgs e)
        {
            Curso curso = cmbCursos.SelectedItem as Curso;
            if (curso != null)
            {
                curso.delete();
                UcCurso_Load(sender, e);
            }
        }
    }
}
