using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CellularAutomata4DensityProblem.DML
{
    class CASample
    {
        public enum Answer
        {
            More0,
            More1,
            Equal,
            NotSolved,
            AlmostAll0,
            AlmostAll1,
            Pendent = 99
        }

        public int ID { get; set; }
        public long State { get; set; }
        public Answer Correct { get; set; } = Answer.Pendent;
        public Answer Role232 { get; set; } = Answer.Pendent;
        public Answer TomsRole { get; set; } = Answer.Pendent;
    }
}
