using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Kairos.GA.Sorteio
{
    class Disciplina
    {
        public List<DAO.PreferenciaDisciplinas> preferencias;
        public DAO.Disciplina disciplina;
        public DateTime cargaHorariaRestante;
        public int faixaIni;
        public int faixaFim;
    }

    class Disciplinas
    {
        public List<Sorteio.Disciplina> disciplinas { get; private set; }
        private int probabilidade;
        private int qtdDisciplinasUsadasParcialmente = 0;
        private int qtdDisciplinasUsadasCompletamente = 0;
        private int qtdDisciplinasNaoUsadas = 0;
        private int probabilidadeUsadas = 0;
        private int probabilidadeNaoUsadas = 0;

        public bool todasJaSorteadas
        {
            get
            {
                for (int j = 0; j < disciplinas.Count; j++)
                {
                    if (disciplinas[j].cargaHorariaRestante.TimeOfDay.TotalSeconds != 0)
                        return false;
                }
                return true;
            }
        }

        public Disciplinas(List<DAO.Disciplina> disciplinasPeriodo, List<Sorteio.Disciplina> disciplinasProfessor)
        {
            this.probabilidade = (100 / disciplinasPeriodo.Count);

            disciplinas = new List<Sorteio.Disciplina>();
            foreach (DAO.Disciplina disciplina in disciplinasPeriodo)
            {
                Sorteio.Disciplina temp = new Sorteio.Disciplina();
                temp.disciplina = disciplina;
                temp.cargaHorariaRestante = disciplina.cargaHorariaSemanal;
                temp.faixaIni = probabilidade * disciplinas.Count;
                temp.faixaFim = temp.faixaIni + probabilidade - 1;
                temp.preferencias = new List<DAO.PreferenciaDisciplinas>();

                foreach (Disciplina disciplinaProf in disciplinasProfessor)
                {
                    if (temp.disciplina.id == disciplinaProf.disciplina.id)
                    {
                        temp.preferencias = disciplinaProf.preferencias;
                        break;
                    }
                }

                disciplinas.Add(temp);
            }
        }

        public Disciplinas(List<DAO.Professor> professores)
        {
            disciplinas = new List<Sorteio.Disciplina>();
            foreach (DAO.Professor professor in professores)
            {
                foreach (DAO.PreferenciaDisciplinas pref in professor.prefDisciplinas)
                {
                    bool addDisciplina = true;
                    foreach (Sorteio.Disciplina disciplina in disciplinas)
                    {
                        if (disciplina.disciplina.id == pref.disciplina.id)
                        {
                            disciplina.preferencias.Add(pref);
                            addDisciplina = false;
                            break;
                        }
                    }

                    if (addDisciplina)
                    {
                        Sorteio.Disciplina disciplina = new Sorteio.Disciplina();
                        disciplina.disciplina = pref.disciplina;
                        disciplina.preferencias = new List<DAO.PreferenciaDisciplinas>();
                        disciplina.preferencias.Add(pref);
                        
                        disciplinas.Add(disciplina);
                    }
                }
            }

            if(this.disciplinas.Count > 0)
                this.probabilidade = (100 / (this.disciplinas.Count));
        }

        public Sorteio.Disciplina sortear()
        {
            if (!ajustarEstatisticas())
                return null;

            int d = Sorteio.Random.Next(0, 99);

            foreach (Sorteio.Disciplina disciplina in disciplinas)
            {
                if (d >= disciplina.faixaIni && d <= disciplina.faixaFim)
                    return disciplina;
            }

            return null;
        }

        private void ajustarProbabilidades()
        {
            if (qtdDisciplinasUsadasParcialmente > 0)
            {
                if (qtdDisciplinasNaoUsadas > 0)
                {
                    probabilidadeUsadas = 80 / qtdDisciplinasUsadasParcialmente;
                    probabilidadeNaoUsadas = 20 / qtdDisciplinasNaoUsadas;
                }
                else
                {
                    probabilidadeUsadas = 100 / qtdDisciplinasUsadasParcialmente;
                    probabilidadeNaoUsadas = 0;
                }
            }
            else
            {
                if (qtdDisciplinasNaoUsadas > 0)
                {
                    probabilidadeUsadas = 0;
                    probabilidadeNaoUsadas = 100 / qtdDisciplinasNaoUsadas;
                }
                else
                {
                    probabilidadeUsadas = 0;
                    probabilidadeNaoUsadas = 0;
                }
            }
        }

        private void definirFaixas()
        {
            for (int j = 0, faixaIni = 0; j < disciplinas.Count; j++)
            {
                Disciplina disciplina = disciplinas[j];
                if (disciplina.cargaHorariaRestante.TimeOfDay.TotalSeconds == 0)
                {
                    disciplina.faixaIni = -1;
                    disciplina.faixaFim = -1;
                }
                else if (disciplina.cargaHorariaRestante.TimeOfDay < disciplina.disciplina.cargaHorariaSemanal.TimeOfDay)
                {
                    disciplina.faixaIni = faixaIni;
                    disciplina.faixaFim = disciplina.faixaIni + probabilidadeUsadas - 1;
                    faixaIni = disciplina.faixaFim + 1;
                }
                else
                {
                    disciplina.faixaIni = faixaIni;
                    disciplina.faixaFim = disciplina.faixaIni + probabilidadeNaoUsadas - 1;
                    faixaIni = disciplina.faixaFim + 1;
                }
            }
        }

        private bool ajustarEstatisticas()
        {
            qtdDisciplinasUsadasCompletamente = 0;
            qtdDisciplinasUsadasParcialmente = 0;

            foreach (Disciplina disciplina in disciplinas)
            {
                if (disciplina.cargaHorariaRestante.TimeOfDay.TotalSeconds == 0)
                    qtdDisciplinasUsadasCompletamente++;
                else if (disciplina.cargaHorariaRestante.TimeOfDay < disciplina.disciplina.cargaHorariaSemanal.TimeOfDay)
                    qtdDisciplinasUsadasParcialmente++;
            }
            
            qtdDisciplinasNaoUsadas = (disciplinas.Count - qtdDisciplinasUsadasParcialmente - qtdDisciplinasUsadasCompletamente);
            ajustarProbabilidades();
            if (probabilidadeUsadas == 0 && probabilidadeNaoUsadas == 0)
                return false;

            definirFaixas();
            return true;
        }

    }
}
