using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace Kairos.DAO
{
    class Professor : ICloneable
    {
        public int id { get; private set; }
        public string nome;
        public string rg;

        public List<PreferenciaDisciplinas> prefDisciplinas;
        public List<PreferenciaDiaTurno> prefDiaTurno;
        //public List<HorarioTurma> horarios;

        public Professor()
        {
            id = -1;
            prefDiaTurno = new List<PreferenciaDiaTurno>();
            prefDisciplinas = new List<PreferenciaDisciplinas>();
            //horarios = new List<HorarioTurma>();
        }

        public int getValorPrefDisciplina(Disciplina disciplina)
        {
            foreach (PreferenciaDisciplinas item in prefDisciplinas)
            {
                if (item.disciplina.id == disciplina.id)
                    return item.valor;
            }
            return 0;
        }

        public int getValorPrefDiaTurno(DiaSemana dia, Turno turno)
        {
            foreach (PreferenciaDiaTurno item in prefDiaTurno)
            {
                if (item.diaSemana == dia && item.turno.id == turno.id)
                    return item.valor;
            }
            return 0;
        }

        public static List<Professor> get()
        {
            DataTable dt = DA.Connect.SQL.query("Select * from professor");
            List<Professor> professores = new List<Professor>();

            foreach (DataRow row in dt.Rows)
            {
                Professor professor = new Professor();
                professor.id = int.Parse(row["id"].ToString());
                professor.nome = row["nome"].ToString();
                professor.rg = row["rg"].ToString();

                professor.prefDisciplinas = PreferenciaDisciplinas.get(professor);
                professor.prefDiaTurno = PreferenciaDiaTurno.get(professor);

                professores.Add(professor);
            }
            return professores;
        }

        public override string ToString()
        {
            return nome;
        }

        public void delete()
        {
            DA.Connect.SQL.execute("Delete from Professor where id = " + id.ToString());
            id = -1;
        }

        public void insert()
        {
            id = DA.Connect.SQL.execute("Insert into Professor (nome, rg) values('" + nome + "', '" + rg + "')");
        }

        internal void update()
        {
            DA.Connect.SQL.execute("Update Professor set nome = '" + nome + "', " +
                                                        "rg = '" + rg + "' " +                                                    
                                               "where id = " + id.ToString());
        }

        public object Clone()
        {
            Professor professor = new Professor();
            professor.id = this.id;
            professor.nome = this.nome;
            professor.rg = this.rg;
            professor.prefDisciplinas = new List<PreferenciaDisciplinas>();

            foreach (PreferenciaDisciplinas item in this.prefDisciplinas)
            {
                PreferenciaDisciplinas preferencia = item == null ? null : (PreferenciaDisciplinas)item.Clone();
                preferencia.professor = professor;
                professor.prefDisciplinas.Add(preferencia);
            }

            professor.prefDiaTurno = new List<PreferenciaDiaTurno>();

            foreach (PreferenciaDiaTurno item in this.prefDiaTurno)
            {
                PreferenciaDiaTurno preferencia = item == null ? null : (PreferenciaDiaTurno)item.Clone();
                preferencia.professor = professor;
                professor.prefDiaTurno.Add(preferencia);
            }

            /*professor.horarios = new List<HorarioTurma>();

            foreach (HorarioTurma item in this.horarios)
            {
                HorarioTurma horario = item == null ? null :  (HorarioTurma)item.Clone();
                horario.professor = professor;
                professor.horarios.Add(horario);
            }*/

            return professor;
        }
    }
}
