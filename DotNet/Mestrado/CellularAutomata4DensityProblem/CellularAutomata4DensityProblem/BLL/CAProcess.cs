using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace CellularAutomata4DensityProblem.BLL
{
    class CAProcess
    {
        public void ProcessCorrectAnswer()
        {
            DAL.CASamples dal = new DAL.CASamples();
            List<DML.CASample> list = dal.GetAnswersPendencies(2000000, DAL.CASamples.AnswerKind.Correct);

            list.AsParallel().ForAll(ca => 
            {
                long qtdBits = NumberOfSetBits(ca.State);
                if (qtdBits < 32)
                    ca.Correct = DML.CASample.Answer.More0;
                else if(qtdBits > 32)
                    ca.Correct = DML.CASample.Answer.More1;
                else
                    ca.Correct = DML.CASample.Answer.Equal;
                dal.UpdateCorrecAnswer(ca);
            });
        }

        private const int MAX_THREADS = 40;
        private static object Locker = new object();
        DAL.CASamples dal = new DAL.CASamples();
        
        public void Process()
        {
            ManualResetEvent[] flags = new ManualResetEvent[MAX_THREADS];
            ManualResetEvent[] flagsTom = new ManualResetEvent[MAX_THREADS];

            for (int i = 0; i < MAX_THREADS; i++)
            {
                flags[i] = new ManualResetEvent(false);
                flagsTom[i] = new ManualResetEvent(false);
                ThreadPool.QueueUserWorkItem(ProcessRole232Answer, new Tuple<int, ManualResetEvent>(1000, flags[i]));
                ThreadPool.QueueUserWorkItem(ProcessTomsAnswer, new Tuple<int, ManualResetEvent>(1000, flagsTom[i]));
            }

            foreach (var flag in flags)
                flag.WaitOne();

            foreach (var flag in flagsTom)
                flag.WaitOne();
        }

        public void ProcessRole232Answer(object obj)
        {
            Tuple<int, ManualResetEvent> realObj = (Tuple<int, ManualResetEvent>)obj;
            List<DML.CASample> list;
            CAProcess232Role caRole232 = new CAProcess232Role();
            do
            {
                lock (Locker)
                {
                    list = dal.GetAnswersPendencies(realObj.Item1, DAL.CASamples.AnswerKind.Role232);
                }

                list.ForEach(ca =>
                {
                    try
                    {
                        long ret = caRole232.Process(ca.State, 64 * 20);
                        long qtdBits = NumberOfSetBits(ret);
                        if (qtdBits == 0)
                            ca.Role232 = DML.CASample.Answer.More0;
                        else if (qtdBits == 64)
                            ca.Role232 = DML.CASample.Answer.More1;
                        else if (qtdBits > 59)
                            ca.Role232 = DML.CASample.Answer.AlmostAll1;
                        else if (qtdBits < 6)
                            ca.Role232 = DML.CASample.Answer.AlmostAll0;
                        else
                            ca.Role232 = DML.CASample.Answer.NotSolved;

                        dal.UpdateRole232Answer(ca);
                    }
                    catch { }
                });
            } while (list.Count > 0);
            realObj.Item2.Set();
        }

        public void ProcessTomsAnswer(object obj)
        {
            Tuple<int, ManualResetEvent> realObj = (Tuple<int, ManualResetEvent>)obj;
            List<DML.CASample> list;
            CAProcessTomsRole caRoleTom = new CAProcessTomsRole();

            do
            {
                lock (Locker)
                {
                    list = dal.GetAnswersPendencies(realObj.Item1, DAL.CASamples.AnswerKind.TomsRole);
                }

                list.ForEach(ca =>
                {
                    try
                    {
                        long ret = caRoleTom.Process(ca.State, 64 * 20);
                        long qtdBits = NumberOfSetBits(ret);
                        if (qtdBits == 0)
                            ca.TomsRole = DML.CASample.Answer.More0;
                        else if (qtdBits == 64)
                            ca.TomsRole = DML.CASample.Answer.More1;
                        else if(qtdBits > 59)
                            ca.TomsRole = DML.CASample.Answer.AlmostAll1;
                        else if (qtdBits < 6)
                            ca.TomsRole = DML.CASample.Answer.AlmostAll0;
                        else
                            ca.TomsRole = DML.CASample.Answer.NotSolved;

                        dal.UpdateTomsRoleAnswer(ca);
                    }
                    catch(Exception e)
                    {
                        ca.TomsRole = DML.CASample.Answer.Pendent;
                        dal.UpdateTomsRoleAnswer(ca);
                    }
                });
            } while (list.Count > 0);

            realObj.Item2.Set();
        }

        long NumberOfSetBits(long i)
        {
            i = i - ((i >> 1) & 0x5555555555555555);
            i = (i & 0x3333333333333333) + ((i >> 2) & 0x3333333333333333);
            return (((i + (i >> 4)) & 0xF0F0F0F0F0F0F0F) * 0x101010101010101) >> 56;
        }
    }

    class CAProcess232Role
    {
        private List<short> _temp0, _temp1;
        private bool _currentTemp;
        static List<int> cellsRange;
        public CAProcess232Role()
        {
            if (cellsRange == null)
            {
                cellsRange = new List<int>(new int[64]);
                for (int i = 0; i < 64; i++)
                    cellsRange[i] = i + 1;
            }
        }


        public long Process(long initialState, int maxSteps)
        {
            _temp0 = new List<short>(new short[66]);
            _temp1 = new List<short>(new short[66]);
            for (int i = 0; i < 64; i++)
                _temp0[i + 1] = (initialState & (1L << i)) > 0 ? (short)1 : (short)0;
            _temp0[0] = _temp0[64];
            _temp0[65] = _temp0[1];            

            for(int i = 0; i < maxSteps; i++)
            {
                List<short> source = _currentTemp ? _temp1 : _temp0;
                List<short> target = _currentTemp ? _temp0 : _temp1;

                foreach(var j in cellsRange)
                    target[j] = (source[j - 1] + source[j] + source[j + 1]) >= 2 ? (short)1 : (short)0;

                target[0] = target[64];
                target[65] = target[1];
                _currentTemp = !_currentTemp;
            }

            List<short> ret = _currentTemp ? _temp1 : _temp0;
            long lret = 0;
            for (int i = 0; i < 64; i++)
                lret |= (((long)ret[i + 1]) << i);
            return lret;
        }
    }

    class CAProcessTomsRole
    {
        private List<List<short>> _temp0, _temp1;
        private bool _currentTemp;
        static List<Tuple<int, int>> cellsRange;

        public CAProcessTomsRole()
        {
            if(cellsRange == null)
            {
                cellsRange = new List<Tuple<int, int>>();
                for (int i = 0; i < 8; i++)
                {
                    for (int j = 0; j < 8; j++)
                        cellsRange.Add(new Tuple<int, int>(i + 1, j + 1));
                }

            }
        }

        public long Process(long initialState, int maxSteps)
        {
            _temp0 = new List<List<short>>();
            _temp1 = new List<List<short>>();

            var temp0 = new List<short>(new short[66]);
            var temp1 = new List<short>(new short[66]);
            for (int i = 0; i < 64; i++)
                temp0[i + 1] = (initialState & (1L << i)) > 0 ? (short)1 : (short)0;
            temp0[0] = temp0[64];
            temp0[65] = temp0[1];

            for(int i = 0; i < 10; i++)
            {
                _temp0.Add(new List<short>());
                _temp0[i].AddRange(new short[] { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 });
                _temp1.Add(new List<short>());
                _temp1[i].AddRange(new short[] { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 });
            }

            for(int i = 1; i < 9; i++)
            {
                for (int j = 1; j < 9; j++)
                    _temp0[i][j] = temp0[((i - 1) * 8) + j];
            }

            for(int w = 0; w < 9; w++)
            {
                _temp0[0][w] = _temp0[8][w];
                _temp0[9][w] = _temp0[1][w];
                _temp0[w][0] = _temp0[w][8];
                _temp0[w][9] = _temp0[w][1];
            }

            for (int i = 0; i < maxSteps; i++)
            {
                List<List<short>> source = _currentTemp ? _temp1 : _temp0;
                List<List<short>> target = _currentTemp ? _temp0 : _temp1;

                foreach(var cel in cellsRange)
                    target[cel.Item1][cel.Item2] = (source[cel.Item1 - 1][cel.Item2] + source[cel.Item1][cel.Item2] + source[cel.Item1][cel.Item2 + 1]) >= 2 ? (short)1 : (short)0;

                for (int w = 0; w < 9; w++)
                {
                    target[0][w] = target[8][w];
                    target[9][w] = target[1][w];
                    target[w][0] = target[w][8];
                    target[w][9] = target[w][1];
                }

                _currentTemp = !_currentTemp;
            }

            List<List<short>> ret = _currentTemp ? _temp1 : _temp0;
            long lret = 0;
            for (int i = 0; i < 9; i++)
            {
                for(int j = 0; j < 9; j++)
                    lret |= (((long)ret[i + 1][j + 1]) << ((i * 8) + j));
            }
            return lret;
        }
    }
}

