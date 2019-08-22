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
    public partial class FrmMain : Form
    {
        public FrmMain(DAO.TipoUsuario tipoUsuario)
        {
            InitializeComponent();
            if (IsMdiContainer)
            {
                foreach (Control control in this.Controls)
                {
                    MdiClient client = control as MdiClient;
                    if (!(client == null))
                    {
                        client.BackColor = BackColor;
                        break;
                    }
                }
            }

            if(tipoUsuario == DAO.TipoUsuario.Secretaria)
                permissaoLimitada(this);
        }

        private void permissaoLimitada(Control control)
        {
            foreach (Control item in control.Controls)
            {
                if (item is TextBox)
                    ((TextBox)item).ReadOnly = true;
                else if (item is ComboBox)
                    ((ComboBox)item).DropDownStyle = ComboBoxStyle.DropDownList;
                else if (item is Button || item is NumericUpDown || item is DateTimePicker)
                    item.Enabled = false;
                else if (item.Controls.Count > 0 && !(item is UcGrade))
                    permissaoLimitada(item);
            }
        }

        private void btnAlterarUsuario_Click(object sender, EventArgs e)
        {
            FrmUsuario frm = new FrmUsuario();
            frm.ShowDialog();
        }
    }
}
