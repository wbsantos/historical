using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace Kairos.DAO
{
    class Periodo : IComparable<Periodo>, ICloneable
    {
        public int periodo;
        public Curso curso;
        public List<Disciplina> disciplinas;
        public List<Turma> turmas;
        
        public Periodo()
        {
            disciplinas = new List<Disciplina>();
            turmas = new List<Turma>();
        }

        public static List<Periodo> get(Curso curso, int quantidadePeriodo)
        {
            List<Periodo> periodos = new List<Periodo>();

            for(int p = 1; p <= quantidadePeriodo; p++)
            {
                Periodo periodo = new Periodo();
                periodo.periodo = p;
                periodo.curso = curso;
                periodo.disciplinas = new List<Disciplina>();

                DataTable dt = DA.Connect.SQL.query("Select * from PeriodoDisciplinas where idCurso = " + curso.id.ToString() + " and periodo = " + p.ToString());
                foreach (DataRow row in dt.Rows)
                {
                    Disciplina disciplina = Disciplina.get(int.Parse(row["idDisciplina"].ToString()));
                    disciplina.cargaHorariaSemanal = (DateTime)row["cargaHorariaSemanal"];
                    disciplina.idPeriodoDisciplinas = int.Parse(row["id"].ToString());
                    periodo.disciplinas.Add(disciplina);
                }

                periodo.turmas = Turma.get(periodo);
                periodos.Add(periodo);
            }

            periodos.Sort();
            return periodos;
        }

        public int CompareTo(Periodo other)
        {
            return periodo.CompareTo(other.periodo);
        }

        public override string ToString()
        {
            return periodo.ToString() + "º " + curso.descricaoPeriodo;
        }

        public void deleteDisciplina(Disciplina disciplina)
        {
            DA.Connect.SQL.execute("Delete from PeriodoDisciplinas where idCurso = " + curso.id.ToString() + 
                                                                   " and periodo = " + periodo.ToString() + 
                                                                   " and idDisciplina = " + disciplina.id.ToString());
        }

        public void insertDisciplina(Disciplina disciplina)
        {
            DA.Connect.SQL.execute("Insert into PeriodoDisciplinas (idCurso, idDisciplina, periodo, cargaHorariaSemanal) values(" + curso.id.ToString() + ", " + 
                                                                                                                                    disciplina.id.ToString() + ", " + 
                                                                                                                                    periodo.ToString() + ", '" +
                                                                                                                                    disciplina.cargaHorariaSemanal.ToString("HH:mm") + "')");
            disciplinas.Add(disciplina);
        }

        public void delete()
        {
            DA.Connect.SQL.execute("Delete from PeriodoDisciplinas where idCurso = " + curso.id.ToString() +
                                                                   " and periodo = " + periodo.ToString());
        }

        public object Clone()
        {
            Periodo periodo = new Periodo();

            periodo.periodo = this.periodo;
            periodo.disciplinas = new List<Disciplina>();

            foreach (Disciplina item in this.disciplinas)
            {
                Disciplina disciplina = item == null ? null : (Disciplina)item.Clone();
                periodo.disciplinas.Add(disciplina);
            }

            periodo.turmas = new List<Turma>();

            foreach (Turma item in this.turmas)
            {
                Turma turma = item == null ? null : (Turma)item.Clone();
                turma.periodo = periodo;
                periodo.turmas.Add(turma);
            }

            return periodo;
        }
    }
}
