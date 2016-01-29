using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Kairos.DAO
{
    class Grade
    {
        public int id { get; private set; }
        public Disciplina disciplina;
        public Professor professor;
        public Turma turma;

        public DiaSemana diaSemana;
        public DateTime horaInicial;
        public DateTime horaFinal;
    }
}
