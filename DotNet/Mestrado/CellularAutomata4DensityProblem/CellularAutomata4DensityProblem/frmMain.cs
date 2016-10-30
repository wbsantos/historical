using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CellularAutomata4DensityProblem
{
    public partial class frmMain : Form
    {
        public frmMain()
        {
            InitializeComponent();
        }

        private void btnCreateInitialStates_Click(object sender, EventArgs e)
        {
            BLL.CASamples bll = new BLL.CASamples();
            bll.CreateSamples(1000000);
            MessageBox.Show("Testes criados com sucesso.");
        }

        private void btnCorrectAnswers_Click(object sender, EventArgs e)
        {
            BLL.CAProcess bll = new BLL.CAProcess();
            bll.ProcessCorrectAnswer();
            MessageBox.Show("Respostas processadas com sucesso.");
        }

        private void btnProcessCA_Click(object sender, EventArgs e)
        {
            BLL.CAProcess bll = new BLL.CAProcess();
            bll.Process();
            MessageBox.Show("Respostas processadas com sucesso.");
        }
    }
}
