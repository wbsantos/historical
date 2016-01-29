using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using CCData.Modelos;
using Acesso = CCData.Acesso;

namespace CCTest
{
    public partial class frmPaises : Form
    {
        public frmPaises()
        {
            InitializeComponent();
        }

        private void btnOk_Click(object sender, EventArgs e)
        {
            List<Pais> ps = Acesso.Pais.getAll();

            for (int i = 0; i < ps.Count; i++)
                lstPaises.Items.Add(Convert.ToString(ps[i].id) + " - " + ps[i].sigla + " / " + ps[i].nome);
        }

        private void btnVoltar_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void btnInserir_Click(object sender, EventArgs e)
        {
            Pais pais = new Pais();
            pais.nome = txtNome.Text;
            pais.sigla = txtSigla.Text;
            Acesso.Pais.insertNew(pais);
        }
    }
}
