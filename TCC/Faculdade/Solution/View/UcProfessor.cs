using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using Kairos.DAO;
using Kairos.Util;

namespace Kairos.View
{
    public partial class UcProfessor : UcModel
    {
        List<Professor> _professores;

        public UcProfessor()
        {
            InitializeComponent();
        }

        private void UcProfessor_Load(object sender, EventArgs e)
        {
            if (DesignMode)
                return;

            _professores = Professor.get();
            cmbProfessor.DataSource = null;
            lbxDisciplinas.DataSource = new List<PreferenciaDisciplinas>();

            cmbProfessor.DataSource = _professores;
            lbxDiaSemana.DataSource = Enum.GetValues(typeof(DiaSemana));
        }

        private void cmbProfessor_SelectedIndexChanged(object sender, EventArgs e)
        {
            Professor professor = cmbProfessor.SelectedItem as Professor;
            if (professor == null)
                return;

            txtRG.Text = professor.rg;
            lbxDisciplinas.DataSource = professor.prefDisciplinas;
            atualizarNumValorDiaSemana();
        }

        private void atualizarNumValorDiaSemana()
        {
            Professor professor = cmbProfessor.SelectedItem as Professor;
            if (professor == null || lbxDiaSemana.SelectedIndex == -1 || lbxTurnos.SelectedItem == null)
            {
                return;
            }
            DiaSemana diaSemana = (DiaSemana)lbxDiaSemana.SelectedItem;
            Turno turno = lbxTurnos.SelectedItem as Turno;
            foreach (PreferenciaDiaTurno item in professor.prefDiaTurno)
            {
                if (item.diaSemana == diaSemana && item.turno.id == turno.id)
                {
                    numValorDiaSemana.Value = item.valor;
                    return;
                }
            }
            numValorDiaSemana.Value = 0;
        }

        private void UcProfessor_Enter(object sender, EventArgs e)
        {
            cmbCurso.DataSource = Curso.get();
            lbxTurnos.DataSource = Turno.get();
        }

        private void cmbCurso_SelectedIndexChanged(object sender, EventArgs e)
        {
            Curso curso = cmbCurso.SelectedItem as Curso;
            if (curso == null)
                cmbPeriodo.DataSource = null;
            else
                cmbPeriodo.DataSource = curso.periodos;
        }

        private void cmbPeriodo_SelectedIndexChanged(object sender, EventArgs e)
        {
            Periodo periodo = cmbPeriodo.SelectedItem as Periodo;
            if (periodo == null)
                cmbDisciplina.DataSource = null;
            else
                cmbDisciplina.DataSource = periodo.disciplinas;
        }

        private void cmbProfessor_TextChanged(object sender, EventArgs e)
        {
            lbxDisciplinas.DataSource = new List<PreferenciaDisciplinas>();
            txtRG.Text = "";
            atualizarNumValorDiaSemana();
            
            if ((cmbProfessor.SelectedItem as Professor) == null)
            {
                numValorDiaSemana.Value = 0;
                numValorDisciplina.Value = 0;
            }
            if(lbxDiaSemana.SelectedIndex == -1)
                numValorDisciplina.Value = 0;
            if (lbxDisciplinas.SelectedIndex == -1)
                numValorDisciplina.Value = 0;
        }

        private Professor salvarProfessor()
        {
            if (cmbProfessor.Text.Trim() == "")
                return null;

            Professor professor = cmbProfessor.SelectedItem as Professor;
            if (professor == null || professor.id == -1)
            {
                professor = inserirProfessor();
                _professores.Add(professor);
                cmbProfessor.RefreshData();
                cmbProfessor.SelectedItem = professor;
            }

            atualizarProfessor(professor);
            return professor;
        }

        private void atualizarProfessor(Professor professor)
        {
            if (professor.rg != txtRG.Text)
            {
                professor.rg = txtRG.Text;
                professor.update();
            }
        }

        private Professor inserirProfessor()
        {
            Professor professor = new Professor();
            professor.nome = cmbProfessor.Text;
            professor.rg = txtRG.Text;
            foreach (Professor item in _professores)
            {
                if (item.rg == professor.rg)
                {
                    cmbProfessor.SelectedItem = item;
                    return item;
                }
            }

            professor.insert();
            return professor;            
        }

        private void deletarProfessor()
        {
            Professor professor = cmbProfessor.SelectedItem as Professor;
            if (professor == null)
                return;

            if (professorSemPreferencias(professor))
                professor.delete();
        }

        private bool professorSemPreferencias(Professor professor)
        {
            foreach (PreferenciaDiaTurno item in professor.prefDiaTurno)
            {
                if (item.valor > 0)
                    return false;
            }
            foreach (PreferenciaDisciplinas item in professor.prefDisciplinas)
            {
                if (item.valor > 0)
                    return false;
            }
            return true;
        }

        private void atualizarValorDiaSemana()
        {
            Professor professor = salvarProfessor();
            if (professor == null || lbxDiaSemana.SelectedIndex == -1)
                return;

            PreferenciaDiaTurno preferencia = null;
            DiaSemana diaSemana = (DiaSemana)lbxDiaSemana.SelectedItem;
            Turno turno = lbxTurnos.SelectedItem as Turno;
            foreach (PreferenciaDiaTurno item in professor.prefDiaTurno)
            {
                if (item.diaSemana == diaSemana && item.turno.id == turno.id)
                {
                    preferencia = item;
                    preferencia.valor = (int)numValorDiaSemana.Value;
                    break;
                }
            }
            if (preferencia == null)
            {
                preferencia = new PreferenciaDiaTurno();
                preferencia.diaSemana = (DiaSemana)lbxDiaSemana.SelectedItem;
                preferencia.professor = professor;
                preferencia.turno = turno;
                preferencia.valor = (int)numValorDiaSemana.Value;
                preferencia.insert();

                professor.prefDiaTurno.Add(preferencia);
            }
            else            
                preferencia.update();

            deletarProfessor();
        }

        private void numValorDiaSemana_Click(object sender, EventArgs e)
        {
            atualizarValorDiaSemana();
        }

        private void numValorDiaSemana_KeyUp(object sender, KeyEventArgs e)
        {
            atualizarValorDiaSemana();
        }

        private void lbxDiaSemana_SelectedIndexChanged(object sender, EventArgs e)
        {
            atualizarNumValorDiaSemana();
        }

        private void btnAddDisciplina_Click(object sender, EventArgs e)
        {
            List<PreferenciaDisciplinas> preferenciaDisciplinas = lbxDisciplinas.DataSource as List<PreferenciaDisciplinas>;
            if(preferenciaDisciplinas == null)
                return;

            Professor professor = salvarProfessor();
            Curso curso = cmbCurso.SelectedItem as Curso;
            Disciplina disciplina = cmbDisciplina.SelectedItem as Disciplina;
            Periodo periodo = cmbPeriodo.SelectedItem as Periodo;

            if(curso == null || disciplina == null || periodo == null)
                return;

            foreach(PreferenciaDisciplinas item in preferenciaDisciplinas)
            {
                if(item.disciplina.id == disciplina.id && 
                   item.periodo.curso.id == curso.id && 
                   item.periodo.periodo == periodo.periodo)
                    return;
            }

            PreferenciaDisciplinas preferencia = new PreferenciaDisciplinas();
            preferencia.disciplina = disciplina;
            preferencia.periodo = periodo;
            preferencia.professor = professor;
            preferencia.valor = 0;
            preferencia.insert();

            preferenciaDisciplinas.Add(preferencia);
            lbxDisciplinas.RefreshData();
            lbxDisciplinas.SelectedItem = preferencia;
        }

        private void lbxDisciplinas_SelectedIndexChanged(object sender, EventArgs e)
        {
            PreferenciaDisciplinas preferencia = lbxDisciplinas.SelectedItem as PreferenciaDisciplinas;
            if (preferencia != null)
            {
                numValorDisciplina.Value = preferencia.valor;
                for (int i = 0; i < cmbCurso.Items.Count; i++)
                {
                    if (((Curso)cmbCurso.Items[i]).id == preferencia.periodo.curso.id)
                    {
                        cmbCurso.SelectedIndex = i;
                        break;
                    }
                }
                for (int i = 0; i < cmbPeriodo.Items.Count; i++)
                {
                    if (((Periodo)cmbPeriodo.Items[i]).periodo == preferencia.periodo.periodo)
                    {
                        cmbPeriodo.SelectedIndex = i;
                        break;
                    }
                }
                for (int i = 0; i < cmbDisciplina.Items.Count; i++)
                {
                    if (((Disciplina)cmbDisciplina.Items[i]).id == preferencia.disciplina.id)
                    {
                        cmbDisciplina.SelectedIndex = i;
                        break;
                    }
                }
            }
            else
                numValorDisciplina.Value = 0;
        }

        private void numValorDisciplina_KeyUp(object sender, KeyEventArgs e)
        {
            PreferenciaDisciplinas preferencia = lbxDisciplinas.SelectedItem as PreferenciaDisciplinas;
            if (preferencia != null)
            {
                salvarProfessor();
                preferencia.valor = (int)numValorDisciplina.Value;
                preferencia.update();
            }
        }

        private void btnDelDisciplina_Click(object sender, EventArgs e)
        {
            salvarProfessor();
            PreferenciaDisciplinas preferencia = lbxDisciplinas.SelectedItem as PreferenciaDisciplinas;
            List<PreferenciaDisciplinas> preferenciaDisciplinas = lbxDisciplinas.DataSource as List<PreferenciaDisciplinas>;
            if (preferenciaDisciplinas == null || preferencia == null)
                return;

            preferencia.delete();
            int index = lbxDisciplinas.SelectedIndex;
            preferenciaDisciplinas.RemoveAt(index);
            lbxDisciplinas.RefreshData();

            deletarProfessor();
        }

        private void txtRG_Leave(object sender, EventArgs e)
        {
            salvarProfessor();
        }

        private void btnDelProfessor_Click(object sender, EventArgs e)
        {
            Professor professor = cmbProfessor.SelectedItem as Professor;
            if (professor != null)
            {
                professor.delete();
                UcProfessor_Load(sender, e);
            }
        }

        private void numValorDisciplina_Click(object sender, EventArgs e)
        {
            PreferenciaDisciplinas preferencia = lbxDisciplinas.SelectedItem as PreferenciaDisciplinas;
            if (preferencia != null)
            {
                salvarProfessor();
                preferencia.valor = (int)numValorDisciplina.Value;
                preferencia.update();
            }
        }
    }
}
