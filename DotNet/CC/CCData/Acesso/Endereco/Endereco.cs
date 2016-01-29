using System;
using System.Collections.Generic;
using CCData.Dados;

namespace CCData.Acesso
{
    class Endereco
    {
        private const string CC_SP_GETENID = "CC_SP_ENGETID";
        private const string CC_SP_INSERT = "CC_SP_ENINSERT";

        static public Modelos.Endereco get(int idEndereco)
        {
            Dados.DataAcess data = new Dados.DataAcess();
            List<Campos> campos = null;
            Modelos.Endereco endereco = null;
            Campos param = new Campos();

            param.Add(new Campo("ENID", idEndereco));
            campos = data.requerir(CC_SP_GETENID, param);

            if (campos.Count == 0)
                return endereco;

            endereco                         = new Modelos.Endereco(campos[0]["ENID"].ToInt());
            endereco.rua                     = campos[0]["ENRUA"].ToString();
            endereco.numero                  = campos[0]["ENNUMERO"].ToString();
            endereco.cep                     = campos[0]["ENCEP"].ToString();
            endereco.complemento             = campos[0]["ENCOMPLEMENTO"].ToString();
            endereco.cidade                  = new Modelos.Cidade(campos[0]["ENCDID"].ToInt());
            endereco.cidade.nome             = campos[0]["CDNOME"].ToString();
            endereco.cidade.estado           = new Modelos.Estado(campos[0]["CDESID"].ToInt());
            endereco.cidade.estado.nome      = campos[0]["ESNOME"].ToString();
            endereco.cidade.estado.sigla     = campos[0]["ESSIGLA"].ToString();
            endereco.cidade.estado.pais      = new Modelos.Pais(campos[0]["ESPSID"].ToInt());
            endereco.cidade.estado.pais.nome = campos[0]["PSNOME"].ToString();
            endereco.cidade.estado.pais.nome = campos[0]["PSSIGLA"].ToString();

            return endereco;
        }

        static public void insertNew(Modelos.Endereco endereco)
        {
            Dados.DataAcess data = new Dados.DataAcess();

            Campos param = new Campos();
            param.Add(new Campo("ENRUA", endereco.rua));
            param.Add(new Campo("ENNUMERO", endereco.numero));
            param.Add(new Campo("ENCEP", endereco.cep));
            param.Add(new Campo("ENCOMPLEMENTO", endereco.complemento));
            param.Add(new Campo("ENCDID", endereco.cidade.id));

            data.requerir(CC_SP_INSERT, param);
        }
    }
}
