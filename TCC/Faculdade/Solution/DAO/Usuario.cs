using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.ComponentModel;

namespace Kairos.DAO
{
    [TypeConverter(typeof(EnumToStringUsingDescription))]
    public enum TipoUsuario
    {
        Administrador,
        [Description("Secretária")] Secretaria,
    }

    class Usuario
    {
        public bool validar(string senha, TipoUsuario tipo)
        {
            string senhaAtual = getSenhaCriptografada(tipo);
            string senhaDigitada = Util.Crypto.Encrypt(senha);
            
            return senhaAtual.Equals(senhaDigitada);
        }

        public void alterarSenha(string senhaAntiga, string novaSenha, TipoUsuario tipo)
        {
            if(!validar(senhaAntiga, tipo))
                throw new Exception("Senha inválida");
            
            novaSenha = Util.Crypto.Encrypt(novaSenha);
            if (tipo == TipoUsuario.Administrador)
                DA.Connect.SQL.execute("Update admin set PASSADM = '" + novaSenha + "'");
            else
                DA.Connect.SQL.execute("Update admin set PASSSECRETARIA = '" + novaSenha + "'");
        }

        public void setarSenhas(string senhaAdm, string senhaSecretaria)
        {
            DataTable dt = DA.Connect.SQL.query("Select * from admin");
            if(dt.Rows.Count == 0)
                DA.Connect.SQL.execute("Insert into admin (PASSADM, PASSSECRETARIA) values ('" + senhaAdm + "','" + senhaSecretaria + "')");
        }

        public bool primeiroAcesso()
        {
            DataTable dt = DA.Connect.SQL.query("Select * from admin");
            return dt.Rows.Count == 0 || (validar("", TipoUsuario.Administrador) && validar("", TipoUsuario.Secretaria));
        }

        private string getSenhaCriptografada(TipoUsuario tipo)
        {
            DataTable dt = DA.Connect.SQL.query("Select * from admin");
            if (dt.Rows.Count == 0)
                return "";
            DataRow row = dt.Rows[0];

            if(tipo == TipoUsuario.Administrador)
                return row["PASSADM"].ToString();
            else
                return row["PASSSECRETARIA"].ToString();
        }
    }
}
