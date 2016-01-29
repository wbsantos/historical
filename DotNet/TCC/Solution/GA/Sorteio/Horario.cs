using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Kairos.GA.Sorteio
{

    class Horario
    {
        List<DAO.HorarioTurma> horarios;
        DAO.Turma turma;

        public Horario(DAO.Professor professor, DAO.Turma turma)
        {
            this.turma = turma;
            this.horarios = new List<DAO.HorarioTurma>();

            foreach (DAO.PreferenciaDiaTurno prefDiaTurno in professor.prefDiaTurno)
            {
                if (prefDiaTurno.valor == 0 || prefDiaTurno.turno.id != turma.turno.id)
                    continue;

                DAO.Dia dia = turma.getDia(prefDiaTurno.diaSemana);

                foreach (DAO.HorarioTurma horario in dia.horarios)
                {
                    if (horario.disciplina == null)
                        horarios.Add(horario);
                }
            }
        }

        public Horario(DAO.Turma turma)
        {
            this.turma = turma;
            this.horarios = new List<DAO.HorarioTurma>();
            List<DAO.HorarioTurma> horariosFimDeSemana = new List<DAO.HorarioTurma>();

            foreach (var dia in turma.dias)
            {
                foreach (DAO.HorarioTurma horario in dia.horarios)
                {
                    if (horario.disciplina == null)
                    {
                        if (dia.diaSemana == DAO.DiaSemana.Domingo || dia.diaSemana == DAO.DiaSemana.Sabado)
                            horariosFimDeSemana.Add(horario);
                        else
                            horarios.Add(horario);
                    }
                }
            }

            if (horarios.Count == 0)
                horarios = horariosFimDeSemana;
        }

        private bool haValidos
        {
            get
            {
                return horarios.Count > 0;
            }
        }

        public DAO.HorarioTurma sortear()
        {
            if (!haValidos)
                return null;

            int d = Sorteio.Random.Next(0, horarios.Count - 1);
            return horarios[d];
            
        }
    }
}
