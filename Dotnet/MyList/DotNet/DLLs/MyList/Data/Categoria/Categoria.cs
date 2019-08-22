using System;
using Access;
using System.Data;
using System.Data.Common;
using System.Linq;

namespace MyList.Data
{
    public class Categoria
    {
        private const string GET_CATEGORIAS = "ML_SP_GETCATEGORIAS";
        private const string GET_CATEGORIA = "ML_SP_GETCATEGORIA";

        public Model.Categorias GetAll()
        {
            using (var db = DataBase.GetDataOnLine(GET_CATEGORIAS, new object[] { true }))
            {
                return BuildModelList(db);
            }
        }

        public Model.Categoria Get(int categoriaID)
        {
            using (var db = DataBase.GetDataOnLine(GET_CATEGORIA, new object[] { categoriaID }))
                return Get(categoriaID, db);
        }

        public Model.Categoria Get(int categoriaID, DataBase db)
        {
            var categorias = BuildModelList(db);
            var categoria = categorias.FirstOrDefault(x => x.ID == categoriaID);
            if (categoria == null)
            {
                categoria = (from cat in categorias
                             from filho in cat.Filhos
                             where
                                 filho.ID == categoriaID
                             select
                                 filho).FirstOrDefault();
            }
            return categoria;
        }

        private Model.Categorias BuildModelList(DataBase db)
        {
            Model.Categorias categorias = new Model.Categorias();

            while (db.Reader.Read())
            {
                int? idPai = db.Reader.ToInt32Nullable("CTPAI");
                if (idPai == null)
                    categorias.Add(BuildModel(db.Reader));
                else
                {
                    var catPai = categorias.Where(x => x.ID == idPai).FirstOrDefault();
                    if (catPai != null)
                    {
                        var catFilho = BuildModel(db.Reader);
                        catPai.Filhos.Add(catFilho);
                        catFilho.Pai = catPai;
                    }
                }
            }

            Genero genero = new Genero();
            foreach (var categoria in categorias)
            {
                categoria.Generos = genero.GetByCategoria(categoria.ID, db);
                foreach (var categoriaFilho in categoria.Filhos)
                    categoriaFilho.Generos = genero.GetByCategoria(categoria.ID, db);
            }

            return categorias;
        }

        private Model.Categoria BuildModel(DbDataReader reader)
        {
            Model.Categoria categoria = new Model.Categoria();
            categoria.ID = reader.ToInt32("CTID");
            categoria.Descricao = reader.ToString("CTCATEGORIA");

            return categoria;
        }

    }
}