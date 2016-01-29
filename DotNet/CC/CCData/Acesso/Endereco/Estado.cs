using System;
using System.Collections.Generic;
using CCData.Dados;

namespace CCData.Acesso
{
    class Estado
    {
        private const string CC_SP_GETPSID = "CC_SP_ESGETPSID";
        private const string CC_SP_INSERT = "CC_SP_ESINSERT";

        static public List<Modelos.Estado> get(Modelos.Pais pais)
        {
            Dados.DataAcess data = new Dados.DataAcess();
            List<Campos> campos = null;
            List<Modelos.Estado> estados = new List<Modelos.Estado>();
            Campos param = new Campos();

            param.Add(new Campo("ESPSID", pais.id));
            campos = data.requerir(CC_SP_GETPSID, param);

            for (int i = 0; i < campos.Count; i++)
            {
                Modelos.Estado estado = new Modelos.Estado(campos[i]["ESID"].ToInt());

                estado.nome         = campos[i]["ESNOME"].ToString();
                estado.sigla        = campos[i]["ESSIGLA"].ToString();
                estado.pais         = pais;

                estados.Add(estado);
            }

            return estados;
        }

        static public void insertNew(Modelos.Estado estado)
        {
            Dados.DataAcess data = new Dados.DataAcess();

            Campos param = new Campos();
            param.Add(new Campo("ESNOME", estado.nome));
            param.Add(new Campo("ESSIGLA", estado.sigla));
            param.Add(new Campo("ESPSID", estado.pais.id));

            data.requerir(CC_SP_INSERT, param);
        }
    }
}
