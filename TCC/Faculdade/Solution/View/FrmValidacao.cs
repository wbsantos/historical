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
    public partial class FrmValidacao : Form
    {
        public bool valido { get; private set; }
        public DAO.TipoUsuario tipoUsuario { get; private set; }
        private DAO.Usuario usuario;
        private Color color;

        public FrmValidacao()
        {
            InitializeComponent();
            valido = false;
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

        private void btnEntrar_Click(object sender, EventArgs e)
        {
            tipoUsuario = (DAO.TipoUsuario)cmbUsuario.SelectedItem;
            if (usuario.validar(txtSenha.Text, (DAO.TipoUsuario)cmbUsuario.SelectedItem))
            {
                lblMsg.Text = "Validado com sucesso";
                BackColor = Color.Green.Hard;
                Update();
                System.Threading.Thread.Sleep(800);

                valido = true;
                Close();
            }
            else
            {
                lblMsg.Text = "Senha Inválida";
                BackColor = Color.Red.Soft;
            }
        }

        private void cmbUsuario_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblMsg.Text = "";
            BackColor = color.Hard;
            Update();
        }

        private void txtSenha_TextChanged(object sender, EventArgs e)
        {
            lblMsg.Text = "";
            BackColor = color.Hard;
            Update();
        }
    }
}
