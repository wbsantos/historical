using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;

namespace Kairos
{
    static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);

            DA.Connect.SQL.ManterConexao = true;

            bool valido = false;
            DAO.TipoUsuario tipoUsu = DAO.TipoUsuario.Secretaria;

            DAO.Usuario usu = new DAO.Usuario();
            if (usu.primeiroAcesso())
            {
                View.FrmUsuario frmUsu = new View.FrmUsuario();
                frmUsu.ShowDialog();
                valido = !usu.primeiroAcesso();
                tipoUsu = DAO.TipoUsuario.Administrador;
            }
            else
            {
                View.FrmValidacao frmValidacao = new View.FrmValidacao();
                frmValidacao.ShowDialog();
                valido = frmValidacao.valido;
                tipoUsu = frmValidacao.tipoUsuario;
            }
                        
            if(valido)
                Application.Run(new View.FrmMain(tipoUsu));

            DA.Connect.SQL.ManterConexao = false;
            DA.Connect.SQL.close();
        }
    }
}
