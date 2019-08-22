using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Kairos.DAO
{
    class HorarioTurma : IComparable<HorarioTurma>, ICloneable
    {
        public Dia dia;
        public DAO.Disciplina disciplina;
        public DAO.Professor professor;
        public HorariosTurno horario;

        public int CompareTo(HorarioTurma other)
        {
            return horario.CompareTo(other.horario);
        }

        public object Clone()
        {
            HorarioTurma horario = new HorarioTurma();
            horario.disciplina = this.disciplina == null ? null : (Disciplina)this.disciplina.Clone();
            horario.professor = this.professor == null ? null : (Professor)this.professor.Clone();
            horario.horario = this.horario == null ? null : (HorariosTurno)this.horario.Clone();

            return horario;
        }
    }
}
