using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CCData.Modelos
{
    class Cidade
    {
        public int id { get; private set; }
        public Estado estado { get; set; }
        public string nome { get; set; }

        public Cidade(int id) { this.id = id; }
        public Cidade() { }
    }
}
