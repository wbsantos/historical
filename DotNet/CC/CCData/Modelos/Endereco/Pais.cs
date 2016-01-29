using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CCData.Modelos
{
    public class Pais
    {
        public int id { get; private set; }
        public string nome { get; set; }
        public string sigla { get; set; }

        public Pais(int id) { this.id = id; }
        public Pais() { }
    }
}
