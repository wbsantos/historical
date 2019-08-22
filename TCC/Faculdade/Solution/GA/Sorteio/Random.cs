using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Kairos.GA.Sorteio
{
    class Random
    {
        private static System.Random random = new System.Random();

        public static int Next(int init, int end)
        {
            if (end < 100)
            {
                end *= 100;
                return (int)System.Math.Round(random.Next(init, end)/100.0);
            }
            else
                return random.Next(init, end);            
        }
    }
}
