using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Kairos.GA.Sorteio
{
    class Cromossomo
    {
        public GA.Cromossomo cromossomo;
        public ulong faixaIni;
        public ulong faixaFim;
    }

    class Cromossomos
    {
        public enum Prioridade
        {
            MaiorValor,
            MenorValor,
            Igualitaria
        };

        List<Cromossomo> _cromossomos;
        List<GA.Cromossomo> cromossomos;
        ulong faixaFim = 0;

        public Cromossomos(List<GA.Cromossomo> cromossomos)
        {
            this.cromossomos = cromossomos;
        }

        public void definirFaixas(Prioridade prioridade)
        {
            if (cromossomos == null || cromossomos.Count == 0)
                return;
            _cromossomos = new List<Cromossomo>();
            ulong faixaIni = 0;

            ulong melhor = 0;
            if (prioridade == Prioridade.MenorValor)
            {
                melhor = cromossomos[0].valor;
                for (int i = 1; i < cromossomos.Count; i++)
                {
                    if (cromossomos[i].valor > melhor)
                        melhor = cromossomos[i].valor;
                }
                melhor += 10;
            }

            foreach (GA.Cromossomo item in cromossomos)
            {
                Cromossomo cromossomo = new Cromossomo();
                cromossomo.cromossomo = item;
                cromossomo.faixaIni = faixaIni;
                if(prioridade == Prioridade.MaiorValor)
                    cromossomo.faixaFim = faixaIni + cromossomo.cromossomo.valor;
                else if(prioridade == Prioridade.MenorValor)
                    cromossomo.faixaFim = faixaIni + (melhor - cromossomo.cromossomo.valor);
                else
                    cromossomo.faixaFim = faixaIni + 300;

                faixaIni = cromossomo.faixaFim + 1;
                _cromossomos.Add(cromossomo);
            }
            faixaFim = faixaIni - 1;
        }

        public GA.Cromossomo sortear(GA.Cromossomo evitarEsse = null)
        {
            bool sortearDeNovo = false;
            do
            {
                sortearDeNovo = false;
                ulong sort = sortearNumero();

                foreach (var item in _cromossomos)
                {
                    if (sort >= item.faixaIni && sort <= item.faixaFim)
                    {
                        if(item.cromossomo == evitarEsse)
                        {
                            sortearDeNovo = true;
                            break;
                        }
                        return item.cromossomo;
                    }
                }
            }while(sortearDeNovo);

            return null;
        }

        private ulong sortearNumero()
        {
            int subDivisoes = (int)(faixaFim/((ulong)int.MaxValue));
            if (subDivisoes == 0)
                subDivisoes++;

            Random rand;
            List<ulong> resultados = new List<ulong>();
            int faixa = (int)(faixaFim / (ulong)subDivisoes);
            for (int i = 0; i < subDivisoes; i++)
            {
                int result = Sorteio.Random.Next(0, faixa);
                resultados.Add((ulong)result);
                //System.Threading.Thread.Sleep(2);
            }

            int iResult = Sorteio.Random.Next(0, resultados.Count  -1);
            return resultados[iResult] * (ulong)(iResult + 1);
        }
    }
}