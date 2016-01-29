using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

/*
 * Validar se o professor não está ocupado naquele determinado horário.
 */
namespace Kairos.GA
{

    class Populacao
    {
        List<Cromossomo> cromossomos;
        View.FrmLoad frmLoad = null;

        public Populacao(View.FrmLoad frmLoad)
        {
            this.frmLoad = frmLoad;
        }

        public void gerarPopulacaoInicial()
        {
            List<DAO.Professor> professoresBase = DAO.Professor.get();

            frmLoad.setMaxValue(100);
            frmLoad.finalizarQuandoCompletar = false;
            frmLoad.Caption = "Gerando grades...";
            cromossomos = new List<Cromossomo>();
            List<DAO.Curso> cursos = DAO.Curso.get();
            for (int i = 0; i < 100; i++)
            {
                List<DAO.Professor> professores = (from x in professoresBase select (DAO.Professor)x.Clone()).ToList();
                Sorteio.Disciplinas disciplinas = new Sorteio.Disciplinas(professores);

                cromossomos.Add(new Cromossomo(professores, disciplinas, DAO.Curso.Clone(cursos)));
                cromossomos[i].gerarGradeAleatoria();

                frmLoad.addProgress(1);
            }
        }

        //* Criar gerações sorteando cromossomos pela classe Sorteio.Cromossomo
        //* Sortear membros para exclusão (inverter roleta viciada)
        //* Por fator de probabilidade de mutação
        //FIM!!!!!!!!!!!

        public void selecaoNatural(int qtdGeracoes)
        {
            frmLoad.finalizarQuandoCompletar = false;
            
            frmLoad.Caption = "Cruzando resultados...";
            Sorteio.Cromossomos sortCromossomo = new Sorteio.Cromossomos(cromossomos);
            for (int i = 0; i < qtdGeracoes; i++)
            {
                //System.Threading.Thread.Sleep(1);
                Random rand = new Random();
                int r = rand.Next(1, 10);

                if (r <= 8) //80% de chances de cruzamento
                {
                    sortCromossomo.definirFaixas(Sorteio.Cromossomos.Prioridade.MaiorValor);
                    Cromossomo pai = sortCromossomo.sortear();
                    Cromossomo mae = sortCromossomo.sortear(pai);

                    Cromossomo filho = pai.crossover(mae);

                    sortCromossomo.definirFaixas(Sorteio.Cromossomos.Prioridade.MenorValor);
                    Cromossomo bastardo = sortCromossomo.sortear();

                    cromossomos.Add(filho);
                    cromossomos.Remove(bastardo);
                }
                else //20% de chances de mutação
                {
                    sortCromossomo.definirFaixas(Sorteio.Cromossomos.Prioridade.Igualitaria);
                    Cromossomo parker = sortCromossomo.sortear();
                    parker.mutar();
                }

                frmLoad.addProgress(1);
            }
        }

        public List<DAO.Curso> getBestCromossomo()
        {
            if (cromossomos == null || cromossomos.Count == 0)
                return null;
            Cromossomo melhor = cromossomos[0];
            for (int i = 1; i < cromossomos.Count; i++)
            {
                if (cromossomos[i].valor > melhor.valor)
                    melhor = cromossomos[i];
            }

            return melhor.cursos;
        }
    }
}
