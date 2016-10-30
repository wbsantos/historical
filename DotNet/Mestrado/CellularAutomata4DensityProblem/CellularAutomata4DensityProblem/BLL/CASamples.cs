using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Threading;

namespace CellularAutomata4DensityProblem.BLL
{
    class CASamples
    {
        private const int MAX_THREADS = 25;

        public void CreateSamples(int quantity)
        {
            ManualResetEvent[] flags = new ManualResetEvent[MAX_THREADS];

            int qtdPerThread = (int)Math.Round(quantity / (double)MAX_THREADS);
            int qtdLastThread = quantity - (qtdPerThread * (MAX_THREADS - 1));

            for (int i = 0; i < MAX_THREADS - 1; i++)
            {
                flags[i] = new ManualResetEvent(false);
                ThreadPool.QueueUserWorkItem(_CreateSamples, new Tuple<int, ManualResetEvent>(qtdPerThread, flags[i]));
            }

            flags[flags.Length - 1] = new ManualResetEvent(false);
            ThreadPool.QueueUserWorkItem(_CreateSamples, new Tuple<int, ManualResetEvent>(qtdLastThread, flags.Last()));

            foreach (var flag in flags)
                flag.WaitOne();

            DAL.CASamples dal = new DAL.CASamples();
            int qtdRepetead = dal.CleanRepeated();
            if (qtdRepetead > 0)
                CreateSamples(qtdRepetead);
        }

        private void _CreateSamples(object pQtdAndFlag)
        {
            Tuple<int, ManualResetEvent> qtdAndFlag = (Tuple<int, ManualResetEvent>)pQtdAndFlag;
            try
            {
                int quantity = qtdAndFlag.Item1;
                if (quantity < 1)
                    return;

                DAL.CASamples dal = new DAL.CASamples();
                Random randomize = new Random();
                List<long> list = new List<long>(quantity);
                int xh, xl;
                long x;

                for (int i = 0; i < quantity; i++)
                {
                    do
                    {
                        xh = randomize.Next(Int32.MinValue, Int32.MaxValue);
                        do
                        {
                            xl = randomize.Next(Int32.MinValue, Int32.MaxValue);
                        } while (xl == xh);
                        x = (xh << 32) | xl;
                    } while (list.Contains(x) || !dal.InserirSample(x));
                    list.Add(x);
                }
            }
            finally
            {
                qtdAndFlag.Item2.Set();
            }
        }
    }
}
