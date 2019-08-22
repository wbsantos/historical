using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace Kairos.DAO
{
    class Disciplina : ICloneable
    {
        public int id { get; private set; }
        public string nome;
        public DateTime cargaHorariaSemanal;
        public int idPeriodoDisciplinas;

        public static Disciplina get(int id)
        {
            DataTable dt = DA.Connect.SQL.query("Select * from disciplina where id = " + id.ToString());
            if (dt.Rows.Count != 1)
                return null;

            Disciplina disciplina = new Disciplina();
            disciplina.id = int.Parse(dt.Rows[0]["id"].ToString());
            disciplina.nome = dt.Rows[0]["nome"].ToString();
            return disciplina;
        }
        
        public static List<Disciplina> get()
        {
            DataTable dt = DA.Connect.SQL.query("Select * from disciplina");
            List<Disciplina> disciplinas = new List<Disciplina>();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                Disciplina disciplina = new Disciplina();
                disciplina.id = int.Parse(dt.Rows[i]["id"].ToString());
                disciplina.nome = dt.Rows[i]["nome"].ToString();
                disciplinas.Add(disciplina);
            }
            return disciplinas;
        }

        public void insert()
        {
            id = DA.Connect.SQL.execute("Insert into Disciplina (nome) values('" + nome + "')");
        }

        public void delete()
        {
            DA.Connect.SQL.execute("Delete from Disciplina where id = " + id.ToString());
        }

        public int quantidadePeriodosUsando()
        {
            return int.Parse(DA.Connect.SQL.queryScalar("Select Count(*) from PeriodoDisciplinas where idDisciplina = " + id.ToString()).ToString());
        }

        public override string ToString()
        {
            return nome;
        }

        public object Clone()
        {
            Disciplina disciplina = new Disciplina();
            disciplina.id = this.id;
            disciplina.nome = this.nome;
            disciplina.cargaHorariaSemanal = cargaHorariaSemanal;
            disciplina.idPeriodoDisciplinas = idPeriodoDisciplinas;
            return disciplina;
        }
    }
}
