using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Kairos.DAO
{
    class Dia : ICloneable
    {
        public Turma turma;
        public DAO.DiaSemana diaSemana;
        public List<HorarioTurma> horarios;

        public object Clone()
        {
            Dia dia = new Dia();
            dia.diaSemana = this.diaSemana;

            dia.horarios = new List<HorarioTurma>();
            foreach (HorarioTurma item in this.horarios)
            {
                HorarioTurma horario = item == null ? null : (HorarioTurma)item.Clone();
                horario.dia = dia;
                dia.horarios.Add(horario);
            }

            return dia;
        }
    }
}
