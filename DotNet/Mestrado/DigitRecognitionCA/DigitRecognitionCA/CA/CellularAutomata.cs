﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DigitRecognitionCA.Digit;
using System.IO;
using System.Collections;

namespace DigitRecognitionCA.CA
{
    public class CellularAutomata
    {
        public long[,] Matrix { get; private set; }
        private long[,] MatrixAux { get; set; }
        private DigitImage Digit { get; set; }

        public int CurrentCycle { get; private set; }

        public bool HasFinished { get { return CurrentCycle >= Matrix.GetLength(0); } }

        public int TotalOriginalBits { get; private set; } = 0;
        public int[] TotalLeftBitsHits { get; private set; } = new int[10];
        public int[] TotalBottomBitsHits { get; private set; } = new int[10];
        public int[] TotalSingleBitsHits { get; private set; } = new int[10];
        public int[] TotalBitsToHit { get; private set; } = new int[10];
        public float[] AnswerProbability { get; private set; } = new float[10];

        public int RealAnswer { get { return Digit.Label; } }
        public int PredictedAnswer
        {
            get
            {
                float biggerProbability = AnswerProbability[0];
                int iBiggerProbability = 0;
                for (int i = 1; i < AnswerProbability.GetLength(0); i++)
                {
                    if (AnswerProbability[i] > biggerProbability)
                    {
                        iBiggerProbability = i;
                        biggerProbability = AnswerProbability[i];
                    }
                }
                return iBiggerProbability;
            }
        }
        public bool IsTheCorrectAnswer { get { return PredictedAnswer == RealAnswer; } }

        public CellularAutomata(DigitImage pDigitToEvaluate, long [,] pMatrixBase)
        {
            Digit = pDigitToEvaluate;

            //Instancia a matriz com o autômato celular
            Matrix = new long[DigitImage.ORIGINAL_MATRIX_SIZE * 2, DigitImage.ORIGINAL_MATRIX_SIZE * 2];
            MatrixAux = new long[DigitImage.ORIGINAL_MATRIX_SIZE * 2, DigitImage.ORIGINAL_MATRIX_SIZE * 2];

            //Copia matriz original para o canto superior direito da matriz do autômato
            for (int i = 0; i < DigitImage.ORIGINAL_MATRIX_SIZE; i++)
                for (int j = DigitImage.ORIGINAL_MATRIX_SIZE, k = 0; j < DigitImage.ORIGINAL_MATRIX_SIZE * 2; j++, k++)
                    Matrix[i, j] = pMatrixBase[i, k];

            //Copia matriz original para o canto superior esquerdo da matriz do autômato
            for (int i = 0; i < DigitImage.ORIGINAL_MATRIX_SIZE; ++i)
                for (int j = 0; j < DigitImage.ORIGINAL_MATRIX_SIZE; j++)
                    Matrix[i, j] = Digit.Pixels[i, j] == DigitImage.BLACK ? (0x1L << 63) | (0x3FFL << 20) : 0x0; ;

            //Copia matriz original para o canto inferior direito da matriz do autômato
            for (int i = DigitImage.ORIGINAL_MATRIX_SIZE, k = 0; i < DigitImage.ORIGINAL_MATRIX_SIZE * 2; i++, k++)
                for (int j = DigitImage.ORIGINAL_MATRIX_SIZE, w = 0; j < DigitImage.ORIGINAL_MATRIX_SIZE * 2; j++, w++)
                    Matrix[i, j] = Digit.Pixels[k, w] == DigitImage.BLACK ? (0x1L << 62) | (0x3FFL << 30) : 0x0;

            CurrentCycle = 0;
        }

        public string PrintAnswer()
        {
            StringBuilder str = new StringBuilder();
            str.AppendLine("TotalOriginalBits = " + TotalOriginalBits.ToString());
            str.AppendLine("RealAnswer = " + RealAnswer.ToString());
            str.AppendLine("PredictedAnswer = " + PredictedAnswer.ToString());
            str.AppendLine("\n");
            str.AppendLine("TotalLeftBitsHits    TotalBottomBitsHits  TotalSingleBitsHits  TotalBitsToHit       AnswerProbability    Number");
            str.AppendLine("-------------------- -------------------- -------------------- -------------------- -------------------- --------------------");
            for(int i = 0; i < 10; i++)
                str.AppendLine(string.Concat(TotalLeftBitsHits[i].ToString().PadRight(21), 
                                             TotalBottomBitsHits[i].ToString().PadRight(21),
                                             TotalSingleBitsHits[i].ToString().PadRight(21),
                                             TotalBitsToHit[i].ToString().PadRight(21), 
                                             AnswerProbability[i].ToString("N5").PadRight(21),
                                             i.ToString().PadRight(21)));

            return str.ToString();
        }

        public void NextCycle()
        {
            int previousJ, nextI;
            long baseValue,
                 bitsOnLeftToSpend, bitsOnBottomToSpend,
                 currentBitsFromLeftSpent, currentBitsFromBottomSpent,
                 newBitsFromLeftToSpend, newBitsFromBottomToSpend,
                 newCurrentBitsFromLeftSpent, newCurrentBitsFromBottomSpent,
                 lastTwoBits;


            for (int i = 0; i < Matrix.GetLength(0); i++)
            {
                for (int j = 0; j < Matrix.GetLength(1); j++)
                {
                    previousJ = j - 1 < 0 ? Matrix.GetLength(0) - 1 : j - 1;
                    nextI = i + 1 >= Matrix.GetLength(1) ? 0 : i + 1;

                    MatrixAux[i, j] = Matrix[i, j];
                    lastTwoBits = 0x0;

                    baseValue = ((Matrix[i, j] >> 50) & 0x3FF);
                    newBitsFromLeftToSpend = bitsOnLeftToSpend = ((Matrix[i, previousJ] >> 20) & 0x3FFL);
                    newBitsFromBottomToSpend = bitsOnBottomToSpend = ((Matrix[nextI, j] >> 30) & 0x3FFL);

                    newCurrentBitsFromLeftSpent = currentBitsFromLeftSpent = ((Matrix[i, j] >> 0) & 0x3FFL);
                    newCurrentBitsFromBottomSpent = currentBitsFromBottomSpent = ((Matrix[i, j] >> 10) & 0x3FFL);

                    if ((Matrix[i, previousJ] & (0x1L << 63)) != 0)//BIT on the left cell is on
                    {
                        newBitsFromLeftToSpend = (bitsOnLeftToSpend & ~(bitsOnLeftToSpend & baseValue));
                        newBitsFromLeftToSpend |= currentBitsFromLeftSpent;
                        newCurrentBitsFromLeftSpent = (currentBitsFromLeftSpent | (bitsOnLeftToSpend & baseValue));
                        lastTwoBits |= (0x1L << 1);
                    }
                    if ((Matrix[nextI, j] & (0x1L << 62)) != 0)//BIT on the bottom cell is on
                    {
                        newBitsFromBottomToSpend = (bitsOnBottomToSpend & ~(bitsOnBottomToSpend & baseValue));
                        newBitsFromBottomToSpend |= newCurrentBitsFromBottomSpent;
                        newCurrentBitsFromBottomSpent = (currentBitsFromBottomSpent | (bitsOnBottomToSpend & baseValue));
                        lastTwoBits |= (0x1L << 0);
                    }

                    MatrixAux[i, j] = (lastTwoBits << 62) | 
                                      (baseValue << 50) | 
                                      (newBitsFromBottomToSpend << 30) | 
                                      (newBitsFromLeftToSpend << 20) | 
                                      (newCurrentBitsFromBottomSpent << 10) | 
                                      (newCurrentBitsFromLeftSpent << 00);
                }
            }

            //Realizando a troca do espaço de memória auxiliar para o principal
            long[,] exchange = Matrix;
            Matrix = MatrixAux;
            MatrixAux = exchange;
            CurrentCycle++;
        }

        public void Evaluate()
        {
            long currentBitsFromLeftSpent, currentBitsFromBottomSpent, baseValue;
            TotalOriginalBits = 0;
            TotalLeftBitsHits = new int[10];
            TotalBottomBitsHits = new int[10];
            TotalSingleBitsHits = new int[10];
            TotalBitsToHit = new int[10];
            AnswerProbability = new float[10];


            for (int i = 0; i < Matrix.GetLength(0); i++)
            {
                for (int j = 0; j < Matrix.GetLength(1); j++)
                {
                    baseValue = ((Matrix[i, j] >> 50) & 0x3FF);
                    currentBitsFromLeftSpent = ((Matrix[i, j] >> 0) & 0x3FFL);
                    currentBitsFromBottomSpent = ((Matrix[i, j] >> 10) & 0x3FFL);

                    for (int k = 0; k < 10; k++)
                        if ((baseValue & (0x1L << k)) != 0)
                            TotalBitsToHit[k]++;

                    for (int k = 0; k < 10; k++)
                        if ((currentBitsFromLeftSpent & (0x1L << k)) != 0)
                            TotalLeftBitsHits[k]++;

                    for (int k = 0; k < 10; k++)
                        if ((currentBitsFromBottomSpent & (0x1L << k)) != 0)
                            TotalBottomBitsHits[k]++;

                    for (int k = 0; k < 10; k++)
                        if (((currentBitsFromBottomSpent & (0x1L << k)) != 0) || ((currentBitsFromLeftSpent & (0x1L << k)) != 0))
                            TotalSingleBitsHits[k]++;

                    if ((Matrix[i, j] & (0x1L << 63)) != 0)//BIT on the left cell is on
                        TotalOriginalBits++;
                }
            }

            for (int k = 0; k < 10; k++)
            {
                List<float> porcentagens = new List<float>(4);
                porcentagens.Add(((float)TotalLeftBitsHits[k] / TotalBitsToHit[k]) * 0.76f);
                porcentagens.Add(((float)TotalLeftBitsHits[k] / TotalOriginalBits) * 0.6f);
                //porcentagens.Add(((float)TotalBottomBitsHits[k] / TotalBitsToHit[k]));
                porcentagens.Add(((float)TotalBottomBitsHits[k] / TotalOriginalBits) * 0.12f);
                //porcentagens.Add(((float)TotalSingleBitsHits[k] / TotalBitsToHit[k]));

                AnswerProbability[k] = (porcentagens.Where(f => !float.IsNaN(f)).Sum());// / porcentagens.Count()) * 100;
            }
        }
        #region Experimental
        public void ExperimentalEvaluate()
        {
            long currentBitsFromLeftSpent, currentBitsFromBottomSpent, baseValue;
            TotalOriginalBits = 0;
            TotalLeftBitsHits = new int[10];
            TotalBottomBitsHits = new int[10];
            TotalSingleBitsHits = new int[10];
            TotalBitsToHit = new int[10];
            AnswerProbability = new float[10];


            for (int i = 0; i < Matrix.GetLength(0); i++)
            {
                for (int j = 0; j < Matrix.GetLength(1); j++)
                {
                    baseValue = ((Matrix[i, j] >> 50) & 0x3FF);
                    currentBitsFromLeftSpent = ((Matrix[i, j] >> 0) & 0x3FFL);
                    currentBitsFromBottomSpent = ((Matrix[i, j] >> 10) & 0x3FFL);

                    for (int k = 0; k < 10; k++)
                        if ((baseValue & (0x1L << k)) != 0)
                            TotalBitsToHit[k]++;

                    for (int k = 0; k < 10; k++)
                        if ((currentBitsFromLeftSpent & (0x1L << k)) != 0)
                            TotalLeftBitsHits[k]++;

                    for (int k = 0; k < 10; k++)
                        if ((currentBitsFromBottomSpent & (0x1L << k)) != 0)
                            TotalBottomBitsHits[k]++;

                    for (int k = 0; k < 10; k++)
                        if (((currentBitsFromBottomSpent & (0x1L << k)) != 0) || ((currentBitsFromLeftSpent & (0x1L << k)) != 0))
                            TotalSingleBitsHits[k]++;

                    if ((Matrix[i, j] & (0x1L << 63)) != 0)//BIT on the left cell is on
                        TotalOriginalBits++;
                }
            }

            /*
            PESOAMIN               PESOAMAX               PESOBMIN               PESOBMAX               PESOCMIN               PESOCMAX               PESODMIN               PESODMAX               PESOEMIN               PESOEMAX               TOTALAVG
            ---------------------- ---------------------- ---------------------- ---------------------- ---------------------- ---------------------- ---------------------- ---------------------- ---------------------- ---------------------- -----------
            0,4                    1                      0,2                    1                      0                      0,2                    0                      0,6                    0                      0,6                    5648
 
             * */
            float current = 0, step = 0, limit = 0;

            List<float> pesosA = new List<float>();
            current = 0.4F; limit = 1; step = (limit - current) / 5f;
            for (; current <= limit; current += step)
                pesosA.Add(current);

            List<float> pesosB = new List<float>();
            current = 0F; limit = 1; step = (limit - current) / 5f;
            for (; current <= limit; current += step)
                pesosB.Add(current);

            List<float> pesosC = new List<float>();
            current = 0F; limit = 1; step = (limit - current) / 5f;
            for (; current <= limit; current += step)
                pesosC.Add(current);

            List<float> pesosD = new List<float>();
            current = 0F; limit = 0.6f; step = (limit - current) / 5f;
            for (; current <= limit; current += step)
                pesosD.Add(current);

            List<float> pesosE = new List<float>();
            current = 0F; limit = 0.6f; step = (limit - current) / 5f;
            for (; current <= limit; current += step)
                pesosE.Add(current);

            bool correctAnswerFound = false;

            for (int a = 0; a < pesosA.Count; a++)
            {
                for (int b = 0; b < pesosB.Count; b++)
                {
                    for (int c = 0; c < pesosC.Count; c++)
                    {
                        for (int d = 0; d < pesosD.Count; d++)
                        {
                            for (int e = 0; e < pesosE.Count; e++)
                            {
                                for (int k = 0; k < 10; k++)
                                {
                                    List<float> porcentagens = new List<float>(4);
                                    porcentagens.Add(((float)TotalLeftBitsHits[k] / TotalBitsToHit[k]) * pesosA[a]);
                                    porcentagens.Add(((float)TotalLeftBitsHits[k] / TotalOriginalBits) * pesosB[b]);
                                    porcentagens.Add(((float)TotalBottomBitsHits[k] / TotalBitsToHit[k]) * pesosC[c]);
                                    porcentagens.Add(((float)TotalBottomBitsHits[k] / TotalOriginalBits) * pesosD[d]);
                                    porcentagens.Add(((float)TotalSingleBitsHits[k] / TotalBitsToHit[k]) * pesosE[e]);

                                    AnswerProbability[k] = (porcentagens.Where(f => !float.IsNaN(f)).Sum());// / porcentagens.Count()) * 100;
                                }
                                if (IsTheCorrectAnswer)
                                {
                                    correctAnswerFound = true;
                                    lock (Locker)
                                    {
                                        var peso = PesosMaisUsados.FirstOrDefault(p =>
                                                                                    p.PesoA == pesosA[a] &&
                                                                                    p.PesoB == pesosB[b] &&
                                                                                    p.PesoC == pesosC[c] &&
                                                                                    p.PesoD == pesosD[d] &&
                                                                                    p.PesoE == pesosE[e]);
                                        if (peso == null)
                                        {
                                            PesosMaisUsados.Add(new EstatisticaPesos(
                                                                                        pesosA[a],
                                                                                        pesosB[b],
                                                                                        pesosC[c],
                                                                                        pesosD[d],
                                                                                        pesosE[e],
                                                                                        1));
                                        }
                                        else
                                            peso.Total++;
                                    }
                                }
                            }
                        }
                    }
                }
            }

            if (!correctAnswerFound)
            {
                lock (Locker)
                {
                    var peso = PesosMaisUsados.FirstOrDefault(p =>
                                                                p.PesoA == -1 &&
                                                                p.PesoB == -1 &&
                                                                p.PesoC == -1 &&
                                                                p.PesoD == -1 &&
                                                                p.PesoE == -1);
                    if (peso == null)
                    {
                        PesosMaisUsados.Add(new EstatisticaPesos(
                                                                    -1,
                                                                    -1,
                                                                    -1,
                                                                    -1,
                                                                    -1,
                                                                    1));
                    }
                    else
                        peso.Total++;
                }
            }
        }

        private static object Locker = new object();
        public class EstatisticaPesos
        {
            public float PesoA;
            public float PesoB;
            public float PesoC;
            public float PesoD;
            public float PesoE;
            public int Total;

            public EstatisticaPesos(
                                    float pPesoA,
                                    float pPesoB,
                                    float pPesoC,
                                    float pPesoD,
                                    float pPesoE,
                                    int pTotal)
            {
                PesoA = pPesoA;
                PesoB = pPesoB;
                PesoC = pPesoC;
                PesoD = pPesoD;
                PesoE = pPesoE;
                Total = pTotal;
            }
        }

        public static List<EstatisticaPesos> PesosMaisUsados { get; private set; } = new List<EstatisticaPesos>();

        #endregion
    }
}
