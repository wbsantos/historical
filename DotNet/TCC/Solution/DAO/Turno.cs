using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace Kairos.DAO
{
    class Turno : ICloneable
    {
        public int id { get; private set; }
        public string nome;
        public List<HorariosTurno> horarios;

        public static List<Turno> get()
        {
            DataTable dt = DA.Connect.SQL.query("Select * from turno");
            List<Turno> turnos = new List<Turno>();

            foreach (DataRow row in dt.Rows)
            {
                Turno turno = new Turno();
                turno.id = int.Parse(row["id"].ToString());
                turno.nome = row["nome"].ToString();
                turno.horarios = HorariosTurno.get(turno);
                turnos.Add(turno);
            }
            return turnos;
        }

        public override string ToString()
        {
            return nome;
        }

        public void delete()
        {
            DA.Connect.SQL.execute("Delete from Turma where idTurno = " + id.ToString());
            DA.Connect.SQL.execute("Delete from PreferenciaDiaTurno where idTurno = " + id.ToString());
            DA.Connect.SQL.execute("Delete from HorariosTurno where idTurno = " + id.ToString());
            DA.Connect.SQL.execute("Delete from Turno where id = " + id.ToString());
        }

        public void insert()
        {
            id = DA.Connect.SQL.execute("Insert into Turno (nome) values('" + nome + "')");
        }

        public static Turno get(int id)
        {
            DataTable dt = DA.Connect.SQL.query("Select * from Turno where id = " + id.ToString());
            if (dt.Rows.Count != 1)
                return null;

            Turno turno = new Turno();
            turno.id = int.Parse(dt.Rows[0]["id"].ToString());
            turno.nome = dt.Rows[0]["nome"].ToString();
            turno.horarios = HorariosTurno.get(turno);
            return turno;
        }

        public object Clone()
        {
            Turno turno = new Turno();
            turno.id = this.id;
            turno.nome = this.nome;
            turno.horarios = new List<HorariosTurno>();

            foreach (HorariosTurno item in this.horarios)
            {
                HorariosTurno horario = item == null ? null : (HorariosTurno)item.Clone();
                horario.turno = turno;
                turno.horarios.Add(horario);
            }

            return turno;
        }
    }
}
