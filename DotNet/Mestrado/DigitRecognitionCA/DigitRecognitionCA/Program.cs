using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO;
using DigitRecognitionCA.CA;

namespace DigitRecognitionCA
{

    class Program
    {
        static void Main(string[] args)
        {
            Application.SetCompatibleTextRenderingDefault(false);
            Application.EnableVisualStyles();

            var lista = Digit.DigitImage.Transform(@"..\..\train-images.idx3-ubyte",
                                                   @"..\..\train-labels.idx1-ubyte",
                                                   10000);
            CellularAutomataManager cm = new CellularAutomataManager(lista);

            FrmCA frm = new FrmCA(cm);            
            Application.Run(frm);
        } // Main
    } // Program
    
}
