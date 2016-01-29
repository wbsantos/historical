using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CCData.Modelos
{
    class Estado
    {
        public int id { get; private set; }
        public Pais pais { get; set; }
        public string nome { get; set; }
        public string sigla { get; set; }

        public Estado(int id) { this.id = id; }
        public Estado() { }
    }
}
