using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace Kairos.DAO
{
    class HorariosTurno : IComparable<HorariosTurno>, ICloneable
    {
        public int id { get; private set; }
        public Turno turno;
        public DateTime horaInicial;
        public DateTime horaFinal;

        public static List<HorariosTurno> get(Turno turno)
        {
            DataTable dt = DA.Connect.SQL.query("Select * from HorariosTurno where idTurno = " + turno.id.ToString());
            List<HorariosTurno> horarios = new List<HorariosTurno>();

            foreach (DataRow row in dt.Rows)
            {
                HorariosTurno horario = new HorariosTurno();
                horario.id = int.Parse(row["id"].ToString()); ;
                horario.horaInicial = (DateTime)row["HoraIni"];
                horario.horaFinal = (DateTime)row["HoraFim"];
                horario.turno = turno;
                horarios.Add(horario);
            }
            horarios.Sort();
            return horarios;
        }

        public override string ToString()
        {
            return horaInicial.ToString("HH:mm") + " às " + horaFinal.ToString("HH:mm");
        }

        public int CompareTo(HorariosTurno other)
        {
            return horaInicial.TimeOfDay.CompareTo(other.horaInicial.TimeOfDay);
        }

        public void delete()
        {
            DA.Connect.SQL.execute("Delete from HorariosTurno where id = " + id.ToString());
        }

        public void insert()
        {
            id = DA.Connect.SQL.execute("Insert into HorariosTurno (HoraIni, HoraFim, idTurno) values('" + 
                                            horaInicial.ToString("HH:mm") + "', '" + 
                                            horaFinal.ToString("HH:mm") + "', " +
                                            turno.id.ToString() + ")");
        }

        public object Clone()
        {
            HorariosTurno horario = new HorariosTurno();
            horario.id = this.id;
            horario.horaInicial = this.horaInicial;
            horario.horaFinal = this.horaFinal;
            return horario;
        }
    }
}
