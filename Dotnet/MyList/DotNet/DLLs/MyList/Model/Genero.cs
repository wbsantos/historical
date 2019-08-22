using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyList.Model
{
    [Serializable]
    public class Genero
    {
        public int ID { get; set; }
        public string Descricao { get; set; }
    }

    [Serializable]
    public class Generos : List<Genero>
    {

    }
}
