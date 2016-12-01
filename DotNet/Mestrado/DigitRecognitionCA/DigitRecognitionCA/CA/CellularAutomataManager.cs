using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DigitRecognitionCA.Digit;

namespace DigitRecognitionCA.CA
{
    public class CellularAutomataManager
    {
        private int QTD_AMOSTRA = 1;
        public List<DigitImage> DigitsToEvaluate { get; private set; }
        public List<DigitImage> DigitsBase { get; private set; }
        public List<CellularAutomata> CellularAutomatas { get; private set; }

        public CellularAutomataManager(List<DigitImage> pDigitsToEvaluate)
        {
            DigitsToEvaluate = pDigitsToEvaluate;

            DigitsBase = new List<DigitImage>();

            for (int k = 0; k < QTD_AMOSTRA; k++)
            {
                for (int i = 0; i <= 9; i++)
                    DigitsBase.Add(DigitsToEvaluate.Where(d => !DigitsBase.Contains(d)).FirstOrDefault(d => d.Label == i));
            }
            DigitsBase.RemoveAll(d => d == null);

            if (DigitsBase.Count < 10)
                throw new Exception("Não há digitos suficientes para avaliação, necessário ao menos um de cada (de 0 à 9).");

            DigitsToEvaluate.RemoveAll(de => DigitsBase.Contains(de));
            long[,] matrixBase = BuildMatrixBase();
            CellularAutomatas = new List<CellularAutomata>(DigitsToEvaluate.Select(d => new CellularAutomata(d, matrixBase)));
        }

        private long[,] BuildMatrixBase()
        {
            long[,] matrixBase = new long[DigitImage.ORIGINAL_MATRIX_SIZE, DigitImage.ORIGINAL_MATRIX_SIZE];

            for(int i = 0; i < matrixBase.GetLength(0); i++)
            {
                for(int j = 0; j < matrixBase.GetLength(1); j++)
                {
                    foreach (DigitImage digit in DigitsBase)
                        matrixBase[i, j] |= (digit.Pixels[i, j] == DigitImage.BLACK ? 1L << (digit.Label + 50) : 0L);
                }
            }

            return matrixBase;
        }

        public string PrintEstatistica()
        {
            StringBuilder str = new StringBuilder();
            str.AppendLine("Total: " + CellularAutomatas.Count());
            str.AppendLine("Corretos: " + CellularAutomatas.Where(ca => ca.IsTheCorrectAnswer).Count());
            str.AppendLine("\n");
            str.AppendLine("PESO A               PESO B               PESO C               PESO D               PESO E               TOTAL");
            str.AppendLine("-------------------- -------------------- -------------------- -------------------- -------------------- --------------------");
            foreach (var peso in CellularAutomata.PesosMaisUsados.OrderByDescending(o => o.Total))
                str.AppendLine(string.Concat(peso.PesoA.ToString().PadRight(21),
                                             peso.PesoB.ToString().PadRight(21),
                                             peso.PesoC.ToString().PadRight(21),
                                             peso.PesoD.ToString().PadRight(21),
                                             peso.PesoE.ToString().PadRight(21),
                                             peso.Total.ToString().PadRight(21)));

            return str.ToString();
        }
    }
}
