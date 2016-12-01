using DigitRecognitionCA.CA;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DigitRecognitionCA
{
    public partial class FrmCA : Form
    {
        CellularAutomataManager AutomataManager { get; set; }
        CellularAutomata Automata { get; set; }
        Label [,] VisualMatrix { get; set; }
        private int CurrentCA;
        private const int LABEL_WIDTH = 10;
        private const int LABEL_HEIGHT = 10;

        public FrmCA(CellularAutomataManager pAutomataManager)
        {
            AutomataManager = pAutomataManager;
            Automata = AutomataManager.CellularAutomatas.First();
            CurrentCA = 0;
            
            InitializeComponent();
            DoubleBuffered = true;

            BuildVisualMatrix();
            cbxView.SelectedIndex = 0; //Invoca o evento de Index Changed e chama a função PaintMatrix()
        }

        private void BuildVisualMatrix()
        {
            VisualMatrix = new Label[Automata.Matrix.GetLength(0), Automata.Matrix.GetLength(1)];
            pnlMatrix.Height = Automata.Matrix.GetLength(0) * LABEL_HEIGHT;
            pnlMatrix.Width = Automata.Matrix.GetLength(1) * LABEL_WIDTH;
            
            for (int i = 0; i < Automata.Matrix.GetLength(0); i++)
            {
                for (int j = 0; j < Automata.Matrix.GetLength(1); j++)
                {
                    Label label = new Label();
                    label.AutoSize = false;
                    label.BorderStyle = BorderStyle.FixedSingle;
                    label.Width = LABEL_WIDTH;
                    label.Height = LABEL_HEIGHT;
                    label.Left = j * LABEL_WIDTH;
                    label.Top = i * LABEL_HEIGHT;
                    pnlMatrix.Controls.Add(label);
                    VisualMatrix[i, j] = label;
                }
            }
        }

        private void PaintMatrix()
        {
            for (int i = 0; i < Automata.Matrix.GetLength(0); i++)
            {
                for (int j = 0; j < Automata.Matrix.GetLength(1); j++)
                {
                    if (((Automata.Matrix[i, j] & (0x3L << 62)) != 0))
                    //if (Automata.Matrix[i, j] != 0)
                        VisualMatrix[i, j].BackColor = Color.Black;
                    else
                        VisualMatrix[i, j].BackColor = Color.White;

                    if(cbxView.SelectedIndex > 0)
                    {
                        bool leftActive = chkPaintLeft.Checked && ((Automata.Matrix[i, j] & (0x1L << (cbxView.SelectedIndex - 1 + 0))) != 0),
                             bottomActive = chkPaintBottom.Checked && ((Automata.Matrix[i, j] & (0x1L << (cbxView.SelectedIndex - 1 + 10))) != 0),
                             baseNumber = ((Automata.Matrix[i, j] & (0x1L << (cbxView.SelectedIndex - 1 + 50))) != 0),
                             leftOriginal = chkPaintLeft.Checked && ((Automata.Matrix[i, j] & (0x1L << 63)) != 0) && !((Automata.Matrix[i, j] & (0x1L << (cbxView.SelectedIndex - 1 + 20))) != 0),
                             bottomOriginal = chkPaintBottom.Checked && ((Automata.Matrix[i, j] & (0x1L << 62)) != 0) && !((Automata.Matrix[i, j] & (0x1L << (cbxView.SelectedIndex - 1 + 30))) != 0);

                        if (baseNumber && !leftActive && !bottomActive)
                            VisualMatrix[i, j].BackColor = Color.Red;
                        else if (leftActive && bottomActive)
                            VisualMatrix[i, j].BackColor = Color.Pink;
                        else if (leftActive)
                            VisualMatrix[i, j].BackColor = Color.Green;
                        else if (bottomActive)
                            VisualMatrix[i, j].BackColor = Color.Blue;
                        else if (leftOriginal)
                            VisualMatrix[i, j].BackColor = Color.LightGreen;
                        else if(bottomOriginal)
                            VisualMatrix[i, j].BackColor = Color.LightBlue;
                    }
                }
            }
        }

        private void btnPlay_Click(object sender, EventArgs e)
        {
            automaticPlay.Enabled = !automaticPlay.Enabled;

            btnPlay.Text = automaticPlay.Enabled ? "Pause" : "Play";
            btnNext.Enabled = !automaticPlay.Enabled;

            btnNextCA.Enabled = !automaticPlay.Enabled;
            btnPreviousCA.Enabled = !automaticPlay.Enabled;
        }

        private void automaticPlay_Tick(object sender, EventArgs e)
        {
            Automata.NextCycle();
            PaintMatrix();

            if (Automata.HasFinished)
            {
                btnPlay.PerformClick();
                btnProcessAnswer.PerformClick();
            }
        }

        private void btnNext_Click(object sender, EventArgs e)
        {
            Automata.NextCycle();
            PaintMatrix();
        }

        private void btnPreviousCA_Click(object sender, EventArgs e)
        {
            if ((--CurrentCA) < 0)
                CurrentCA = AutomataManager.CellularAutomatas.Count - 1;
            Automata = AutomataManager.CellularAutomatas[CurrentCA];
            PaintMatrix();
        }

        private void btnNextCA_Click(object sender, EventArgs e)
        {
            if ((++CurrentCA) >= AutomataManager.CellularAutomatas.Count)
                CurrentCA = 0;
            Automata = AutomataManager.CellularAutomatas[CurrentCA];
            PaintMatrix();
        }

        private void cbxView_SelectedIndexChanged(object sender, EventArgs e)
        {
            PaintMatrix();
        }

        private void chkPaintLeft_CheckedChanged(object sender, EventArgs e)
        {
            PaintMatrix();
        }

        private void chkPaintBottom_CheckedChanged(object sender, EventArgs e)
        {
            PaintMatrix();
        }

        private void btnProcessAnswer_Click(object sender, EventArgs e)
        {
            while(!Automata.HasFinished)
                Automata.NextCycle();

            Automata.Evaluate();
            rtxAnswer.Text = Automata.PrintAnswer();
            
        }

        int _totalDone = 0;
        private void btnMassiveProcess_Click(object sender, EventArgs e)
        {
            _totalDone = 0;
            System.Threading.Thread t = 
                new System.Threading.Thread(new System.Threading.ThreadStart(() => 
                {
                    AutomataManager.CellularAutomatas.AsParallel().ForAll(ca => 
                        {
                            while (!ca.HasFinished)
                                ca.NextCycle();
                            ca.ExperimentalEvaluate();
                            _totalDone++;
                            SetTextMemo($"Done: {_totalDone}");
                        });

                    SetTextMemo(AutomataManager.PrintEstatistica());
                } ) );
            t.Start();
            //rtxAnswer.Text = AutomataManager.PrintEstatistica();
        }

        delegate void SetTextCallback(string text);
        private void SetTextMemo(string text)
        {
            // InvokeRequired required compares the thread ID of the
            // calling thread to the thread ID of the creating thread.
            // If these threads are different, it returns true.
            if (this.rtxAnswer.InvokeRequired)
            {
                SetTextCallback d = new SetTextCallback(SetTextMemo);
                this.Invoke(d, new object[] { text });
            }
            else
            {
                this.rtxAnswer.Text = text;
            }
        }
    }
}
