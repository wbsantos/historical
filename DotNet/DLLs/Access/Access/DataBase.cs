using System;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Xml;
using System.Collections.Generic;

namespace Access
{
    public class DataBase :IDisposable
    {

        #region Static Methods
        /// <summary>
        /// Objeto utilizado para controle de sincronia, pois não pode haver duas adições ao dicionário simultâneas
        /// </summary>
        private static object _syncControl = new object();
        /// <summary>
        /// Objeto para armazenar em memória as regras de acesso, de modo a não ir sempre ao banco realizar esse levantamento
        /// </summary>
        private static Dictionary<string, DataSet> _regrasAcesso;
        /// <summary>
        /// Objeto para armazenar em memória as regras de acesso, de modo a não ir sempre ao banco realizar esse levantamento
        /// </summary>
        private static Dictionary<string, DataSet> RegrasAcesso
        {
            get
            {
                if(_regrasAcesso == null)
                    _regrasAcesso = new Dictionary<string, DataSet>();
                return _regrasAcesso;
            }
            set
            {
                _regrasAcesso = value;
            }
        }

        /// <summary>
        /// Retorna dados dos select's na procedure
        /// </summary>
        /// <param name="procedure">Nome da procedure</param>
        /// <param name="parametros">Vetor com parâmetros da procedure</param>
        /// <returns>DataSet com o retorno da procedure</returns>
        public static DataSet GetData(string procedure, object[] parametros = null)
        {
            int ret;
            return ExecuteProcedure(procedure, parametros, false, out ret);
        }

        /// <summary>
        /// Retorna dados dos select's na procedure
        /// </summary>
        /// <param name="procedure">Nome da procedure</param>
        /// <param name="parametros">Vetor com parâmetros da procedure</param>
        /// <param name="retorno">return da proc</param>
        /// <returns>DataSet com o retorno da procedure</returns>
        public static DataSet GetData(string procedure, out int retorno)
        {
            return ExecuteProcedure(procedure, null, false, out retorno);
        }

        /// <summary>
        /// Retorna dados dos select's na procedure
        /// </summary>
        /// <param name="procedure">Nome da procedure</param>
        /// <param name="parametros">Vetor com parâmetros da procedure</param>
        /// <param name="retorno">return da proc</param>
        /// <returns>DataSet com o retorno da procedure</returns>
        public static DataSet GetData(string procedure, object[] parametros, out int retorno)
        {
            return ExecuteProcedure(procedure, parametros, false, out retorno);
        }

        /// <summary>
        /// Executa uma procedure sem trazer tabela de retorno
        /// </summary>
        /// <param name="procedure">Nome da procedure</param>
        /// <param name="parametros">Vetor com parâmetros da procedure</param>
        public static void ExecuteNonQuery(string procedure, object[] parametros)
        {
            int ret;
            ExecuteProcedure(procedure, parametros, true, out ret);
        }

        /// <summary>
        /// Executa uma proc sem trazer tabela de retorno
        /// </summary>
        /// <param name="procedure">Nome da procedure</param>
        /// <param name="parametros">Vetor com parâmetros da procedure</param>
        /// <param name="retorno">return da proc</param>
        public static void ExecuteNonQuery(string procedure, object[] parametros, out int retorno)
        {
            ExecuteProcedure(procedure, parametros, true, out retorno);
        }

        /// <summary>
        /// Executa a procedure efetivamente
        /// </summary>
        /// <param name="procedure">nome da procedure</param>
        /// <param name="parametros">vetor com parâmetros da procedure</param>
        /// <param name="executeNonQuery">trazer dataset de retorno?</param>
        /// <param name="retorno">return da procedure</param>
        /// <returns></returns>
        private static DataSet ExecuteProcedure(string procedure, object[] parametros, bool executeNonQuery, out int retorno)
        {
            retorno = -1;
            DataSet dataSet = null;
            SqlConnection connection = new SqlConnection(Properties.Default.ConnectionString);
            SqlCommand command = new SqlCommand(procedure, connection);
            command.CommandType = CommandType.StoredProcedure;

            try
            {
                connection.Open();

                FillParametersForCall(command.Parameters, parametros, GetParametersDefinition(connection, procedure).Tables[0].Rows);
                if (executeNonQuery)
                    command.ExecuteNonQuery();
                else
                {
                    dataSet = new DataSet();
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    adapter.Fill(dataSet);
                }
                retorno = FillParametersReturned(command.Parameters, parametros);

                if (dataSet != null && dataSet.Tables != null && dataSet.Tables.Count > 0)
                {
                    foreach (DataTable item in dataSet.Tables)
                    {
                        if (item.Rows.Count > 0)
                            return dataSet;
                    }
                }
                return null;
            }
            catch (Exception ex)
            {
                dataSet = null;
                throw new Exception("Acesso.DataBase.Get() gerou erro ao buscar dados na Base\nErro original: " + ex.Message);
            }
            finally
            {
                connection.Close();
            }
        }

        /// <summary>
        /// Retorna as regras de acesso da procedure (seus parâmetros e tipos)
        /// </summary>
        /// <param name="connection">Conexão que está sendo usada (previamente aberta)</param>
        /// <param name="procedureName">Nome da procedure</param>
        /// <returns></returns>
        private static DataSet GetParametersDefinition(SqlConnection connection, string procedureName)
        {
            DataSet dataSet = null;

            if (RegrasAcesso.TryGetValue(procedureName, out dataSet))
                return dataSet;

            lock (_syncControl)
            {
                if (RegrasAcesso.TryGetValue(procedureName, out dataSet))
                    return dataSet;

                SqlCommand command = new SqlCommand("SP_GETPROCEDUREPARAMETERS", connection);
                command.CommandType = CommandType.StoredProcedure;

                SqlParameter retAdded = command.Parameters.Add("RETURN_VALUE", SqlDbType.Int);
                retAdded.Direction = ParameterDirection.ReturnValue;
                SqlParameter paramAdded = command.Parameters.Add("@PROCEDURENAME", SqlDbType.VarChar);
                paramAdded.Value = procedureName;
                paramAdded.Direction = ParameterDirection.Input;

                dataSet = new DataSet();
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                adapter.Fill(dataSet);

                RegrasAcesso.Add(procedureName, dataSet);
            }

            return dataSet;
        }

        /// <summary>
        /// Preenche os parâmetros de retorno da proc quando output
        /// </summary>
        /// <param name="procParameters">Parâmetros da procedure</param>
        /// <param name="parametersValues">Vetor com os valores dos parâmetros da procedure</param>
        /// <returns>return da procedure</returns>
        private static int FillParametersReturned(SqlParameterCollection procParameters, object[] parametersValues)
        {
            int retorno = 0;
            for (int i = 0; i < procParameters.Count; i++)
            {
                switch (procParameters[i].Direction)
                {
                    case ParameterDirection.InputOutput:
                    case ParameterDirection.Output:
                        parametersValues[i - 1] = procParameters[i].Value;
                        break;
                }
                if (procParameters[i].Direction == ParameterDirection.ReturnValue)
                    retorno = (int)procParameters[i].Value;
            }
            return retorno;
        }

        /// <summary>
        /// Preenche lista de parâmetros para chamada da procedure
        /// </summary>
        /// <param name="procedureParameters">Parâmetros da procedure (será preenchido na função)</param>
        /// <param name="parametersValues">Dados a serem usados no preenchimento da lista de parâmetros</param>
        /// <param name="parametersDefinition">Definição dos parâmetros (nomes e tipos)</param>
        private static void FillParametersForCall(SqlParameterCollection procedureParameters, object[]parametersValues, DataRowCollection parametersDefinition)
        {
            SqlParameter retAdded = procedureParameters.Add("RETURN_VALUE", SqlDbType.Int);
            retAdded.Direction = ParameterDirection.ReturnValue;

            if (parametersValues == null)
                return;

            for (int i = 0; i < parametersValues.Length; i++)
            {
                string paramName = parametersDefinition[i]["PARAMNAME"].ToString();
                bool isOutPut = Convert.ToBoolean(parametersDefinition[i]["PARAMISOUTPUT"]);

                SqlParameter paramAdded = procedureParameters.Add(paramName, DbTypeDePara(parametersDefinition[i]["PARAMTYPE"].ToString()));
                paramAdded.Value = parametersValues[i];
                paramAdded.Direction = isOutPut ? ParameterDirection.Output : ParameterDirection.Input;
            }
        }

        /// <summary>
        /// Define os tipos de parametros aceitos
        /// </summary>
        /// <param name="pTipoParametro">Parametro repassado</param>
        /// <returns>Enum com tipo no SQL</returns>
        private static SqlDbType DbTypeDePara(string type)
        {
            switch (type)
            {
                case "image":
                    return SqlDbType.Image;

                case "text":
                    return SqlDbType.Text;

                case "uniqueidentifier":
                    return SqlDbType.UniqueIdentifier;

                case "date":
                    return SqlDbType.Date;

                case "time":
                    return SqlDbType.Time;

                case "datetime2":
                    return SqlDbType.DateTime2;

                case "datetimeoffset":
                    return SqlDbType.DateTimeOffset;

                case "tinyint":
                    return SqlDbType.TinyInt;

                case "smallint":
                    return SqlDbType.SmallInt;

                case "int":
                    return SqlDbType.Int;

                case "smalldatetime":
                    return SqlDbType.SmallDateTime;

                case "real":
                    return SqlDbType.Real;

                case "money":
                    return SqlDbType.Money;

                case "datetime":
                    return SqlDbType.DateTime;

                case "float":
                    return SqlDbType.Float;

                case "ntext":
                    return SqlDbType.NText;

                case "bit":
                    return SqlDbType.Bit;

                case "decimal":
                    return SqlDbType.Decimal;

                case "smallmoney":
                    return SqlDbType.SmallMoney;

                case "bigint":
                    return SqlDbType.BigInt;

                case "varbinary":
                    return SqlDbType.VarBinary;

                case "varchar":
                    return SqlDbType.VarChar;

                case "binary":
                    return SqlDbType.Binary;

                case "char":
                    return SqlDbType.Char;

                case "timestamp":
                    return SqlDbType.Timestamp;

                case "nvarchar":
                    return SqlDbType.NVarChar;

                case "nchar":
                    return SqlDbType.NChar;

                case "xml":
                    return SqlDbType.Xml;

                default:
                    return SqlDbType.Bit;
            }
        }

        #endregion

        #region Class Methods

        /// <summary>
        /// Construtora privada da classe
        /// </summary>
        public DataBase()
        {

        }

        /// <summary>
        /// Tabel de retorno da requisição feita OnLine (ou seja, a conexão fica pendurada)
        /// </summary>
        public DbDataReader Reader { get; private set; }
        /// <summary>
        /// Conexão utilizada
        /// </summary>
        private SqlConnection Connection { get; set; }
        /// <summary>
        /// Comando utilizado (contendo os parâmetros de entrada e posteriormente os de saída da procedure)
        /// </summary>
        private SqlCommand Command { get; set; }
        /// <summary>
        /// Valores de entrada da procedure a ser executada (quando execução for online os outputs só são preenchidos após conexão ser fechada)
        /// </summary>
        private object[] ParametersValue { get; set; }
        /// <summary>
        /// Valore retornado pela procedure executada (quando execução for online só é preenchido após conexão ser fechada)
        /// </summary>
        public int ReturnedValue { get; private set; }

        /// <summary>
        /// Realizar requisição de dados para procedure mas manter conexão aberta
        /// Premissa: Sempre fechar a conexão após o uso, altamente recomendado a utilização de using
        /// Exemplo:
        /// using (var db = DataBase.GetDataOnLine(GET_GENEROS, parametros))
        /// {
        ///     while(db.Table.Read())
        ///         listaIds.Add(db.Table.ToInt32("GRID"));
        /// }
        /// </summary>
        /// <param name="procedure">Nome da procedure a ser executada</param>
        /// <param name="parametros">Parâmetros de entrada da procedure</param>
        /// <returns>DataBase criada para execução dos dados</returns>
        public static DataBase GetDataOnLine(string procedure, object[] parametros = null)
        {
            DataBase db = new DataBase();
            db.GetDataOnLine(procedure, parametros, true);
            return db;
        }

        /// <summary>
        /// Realizar requisição de dados para procedure mas manter conexão aberta
        /// Premissa: Sempre fechar a conexão após o uso, altamente recomendado a utilização de using
        /// </summary>
        /// <param name="procedure">Nome da procedure a ser executada</param>
        /// <param name="forceNewConnection">Forçar nova conexão (se outra estiver ativa será fechada e qualquer DataReader em leitura perderá acesso aos dados)</param>
        /// <returns>Tabela com o retorno dos dados da procedure</returns>
        public DbDataReader GetDataOnLine(string procedure, bool forceNewConnection)
        {
            return GetDataOnLine(procedure, null, forceNewConnection);
        }

        /// <summary>
        /// Realizar requisição de dados para procedure mas manter conexão aberta
        /// Premissa: Sempre fechar a conexão após o uso, altamente recomendado a utilização de using
        /// </summary>
        /// <param name="procedure">Nome da procedure a ser executada</param>
        /// <param name="parametros">Parâmetros de entrada da procedure</param>
        /// <param name="forceNewConnection">Forçar nova conexão (se outra estiver ativa será fechada e qualquer DataReader em leitura perderá acesso aos dados)</param>
        /// <returns>Tabela com o retorno dos dados da procedure</returns>
        public DbDataReader GetDataOnLine(string procedure, object[] parametros, bool forceNewConnection)
        {
            ParametersValue = parametros;

            if (forceNewConnection || Connection == null || Connection.State == ConnectionState.Closed)
            {
                CloseConnection();
                Connection = new SqlConnection(Properties.Default.ConnectionString);
            }
            if (Reader != null && !Reader.IsClosed)
                Reader.Close();

            Command = new SqlCommand(procedure, Connection);
            Command.CommandType = CommandType.StoredProcedure;

            if(Connection.State == ConnectionState.Closed)
                Connection.Open();

            FillParametersForCall(Command.Parameters, parametros, GetParametersDefinition(Connection, procedure).Tables[0].Rows);
            Reader = Command.ExecuteReader();

            return Reader;
        }

        /// <summary>
        /// Fechar conexão se estiver pendurada
        /// </summary>
        public void CloseConnection()
        {
            if (Connection != null && Connection.State != ConnectionState.Closed)
            {
                Connection.Dispose();
                ReturnedValue = FillParametersReturned(Command.Parameters, ParametersValue);
            }
        }

        /// <summary>
        /// Dispose da classe, fecha a conexão automaticamente
        /// </summary>
        public void Dispose()
        {
            CloseConnection();
        }
        #endregion
    }    
}
