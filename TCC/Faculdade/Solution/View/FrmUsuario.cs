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
    public partial class FrmUsuario : Form
    {
        private DAO.Usuario usuario;
        private Color color;

        public FrmUsuario()
        {
            InitializeComponent();
            usuario = new DAO.Usuario();
            color = Color.Blue;
        }

        private void btnSair_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void FrmUsuario_Load(object sender, EventArgs e)
        {
            cmbUsuario.DataSource = Enum.GetValues(typeof(DAO.TipoUsuario));
            cmbUsuario.SelectedIndex = 0;
        }

        private void btnGravar_Click(object sender, EventArgs e)
        {
            if (usuario.primeiroAcesso())
                usuario.setarSenhas("", "");

            if(!txtSenhaNova.Text.Equals(txtSenhaConfirmacao.Text))
            {
                lblMsg.Text = "Senha de confirmação diferente da senha informada";
                BackColor = Color.Red.Soft;
            }
            else if (txtSenhaNova.Text == "")
            {
                lblMsg.Text = "Senha nova em branco";
                BackColor = Color.Red.Soft;
            }
            else if (usuario.validar(txtSenhaAntiga.Text, (DAO.TipoUsuario)cmbUsuario.SelectedItem))
            {
                usuario.alterarSenha(txtSenhaAntiga.Text, txtSenhaNova.Text, (DAO.TipoUsuario)cmbUsuario.SelectedItem);
                txtSenhaAntiga.Visible = !usuario.validar("", (DAO.TipoUsuario)cmbUsuario.SelectedItem);
                lblSenhaAntiga.Visible = txtSenhaAntiga.Visible;

                txtSenhaAntiga.Text = "";
                txtSenhaNova.Text = "";
                txtSenhaConfirmacao.Text = "";

                BackColor = Color.Green.Hard;
                lblMsg.Text = "Senha alterada com sucesso";
            }
            else
            {
                lblMsg.Text = "Senha antiga inválida";
                BackColor = Color.Red.Soft;
            }
        }

        private void txtSenha_TextChanged(object sender, EventArgs e)
        {
            lblMsg.Text = "";
            BackColor = color.Hard;
            Update();
        }

        private void cmbUsuario_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblMsg.Text = "";
            BackColor = color.Hard;
            Update();

            txtSenhaAntiga.Visible = !usuario.validar("", (DAO.TipoUsuario)cmbUsuario.SelectedItem);
            lblSenhaAntiga.Visible = txtSenhaAntiga.Visible;

            txtSenhaAntiga.Text = "";
            txtSenhaNova.Text = "";
            txtSenhaConfirmacao.Text = "";
        }
    }
}
