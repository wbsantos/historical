using System;
using System.Collections.Generic;
using System.IO;

namespace DigitRecognitionCA.Digit
{
    public class DigitImage
    {
        public byte[,] Pixels { get; private set; }
        public byte Label { get; private set; }

        public int TotalBlackPixels { get; private set; }

        public const byte BLACK = 255;
        public const byte MIDDLE_BLACK = BLACK / 2;
        public const byte WHITE = 0;
        public const byte ORIGINAL_MATRIX_SIZE = 28;

        public DigitImage(byte[,] pPixels, byte pLabel)
        {
            //Instancia a matriz original
            this.Pixels = new byte[ORIGINAL_MATRIX_SIZE, ORIGINAL_MATRIX_SIZE];
            
            TotalBlackPixels = 0;
            //Preenche matriz original
            for (int i = 0; i < ORIGINAL_MATRIX_SIZE; ++i)
            {
                for (int j = 0; j < ORIGINAL_MATRIX_SIZE; ++j)
                {
                    Pixels[i, j] = pPixels[i, j] > MIDDLE_BLACK ? BLACK : WHITE;
                    if (Pixels[i, j] == BLACK)
                        TotalBlackPixels++;
                }
            }
            Label = pLabel;
        }

        public string Print()
        {
            string s = "";
            for (int i = 0; i < Pixels.GetLength(0); ++i)
            {
                for (int j = 0; j < Pixels.GetLength(1); ++j)
                {
                    if (this.Pixels[i, j] == WHITE)
                        s += " "; // white
                    else if (this.Pixels[i, j] == BLACK)
                        s += "."; // black
                    else
                        s += "O"; // gray
                }
                s += "\n";
            }
            s += this.Label.ToString();
            Console.Write(s);
            return s;
        } 

        public static List<DigitImage> Transform(string imageIDXFilePath, string labelIDXFilePath, int maxToProcess = 0)
        {
            FileStream ifsImages = new FileStream(imageIDXFilePath, FileMode.Open); // test labels
            FileStream ifsLabels = new FileStream(labelIDXFilePath, FileMode.Open); // test images

            BinaryReader brLabels = new BinaryReader(ifsLabels);
            BinaryReader brImages = new BinaryReader(ifsImages);

            int magic1 = brImages.ReadInt32(); // discard
            int numImages = brImages.ReadInt32();
            int numRows = brImages.ReadInt32();
            int numCols = brImages.ReadInt32();

            int magic2 = brLabels.ReadInt32();
            int numLabels = brLabels.ReadInt32();

            byte[,] pixels = new byte[ORIGINAL_MATRIX_SIZE, ORIGINAL_MATRIX_SIZE];

            List<DigitImage> list = new List<DigitImage>(maxToProcess > 0 ? maxToProcess : 60000);
            int countProcessed = 0;
            // each test image
            while (countProcessed < maxToProcess || maxToProcess == 0)
            {
                try
                {
                    for (int i = 0; i < ORIGINAL_MATRIX_SIZE; ++i)
                    {
                        for (int j = 0; j < ORIGINAL_MATRIX_SIZE; ++j)
                        {
                            byte b = brImages.ReadByte();
                            pixels[i, j] = b;
                        }
                    }

                    byte lbl = brLabels.ReadByte();
                    list.Add(new DigitImage(pixels, lbl));
                    countProcessed++;
                }
                catch (EndOfStreamException)
                {
                    break;
                }
            } // each image

            ifsImages.Close();
            brImages.Close();
            ifsLabels.Close();
            brLabels.Close();

            return list;
        }

    }
}
