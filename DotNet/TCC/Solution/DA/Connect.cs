using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Common;
using System.Data;
using System.Configuration;

namespace Kairos.DA
{
    class Connect
    {
        private static Connect _connect;
        private DbProviderFactory _factory;
        private DbConnection _connection;
        public bool ManterConexao { get; set; }

        private DbConnection connection
        {
            get
            {
                if (_connection == null)
                {
                    _connection = factory.CreateConnection();
                    _connection.ConnectionString = ConfigurationManager.AppSettings["StringConnection"];
                }
                return _connection;
            }
        }

        private DbProviderFactory factory
        {
            get
            {
                if (_factory == null)
                {
                    if (ConfigurationManager.AppSettings["ProviderName"] == "System.Data.SQLite" || ConfigurationManager.AppSettings["ProviderName"] == null)
                        _factory = new System.Data.SQLite.SQLiteFactory(); 
                    else
                        _factory = DbProviderFactories.GetFactory(ConfigurationManager.AppSettings["ProviderName"]);
                }
                return _factory;
            }
        }

        public static Connect SQL
        {
            get
            {
                if (_connect == null)
                    _connect = new Connect();
                return _connect;
            }
        }

        private Connect()
        {
        }

        public DataTable query(string comandoSQL)
        {
            DataTable dataTable = new DataTable();
            try
            {
                DbCommand command = factory.CreateCommand();
                command.Connection = connection;
                command.CommandText = comandoSQL;

                open();
                DbDataAdapter dbAdap = factory.CreateDataAdapter();
                dbAdap.SelectCommand = command;

                dbAdap.Fill(dataTable);
            }
            catch (Exception ex)
            {
                throw new Exception("Kairos.DA.Connect.query() gerou erro ao buscar dados na Base\nErro original: " + ex.Message);
            }
            finally
            {
                close();
            }

            return dataTable;
        }

        public int execute(string comandoSQL)
        {
            DataTable dataTable = new DataTable();
            try
            {
                DbCommand command = factory.CreateCommand();
                command.Connection = connection;
                command.CommandText = comandoSQL;

                open();
                int ret = command.ExecuteNonQuery();
                if (comandoSQL.ToUpper().IndexOf("INSERT") == 0)
                    return int.Parse(queryScalar("SELECT last_insert_rowid()").ToString());
                return ret;
            }
            catch (Exception ex)
            {
                throw new Exception("Kairos.DA.Connect.execute() gerou erro ao buscar dados na Base\nErro original: " + ex.Message);
            }
            finally
            {
                close();
            }
        }

        public object queryScalar(string comandoSQL)
        {
            try
            {
                DbCommand command = factory.CreateCommand();
                command.Connection = connection;
                command.CommandText = comandoSQL;

                open();
                return command.ExecuteScalar();
            }
            catch (Exception ex)
            {
                throw new Exception("Kairos.DA.Connect.queryScalar() gerou erro ao buscar dados na Base\nErro original: " + ex.Message);
            }
            finally
            {
                close();
            }
        }

        public void open()
        {
            if (connection.State == ConnectionState.Closed)
                connection.Open();
        }
        
        public void close()
        {
            if (!ManterConexao && connection.State == ConnectionState.Open)
                connection.Close();
        }
    }
}
