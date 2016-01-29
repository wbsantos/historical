using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CCData.Modelos
{
    class Endereco
    {
        public int id { get; private set; }
        public Cidade cidade { get; set; }
        public string rua { get; set; }
        public string numero { get; set; }
        public string cep { get; set; }
        public string complemento { get; set; }

        public Endereco(int id) { this.id = id; }
        public Endereco() { }
    }
}
