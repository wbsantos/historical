using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace Kairos.DAO
{
    class Curso : ICloneable
    {
        public int id { get; private set; }
        public string nome;
        public List<Periodo> periodos;
        public string descricaoPeriodo;

        public static List<Curso> get()
        {
            DataTable dt = DA.Connect.SQL.query("Select * from curso");
            List<Curso> cursos = new List<Curso>();

            foreach (DataRow row in dt.Rows)
            {
                Curso curso = new Curso();
                curso.id = int.Parse(row["id"].ToString());
                curso.nome = row["nome"].ToString();
                curso.descricaoPeriodo = row["descricaoPeriodo"].ToString();
                curso.periodos = Periodo.get(curso, int.Parse(row["quantidadePeriodos"].ToString()));
                cursos.Add(curso);
            }
            return cursos;
        }

        public static Curso get(int id)
        {
            DataTable dt = DA.Connect.SQL.query("Select * from curso where id = " + id.ToString());
            if (dt.Rows.Count != 1)
                return null;
            DataRow row = dt.Rows[0];
            
            Curso curso = new Curso();
            curso.id = int.Parse(row["id"].ToString());
            curso.nome = row["nome"].ToString();
            curso.descricaoPeriodo = row["descricaoPeriodo"].ToString();
            curso.periodos = Periodo.get(curso, int.Parse(row["quantidadePeriodos"].ToString()));
            
            return curso;
        }

        public void delete()
        {
            foreach (var item in periodos)
            {
                item.delete();
            }
            DA.Connect.SQL.execute("Delete from curso where id = " + id.ToString());
        }

        public override string ToString()
        {
            return nome;
        }

        internal void insert()
        {
            id = DA.Connect.SQL.execute("Insert into Curso (nome, quantidadePeriodos, descricaoPeriodo) values('" + nome + "'," 
                                                                                                                  + periodos.Count.ToString() + ", '"
                                                                                                                  + descricaoPeriodo + "')");
            foreach (Periodo periodo in periodos)
            {
                periodo.curso = this;
            }
        }

        public void setQuantidadePeriodos(int quantidadePeriodos)
        {
            if (periodos == null)
                periodos = new List<Periodo>();

            if (periodos.Count < quantidadePeriodos)
            {
                for (int i = periodos.Count; i < quantidadePeriodos; i++)
                {
                    Periodo periodo = new Periodo();
                    periodo.curso = this;
                    periodo.periodo = i + 1;
                    periodo.disciplinas = new List<Disciplina>();
                    periodos.Add(periodo);
                }
            }
            else
            {
                while (periodos.Count > quantidadePeriodos)
                {
                    int i = periodos.Count - 1;
                    periodos[i].delete();
                    periodos.RemoveAt(i);
                }
            }
            update();
        }

        public void update()
        {
            DA.Connect.SQL.execute("Update Curso set nome = '" + nome + "', " +
                                                    "quantidadePeriodos = " + periodos.Count.ToString() + ", " +
                                                    "descricaoPeriodo = '" + descricaoPeriodo + "'" + 
                                               "where id = " + id.ToString());
        }

        public object Clone()
        {
            Curso curso = new Curso();

            curso.id = this.id;
            curso.nome = this.nome;
            curso.periodos = new List<Periodo>();

            foreach (Periodo item in this.periodos)
            {
                Periodo periodo = item == null ? null : (Periodo)item.Clone();
                periodo.curso = curso;
                curso.periodos.Add(periodo);
            }

            curso.descricaoPeriodo = this.descricaoPeriodo;

            return curso;
        }

        public static List<Curso> Clone(List<Curso> cursos)
        {
            List<Curso> retorno = new List<Curso>();
            foreach (Curso item in cursos)
            {
                retorno.Add(item == null ? null : (Curso)item.Clone());
            }

            return retorno;
        }

        public void carregarGrade(List<Professor> professores, List<Disciplina> disciplinas)
        {
            foreach (var periodo in periodos)
            {
                foreach (var turma in periodo.turmas)
                {
                    DataTable dt = DA.Connect.SQL.query("Select * from grade where idturma = " + turma.id.ToString());

                    foreach (var dia in turma.dias)
                    {
                        foreach (var horario in dia.horarios)
                        {
                            horario.professor = null;
                            horario.disciplina = null;

                            foreach (DataRow row in dt.Rows)
                            {
                                if((DiaSemana)int.Parse(row["DIASEMANA"].ToString()) == dia.diaSemana &&
                                   ((DateTime)row["HORAINI"]).TimeOfDay == horario.horario.horaInicial.TimeOfDay &&
                                   ((DateTime)row["HORAFIM"]).TimeOfDay == horario.horario.horaFinal.TimeOfDay)
                                {
                                    var p = from x in professores where x.id == int.Parse(row["IDPROFESSOR"].ToString()) select x;
                                    if (p.Count() > 0)
                                        horario.professor = p.ToList()[0];

                                    var d = from x in disciplinas where x.id == int.Parse(row["IDDISCIPLINA"].ToString()) select x;
                                    if (d.Count() > 0)
                                        horario.disciplina = d.ToList()[0]; ;
                                }
                            }
                        }
                    }
                }
            }
        }

        public static void zerarGrade()
        {
            DA.Connect.SQL.execute("Delete from Grade");
        }

        public void salvarGrade()
        {
            StringBuilder strSql = new StringBuilder();
            foreach (var periodo in periodos)
            {
                foreach (var turma in periodo.turmas)
                {
                    foreach (var dia in turma.dias)
                    {
                        foreach (var horario in dia.horarios)
                        {
                            if (horario.professor == null || horario.disciplina == null)
                                continue;
                            strSql.Append("Insert into Grade (IDTURMA, IDPROFESSOR, IDDISCIPLINA, HORAINI, HORAFIM, DIASEMANA) values (" +
                                                                turma.id.ToString() + ", " +
                                                                horario.professor.id.ToString() + ", " +
                                                                horario.disciplina.id.ToString() + ", " +
                                                                "'" + horario.horario.horaInicial.ToString("HH:mm") + "', " +
                                                                "'" + horario.horario.horaFinal.ToString("HH:mm") + "', " +
                                                                ((int)dia.diaSemana).ToString() + ");\n");
                        }
                    }
                }
            }

            DA.Connect.SQL.execute(strSql.ToString());
        }
    }
}
