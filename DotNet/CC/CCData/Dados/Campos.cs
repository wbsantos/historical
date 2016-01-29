using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CCData.Dados
{
    class Campos
    {
        private List<Campo> campos { get; set; }
        public int length
        {
            get {return campos.Count;}
            private set{}
        }

        public Campo this[int index] 
        {
            get
            { 
                return campos[index];
            }
            private set
            { }
        }

        public Campo this[string nome] 
        {
            get
            {
                foreach (Campo campo in campos)
                {
                    if (campo.nome == nome)
                        return campo;
                }

                return null;
            }
            private set
            { }
        }

        public void Add(Campo campo)
        {
            campos.Add(campo);
        }

        public Boolean RemoveAt(int i)
        {
            if (i < campos.Count - 1 || i > campos.Count)
                return false;

            campos.RemoveAt(i);
            return true;
        }

        public Campos()
        {
            campos = new List<Campo>();
        }
    }
}
