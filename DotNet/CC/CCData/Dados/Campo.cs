using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CCData.Dados
{
    class Campo
    {
        public string nome { get; set; }
        public object valor { get; set; }
        public Type tipo{
            get
            {
                return valor.GetType();
            }
            private set{}
        }

        public Campo() { }
        public Campo(string nome, object valor)
        {
            this.nome = nome;
            this.valor = valor;
            this.tipo = valor.GetType();
        }

        public string ToString()
        {
            return Convert.ToString(valor);
        }

        public string ToSringForParam()
        {
            if(tipo == typeof(DateTime) || tipo == typeof(string))
                return "'" + Convert.ToString(valor) + "'";
            else
                return Convert.ToString(valor);
        }

        public int ToInt()
        {
            if (tipo == typeof(int) || tipo == typeof(Int32))
                return Convert.ToInt32(valor);
            else
                return 0;
        }

        public short ToInt16()
        {
            if (tipo == typeof(Int16))
                return Convert.ToInt16(valor);
            else
                return 0;
        }

        public long ToInt64()
        {
            if (tipo == typeof(Int64))
                return Convert.ToInt32(valor);
            else
                return 0;
        }

        public double ToDouble()
        {
            if (tipo == typeof(double))
                return Convert.ToDouble(valor);
            else
                return 0;
        }

        public double ToFloat()
        {
            if (tipo == typeof(float))
                return Convert.ToDouble(valor);
            else
                return 0;
        }

        public DateTime ToDateTime()
        {
            if (tipo == typeof(DateTime))
                return Convert.ToDateTime(valor);
            else
                return new DateTime();
        }

    }
}
