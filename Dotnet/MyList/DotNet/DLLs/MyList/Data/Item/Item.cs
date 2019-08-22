using System;
using Access;
using System.Data;
using System.Data.Common;
using System.Linq;

namespace MyList.Data
{
    public class Item
    {
        private const string GET_ITENS = "ML_SP_GETITENS";
        private const string GET_PROPRIEDADES = "ML_SP_GETPROPRIEDADES";
        private const string SET_SCORE = "ML_SP_SCOREITEM";

        public Model.Sagas GetByCategoria(int categoriaID, string[] generos, int startRow, int totalRows)
        {
            using (var db = new DataBase())
            {
                return GetByCategoria(categoriaID, generos, startRow, totalRows, db);
            }
        }

        public Model.Sagas GetByCategoria(int categoriaID, string[] generos, int startRow, int totalRows, DataBase db)
        {
            object[] parametros = new object[] { categoriaID,
                                                 generos?.Any() ?? false ? String.Join(",", generos) : null,
                                                 startRow,
                                                 totalRows };

            db.GetDataOnLine(GET_ITENS, parametros, false);
            
            return BuildModelList(db);
        }

        /// <summary>
        /// Usuário seta o score de um item
        /// </summary>
        /// <param name="itemID">ID do item</param>
        /// <param name="usuarioID">ID do usuário</param>
        /// <param name="score">Score que o usuário está realizando</param>
        /// <returns>Retorno o novo score médio do item</returns>
        public float SetScore(int itemID, int usuarioID, float score)
        {
            object[] parametros = { itemID, usuarioID, score, 0f };
            DataBase.ExecuteNonQuery(SET_SCORE, parametros);

            return (float)parametros.Last();
        }
        private Model.Propriedades GetPropriedadesByItem(int itemID, DataBase db)
        {
            object[] parametros = new object[] { itemID };
            db.GetDataOnLine(GET_PROPRIEDADES, parametros, false);

            Model.Propriedades propriedades = new Model.Propriedades();

            while(db.Reader.Read())
            {
                Model.Propriedade propriedade = new Model.Propriedade();
                propriedade.ID = db.Reader.ToInt32("PRID");
                propriedade.Value = db.Reader.ToString("PRVALOR");
                propriedade.Tipo = db.Reader.ToEnum<Model.Propriedade.Label>("PRTIPO");

                propriedades.Add(propriedade);
            }

            return propriedades;
        }

        private Model.Item BuildModel(DbDataReader reader, Model.Sagas sagas)
        {
            Model.Item item = new Model.Item();
            item.ID = reader.ToInt32("ITID");
            item.Titulo = reader.ToString("ITTITULO");
            item.Sinopse = reader.ToString("ITSINOPSE");
            item.Score = reader.ToFloat("ITSCORE");

            item.Categoria.ID = reader.ToInt32("CTID");

            item.Saga = sagas.FirstOrDefault(x => x.ID == reader.ToInt32("SGID"));
            if (item.Saga == null)
            {
                item.Saga = new Model.Saga();
                item.Saga.ID = reader.ToInt32("SGID");
                item.Saga.Titulo = reader.ToString("SGTITULO");
                item.Saga.Add(item);
                sagas.Add(item.Saga);
            }

            return item;
        }

        private Model.Sagas BuildModelList(DataBase db)
        {
            Model.Sagas sagas = new Model.Sagas();

            while (db.Reader.Read())
                BuildModel(db.Reader, sagas);

            foreach (var saga in sagas)
            {
                if (saga.Count > 0)
                {
                    Categoria categoria = new Categoria();
                    saga.ForEach(x => x.Categoria = categoria.Get(x.Categoria.ID));

                    Genero genero = new Genero();
                    saga.ForEach(x => x.Generos = genero.GetByItem(x.ID, db));

                    saga.ForEach(x => x.Propriedades = GetPropriedadesByItem(x.ID, db));
                }
            }

            return sagas;
        }
    }
}
