using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace Kairos.DAO
{
    class Turma : ICloneable
    {
        public int id { get; private set; }
        public string nome;
        public Turno turno { get; set; }
        public Periodo periodo;
        public List<Dia> dias;

        public Curso curso { get { return periodo.curso; } }

        public Turma()
        {
            dias = new List<Dia>();
            foreach (DiaSemana diaSemana in Enum.GetValues(typeof(DiaSemana)))
            {
                Dia dia = new Dia();
                dia.diaSemana = diaSemana;
                dia.turma = this;
                dia.horarios = new List<HorarioTurma>();

                dias.Add(dia);
            }
        }

        public Dia getDia(DiaSemana diaSemana)
        {
            foreach (Dia dia in dias)
            {
                if (dia.diaSemana == diaSemana)
                    return dia;
            }
            return null;
        }

        public static List<Turma> get(Periodo periodo)
        {
            DataTable dt = DA.Connect.SQL.query("Select * from turma where idCurso = " + periodo.curso.id.ToString() + " and periodo = " + periodo.periodo.ToString());
            List<Turma> turmas = new List<Turma>();

            foreach (DataRow row in dt.Rows)
            {
                Turma turma = new Turma();
                turma.id = int.Parse(row["id"].ToString());
                turma.nome = row["nome"].ToString();
                turma.turno = Turno.get(int.Parse(row["idTurno"].ToString()));
                turma.periodo = periodo;
                foreach (Dia diaSemana in turma.dias)
                {
                    foreach (HorariosTurno horario in turma.turno.horarios)
                    {
                        HorarioTurma horaTurma = new HorarioTurma();
                        horaTurma.horario = horario;
                        horaTurma.dia = diaSemana;
                        diaSemana.horarios.Add(horaTurma);
                    }

                    diaSemana.horarios.Sort();
                }
                turmas.Add(turma);
            }
            return turmas;
        }

        public void insert()
        {
            id = DA.Connect.SQL.execute("Insert into Turma (nome, idCurso, idTurno, periodo) values('" + nome + "', "
                                                                                                       + periodo.curso.id.ToString() + ", "
                                                                                                       + turno.id.ToString() + ", "
                                                                                                       + periodo.periodo.ToString() + ")");
        }

        public void delete()
        {
            DA.Connect.SQL.execute("Delete from Turma where id = " + id.ToString());
        }

        public override string ToString()
        {
            return nome + " - " + turno.ToString();
        }

        public object Clone()
        {
            Turma turma = new Turma();

            turma.id = this.id;
            turma.nome = this.nome;
            turma.turno = this.turno == null ? null : (Turno)this.turno.Clone();
            turma.dias = new List<Dia>();

            foreach (Dia item in this.dias)
            {
                Dia dia = item == null ? null : (Dia)item.Clone();
                dia.turma = turma;
                turma.dias.Add(dia);
            }

            return turma;
        }
    }
}
