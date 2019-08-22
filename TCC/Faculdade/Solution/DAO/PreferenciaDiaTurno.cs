using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace Kairos.DAO
{
    class PreferenciaDiaTurno : ICloneable
    {
        public int id { get; private set; }
        public Professor professor;
        public DiaSemana diaSemana;
        public Turno turno;
        public int valor;

        public static List<PreferenciaDiaTurno> get(Professor professor)
        {
            DataTable dt = DA.Connect.SQL.query("Select * from PreferenciaDiaTurno where idProfessor = " + professor.id.ToString());
            List<PreferenciaDiaTurno> preferencias = new List<PreferenciaDiaTurno>();

            foreach (DataRow row in dt.Rows)
            {
                PreferenciaDiaTurno preferencia = new PreferenciaDiaTurno();
                preferencia.id = int.Parse(row["id"].ToString()); ;
                preferencia.turno = Turno.get(int.Parse(row["idTurno"].ToString()));
                preferencia.diaSemana = (DiaSemana)int.Parse(row["diaSemana"].ToString());
                preferencia.valor = int.Parse(row["valor"].ToString());
                preferencia.professor = professor;
                preferencias.Add(preferencia);
            }

            return preferencias;
        }

        public override string ToString()
        {
            return turno.ToString() + " : " + valor.ToString();
        }

        public void insert()
        {
            id = DA.Connect.SQL.execute("Insert into PreferenciaDiaTurno (idProfessor, idTurno, diaSemana, valor) values(" +
                                                                                        professor.id + ", " +
                                                                                        turno.id.ToString() + ", " +
                                                                                        ((int)diaSemana).ToString() + ", " +
                                                                                        valor.ToString() + ")");
        }

        internal void update()
        {
            DA.Connect.SQL.execute("Update PreferenciaDiaTurno set valor = " + valor.ToString() + " where id = " + id.ToString());
        }

        public void delete()
        {
            DA.Connect.SQL.execute("Delete from PreferenciaDiaTurno where id = " + id.ToString());
        }

        public object Clone()
        {
            PreferenciaDiaTurno preferencia = new PreferenciaDiaTurno();
            preferencia.id = this.id;
            preferencia.diaSemana = this.diaSemana;
            preferencia.turno = this.turno == null ? null : (Turno)this.turno.Clone();
            preferencia.valor = this.valor;

            return preferencia;
        }
    }
}
