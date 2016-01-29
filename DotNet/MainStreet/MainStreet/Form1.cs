using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace MainStreet
{
    public partial class frmAgenda : Form
    {
        public frmAgenda()
        {
            InitializeComponent();
        }

        private void addRow(string turma, string integrantesTurma)
        {
            dataGridView1.Rows.Add();
            dataGridView1.Rows[dataGridView1.Rows.Count - 1].Height = 30;
            dataGridView1.Rows[dataGridView1.Rows.Count - 1].HeaderCell.Value = turma;
            dataGridView1.Rows[dataGridView1.Rows.Count - 1].HeaderCell.ToolTipText = integrantesTurma;
        }

        private void setText(int i, int j, string value, Color backColor, Color foreColor)
        {
            dataGridView1.Rows[i].Cells[j].Value = value;
            dataGridView1.Rows[i].Cells[j].Style.BackColor = backColor;
            dataGridView1.Rows[i].Cells[j].Style.ForeColor = foreColor;
        }

        private void frmAgenda_Load(object sender, EventArgs e)
        {
            dataGridView1.RowHeadersWidthSizeMode = DataGridViewRowHeadersWidthSizeMode.AutoSizeToAllHeaders;
            dataGridView1.DefaultCellStyle.WrapMode = DataGridViewTriState.True;
            
            List<tabela> tbs = new List<tabela>();
            tbs.Add(new tabela("t1", "v1"));
            tbs.Add(new tabela("t2", "v2"));
          //  var source = new BindingSource();
            //source.DataSource = tbs;
            dataGridView2.DataSource = tbs;
            /*
            addRow("Turma X", "William\nLeandro");

            setText(0, 1, "Sally\n10h00m : 10h50m", Color.Plum, Color.White);
            setText(0, 4, "Lin\n18h30m : 19h20m", Color.Yellow, Color.Black);

            addRow("Turma Y", "Marcela\nRafael\nMariana");

            setText(1, 3, "Eduardo\n10h00m : 10h50m", Color.Blue, Color.White);
            setText(1, 0, "Cátia\n10h00m : 10h50m", Color.Aquamarine, Color.Black);

            addRow("Turma Z", "Joaquim\nPaulo\nSofia");

            setText(2, 1, "Sally\n10h00m : 10h50m", Color.Plum, Color.White);
            setText(2, 4, "Cátia\n10h00m : 10h50m", Color.Aquamarine, Color.Black);
            setText(2, 2, "Lin\n10h00m : 10h50m", Color.Yellow, Color.Black);*/
        }

        private void dataGridView2_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }

    public class campo
    {
        public string descr { get { return "descr"; } set { descr = value; } }
        override public string ToString()
        {
            return descr;
        }
    }

    public class tabela
    {
        public string campo1 {get; set;}
        public string campo2 {get; set;}
        public campo cam { get; set; }

        public tabela(string campo1, string campo2)
        {
            this.campo1 = campo1;
            this.campo2 = campo2;
            cam = new campo();
        }
    }
}
