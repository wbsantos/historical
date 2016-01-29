using System;
using System.Collections.Generic;
using CCData.Dados;

namespace CCData.Acesso
{
    //Classe de acesso à tabela País
    public class Pais
    {
        private const string CC_SP_GETALL = "CC_SP_PSGETALL";
        private const string CC_SP_INSERT = "CC_SP_PSINSERT";

        static public List<Modelos.Pais> getAll()
        {
            Dados.DataAcess data = new Dados.DataAcess();
            List<Campos> campos = data.requerir(CC_SP_GETALL);
            List<Modelos.Pais> paises = new List<Modelos.Pais>();

            for (int i = 0; i < campos.Count; i++)
            {
                Modelos.Pais pais = new Modelos.Pais(campos[i]["PSID"].ToInt());

                pais.nome = campos[i]["PSNOME"].ToString();
                pais.sigla = campos[i]["PSSIGLA"].ToString();

                paises.Add(pais);
            }

            return paises;
        }

        static public void insertNew(Modelos.Pais pais)
        {
            Dados.DataAcess data = new Dados.DataAcess();

            Campos param = new Campos();
            param.Add(new Campo("PSNOME", pais.nome));
            param.Add(new Campo("PSSIGLA", pais.sigla));

            data.requerir(CC_SP_INSERT, param);            
        }
    }
}