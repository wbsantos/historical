using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;

namespace CCData.Dados
{
    class DataAcess
    {
        private string gerarExecSQL(string sqlCommand, Campos parametros)
        {
            string param = string.Empty;

            if(parametros != null)
                for (int i = 0; i < parametros.length; i++)
                    param += "\n\t@" + parametros[i].nome + " = " + parametros[i].ToSringForParam() + ((i < parametros.length - 1) ? "," : "");

            sqlCommand += param + ";";

            return sqlCommand;
        }

        public List<Campos> requerir(string comandoSQL)
        {
            return requerir(comandoSQL, null);
        }

        public List<Campos> requerir(string comandoSQL, Campos parametros) 
        {
            comandoSQL = gerarExecSQL(comandoSQL, parametros);

            OleDbConnection connection = new OleDbConnection(Properties.Settings.Default.UDL);
            OleDbCommand command = new OleDbCommand(comandoSQL, connection);
            OleDbDataReader dataReader = null;
            List<Campos> lsCampos = new List<Campos>();

            try
            {
                connection.Open();
                dataReader = command.ExecuteReader(CommandBehavior.CloseConnection);

                while (dataReader.Read())
                {
                    Campos campos = new Campos();
                    for(int i = 0; i < dataReader.FieldCount; i++)
                        campos.Add(new Campo(dataReader.GetName(i), dataReader.GetValue(i)));
                    lsCampos.Add(campos);
                }
            }
            catch (Exception ex)
            {
                lsCampos = null;
                throw new Exception("Dados.DataAcess.requerir() gerou erro ao buscar dados na Base\nErro original: " + ex.Message);
            }
            finally
            {
                if(dataReader != null)
                    dataReader.Close();
            }

            return lsCampos;
        }
    }
}
