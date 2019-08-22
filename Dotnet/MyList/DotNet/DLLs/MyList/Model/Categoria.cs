using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Script.Serialization;

namespace MyList.Model
{
    [Serializable]
    public class Categoria
    {
        public int ID { get; set; }
        public string Descricao { get; set; }

        public Categorias Filhos { get; set; }
        public Generos Generos { get; set; }

        [ScriptIgnore]
        public Categoria Pai { get; set; }
    }

    [Serializable]
    public class Categorias : List<Categoria>
    {

    }
}
