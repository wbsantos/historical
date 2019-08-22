using System;
using Access;
using System.Data;
using System.Data.Common;

namespace MyList.Data
{
    public class Genero
    {
        private const string GET_GENEROSBYCATEGORIA = "ML_SP_GETGENEROSBYCATEGORIA";
        private const string GET_GENEROSBYITEM = "ML_SP_GETGENEROSBYITEM";

        public Model.Generos GetByCategoria(int categoriaID)
        {
            using (var db = new DataBase())
            {
                return GetByCategoria(categoriaID, db);
            }
        }

        public Model.Generos GetByCategoria(int categoriaID, DataBase db)
        {
            Model.Generos generos = new Model.Generos();
            object[] parametros = new object[] { categoriaID };

            db.GetDataOnLine(GET_GENEROSBYCATEGORIA, parametros, false);
            
            while (db.Reader.Read())
                generos.Add(BuildModel(db.Reader));

            return generos;
        }

        public Model.Generos GetByItem(int itemID)
        {
            using (var db = new DataBase())
            {
                return GetByItem(itemID, db);
            }
        }

        public Model.Generos GetByItem(int itemID, DataBase db)
        {
            Model.Generos generos = new Model.Generos();
            object[] parametros = new object[] { itemID };

            db.GetDataOnLine(GET_GENEROSBYITEM, parametros, false);

            while (db.Reader.Read())
                generos.Add(BuildModel(db.Reader));

            return generos;
        }

        private Model.Genero BuildModel(DbDataReader reader)
        {
            Model.Genero genero = new Model.Genero();
            genero.ID = reader.ToInt32("GRID");
            genero.Descricao = reader.ToString("GRGENERO");

            return genero;
        }
    }
}
