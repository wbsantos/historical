using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace Kairos.DAO
{
    class PreferenciaDisciplinas : ICloneable
    {
        public int id { get; private set; }
        public Professor professor;
        public Periodo periodo;
        public Disciplina disciplina;
        public int valor;

        public static List<PreferenciaDisciplinas> get(Professor professor)
        {
            DataTable dt = DA.Connect.SQL.query("Select * from preferenciaDisciplina where idProfessor = " + professor.id.ToString());
            List<PreferenciaDisciplinas> preferencias = new List<PreferenciaDisciplinas>();

            foreach (DataRow row in dt.Rows)
            {
                PreferenciaDisciplinas preferencia = new PreferenciaDisciplinas();
                preferencia.id = int.Parse(row["id"].ToString()); ;
                preferencia.valor = int.Parse(row["valor"].ToString());
                preferencia.professor = professor;

                DataTable dtPerDisci = DA.Connect.SQL.query("Select * from periodoDisciplinas where id = " + row["idPeriodoDisciplina"].ToString());
                if (dtPerDisci.Rows.Count != 1)
                    continue;
                Curso curso = Curso.get(int.Parse(dtPerDisci.Rows[0]["idCurso"].ToString()));
                int periodo = int.Parse(dtPerDisci.Rows[0]["periodo"].ToString());
                foreach (Periodo item in curso.periodos)
                {
                    if (item.periodo == periodo)
                    {
                        preferencia.periodo = item;
                        break;
                    }
                }
                int idDisciplina = int.Parse(dtPerDisci.Rows[0]["idDisciplina"].ToString());
                foreach (Disciplina item in preferencia.periodo.disciplinas)
                {
                    if (item.id == idDisciplina)
                    {
                        preferencia.disciplina = item;
                        break;
                    }
                }

                preferencias.Add(preferencia);
            }

            return preferencias;
        }

        public override string ToString()
        {
            return disciplina.ToString();
        }

        public void insert()
        {
            id = DA.Connect.SQL.execute("Insert into preferenciaDisciplina (idProfessor, idPeriodoDisciplina, valor) values(" +
                                                                                        professor.id + ", " +
                                                                                        disciplina.idPeriodoDisciplinas.ToString() + ", " +
                                                                                        valor.ToString() + ")");
        }

        public void delete()
        {
            DA.Connect.SQL.execute("Delete from preferenciaDisciplina where id = " + id.ToString());
        }

        internal void update()
        {
            DA.Connect.SQL.execute("Update preferenciaDisciplina set valor = " + valor.ToString() + " where id = " + id.ToString());
        }

        public object Clone()
        {
            PreferenciaDisciplinas preferencia = new PreferenciaDisciplinas();
            preferencia.id = this.id;
            preferencia.disciplina = (Disciplina)this.disciplina.Clone();
            preferencia.periodo = this.periodo == null ? null : (Periodo)this.periodo.Clone();
            preferencia.valor = this.valor;

            return preferencia;
        }
    }
}
