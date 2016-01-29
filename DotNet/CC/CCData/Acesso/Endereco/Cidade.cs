using System;
using System.Collections.Generic;
using CCData.Dados;

namespace CCData.Acesso
{
    class Cidade
    {
        private const string CC_SP_GETESID = "CC_SP_CDGETESID";
        private const string CC_SP_INSERT = "CC_SP_CDINSERT";

        static public List<Modelos.Cidade> get(Modelos.Estado estado)
        {
            Dados.DataAcess data = new Dados.DataAcess();
            List<Campos> campos = null;
            List<Modelos.Cidade> cidades = new List<Modelos.Cidade>();
            Campos param = new Campos();

            param.Add(new Campo("CDESID", estado.id));
            campos = data.requerir(CC_SP_GETESID, param);

            for (int i = 0; i < campos.Count; i++)
            {
                Modelos.Cidade cidade = new Modelos.Cidade(campos[i]["CDID"].ToInt());

                cidade.nome             = campos[i]["CDNOME"].ToString();
                cidade.estado           = estado;

                cidades.Add(cidade);
            }

            return cidades;
        }

        static public void insertNew(Modelos.Cidade cidade)
        {
            Dados.DataAcess data = new Dados.DataAcess();

            Campos param = new Campos();
            param.Add(new Campo("CDNOME", cidade.nome));
            param.Add(new Campo("CDESID", cidade.estado.id));

            data.requerir(CC_SP_INSERT, param);
        }
    }
}
