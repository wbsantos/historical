using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace Kairos.View
{
    public partial class FrmLoad : Form
    {
        private Color color;

        public bool finalizarQuandoCompletar = false;
        public string Caption { get { return lblMsg.Text; } set { lblMsg.Text = value; Update(); } }

        public FrmLoad()
        {
            InitializeComponent();
            color = Color.Blue;
        }

        public void setMaxValue(int value)
        {
            progressBar.Value = 0;
            progressBar.Maximum = value;
        }

        public void addProgress(int value)
        {
            progressBar.Value += value;

            if (progressBar.Value == progressBar.Maximum)
            {
                if (finalizarQuandoCompletar)
                {
                    lblMsg.Text = "Grade gerada com sucesso";
                    BackColor = Color.Green.Hard;
                    Update();
                    System.Threading.Thread.Sleep(800);
                    Close();
                }
            }
        }
    }
}
