using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Kairos.GA
{
    class Cromossomo : ICloneable
    {
        public List<DAO.Curso> cursos;
        Sorteio.Disciplinas disciplinas;
        List<DAO.Professor> professores;

        private ulong _valor;
        public ulong valor
        {
            get
            {
                if(_valor == 0)
                    calcularValor();
                return _valor;
            }
        }

        private Cromossomo()
        {
        }

        public Cromossomo(List<DAO.Professor> professores, Sorteio.Disciplinas disciplinas, List<DAO.Curso> cursos)
        {
            // TODO: Complete member initialization
            this.professores = professores;
            this.disciplinas = disciplinas;
            this.cursos = cursos;
        }

        private bool sortearHorario(Sorteio.Disciplina disciplinaSorteada, DAO.Turma turma, List<Sorteio.Disciplina> disciplinasTentadas, ref DAO.HorarioTurma horario, ref DAO.Professor professor)
        {
            Sorteio.Professores sortProf = new Sorteio.Professores(disciplinaSorteada, turma.turno);
            professor = sortProf.sortear();

            if (professor == null)
            {
                sortProf = new Sorteio.Professores(disciplinaSorteada);
                professor = sortProf.sortear();
            }

            Sorteio.Horario sortHorario = null;
            horario = null;

            if (professor != null)
            {
                sortHorario = new Sorteio.Horario(professor, turma);
                horario = sortHorario.sortear();

                if (horario == null)
                {
                    sortHorario = new Sorteio.Horario(turma);
                    horario = sortHorario.sortear();
                }
            }
            else
            {
                if ((from x in disciplinasTentadas where x == disciplinaSorteada select x).Count() >= 15)
                {
                    disciplinaSorteada.cargaHorariaRestante = new DateTime();
                    return false;
                }
                else
                    disciplinasTentadas.Add(disciplinaSorteada);
            }

            return true;
        }

        public void gerarGradeAleatoria()
        {
            _valor = 0;
            //Percorrendo todas as turmas disponíveis
            foreach (DAO.Curso curso in cursos)
            foreach (DAO.Periodo periodo in curso.periodos)                
                foreach (DAO.Turma turma in periodo.turmas)
                {
                    Sorteio.Disciplinas disciplinasPorPeriodo = new Sorteio.Disciplinas(periodo.disciplinas, disciplinas.disciplinas);
                    List<Sorteio.Disciplina> disciplinasTentadas = new List<Sorteio.Disciplina>();

                    while (!disciplinasPorPeriodo.todasJaSorteadas)
                    {
                        Sorteio.Disciplina disciplinaSorteada = disciplinasPorPeriodo.sortear();
                        if (disciplinaSorteada == null)
                            break;
                        
                        DAO.HorarioTurma horario = null;
                        DAO.Professor professor = null;
                        if (!sortearHorario(disciplinaSorteada, turma, disciplinasTentadas, ref horario, ref professor))
                            continue;

                        if (horario != null)
                        {
                            horario.disciplina = disciplinaSorteada.disciplina;
                            horario.professor = professor;

                            disciplinaSorteada.cargaHorariaRestante -= (horario.horario.horaFinal - horario.horario.horaInicial);
                        }
                        else
                        {
                            if ((from x in disciplinasTentadas where x == disciplinaSorteada select x).Count() >= 15)
                            {
                                disciplinaSorteada.cargaHorariaRestante = new DateTime();
                                continue;
                            }
                            else
                                disciplinasTentadas.Add(disciplinaSorteada);
                        }
                    }
                }                    
        }

        public Cromossomo crossover(Cromossomo other)
        {
            /* TODO: Alterar essa função para o seguinte funcionamento
             * Clonar cromossomo this - Done
             * Sortear dois dia e um horário (para cada dia) do crossomo this - Done
             * Verificar no cromossomo other as disciplinas e respectivos professores ministrando nos horários sorteados - Done
             * Setar no cromossomo this as disciplinas e professores equivalentes do cromossomo other - Done
             * Setar no cromossomo this as disciplinas que foram retiradas (dos horários sorteados) nas que foram setadas nos horários sorteados (troca equivalente) - Done
             * */
            _valor = 0;
            Cromossomo result = (Cromossomo)this.Clone();
            for (int i = 0; i < result.cursos.Count; i++)
            {
                for (int j = 0; j < result.cursos[i].periodos.Count; j++)
                {
                    for (int k = 0; k < result.cursos[i].periodos[j].turmas.Count; k++)
                    {
                        crossoverTurma(result.cursos[i].periodos[j].turmas[k], other.cursos[i].periodos[j].turmas[k]);
                        crossoverTurma(result.cursos[i].periodos[j].turmas[k], other.cursos[i].periodos[j].turmas[k]);
                    }
                }
            }

            return result;
        }

        private bool diaVazio(DAO.Dia dia)
        {
            foreach (var item in dia.horarios)
            {
                if (item.professor != null && item.disciplina != null)
                    return false;
            }
            return true;
        }

        private void crossoverTurma(DAO.Turma turmaResult, DAO.Turma turmaOther)
        {
            int ini = 0, fim = 6;
            if (diaVazio(turmaResult.getDia(DAO.DiaSemana.Domingo)) && diaVazio(turmaOther.getDia(DAO.DiaSemana.Domingo)))
                ini = 1;
            if (diaVazio(turmaResult.getDia(DAO.DiaSemana.Sabado)) && diaVazio(turmaOther.getDia(DAO.DiaSemana.Sabado)))
                fim = 5;

            int diaSemana1 = Sorteio.Random.Next(ini, fim);
            DAO.Dia diaResult = turmaResult.getDia((DAO.DiaSemana)diaSemana1);
            DAO.Dia diaOther = turmaOther.getDia((DAO.DiaSemana)diaSemana1);

            int horario = Sorteio.Random.Next(0, diaResult.horarios.Count - 1);

            List<DAO.HorarioTurma> horariosTrocaEquivalente = new List<DAO.HorarioTurma>();
            foreach (DAO.Dia item in turmaResult.dias)
            {
                foreach (DAO.HorarioTurma horarioTurma in item.horarios)
                {
                    if ((horarioTurma.disciplina == null && diaOther.horarios[horario].disciplina == null) ||
                        (horarioTurma.disciplina != null && diaOther.horarios[horario].disciplina != null &&
                         horarioTurma.disciplina.id == diaOther.horarios[horario].disciplina.id))
                    {
                        if ((ini == 1 && horarioTurma.dia.diaSemana == DAO.DiaSemana.Sabado) || (fim == 5 && horarioTurma.dia.diaSemana == DAO.DiaSemana.Domingo))
                            continue;
                        horariosTrocaEquivalente.Add(horarioTurma);
                    }
                }
            }
            
            if (horariosTrocaEquivalente.Count == 0)
                return;

            int horarioTrocEquivalente = Sorteio.Random.Next(0, horariosTrocaEquivalente.Count - 1);

            horariosTrocaEquivalente[horarioTrocEquivalente].professor = diaResult.horarios[horario].professor;
            horariosTrocaEquivalente[horarioTrocEquivalente].disciplina = diaResult.horarios[horario].disciplina;

            diaResult.horarios[horario].professor = diaOther.horarios[horario].professor;
            diaResult.horarios[horario].disciplina = diaOther.horarios[horario].disciplina;
        }

        public void mutar()
        {
            _valor = 0;
            crossover(this);
        }

        public object Clone()
        {
            Cromossomo cromossomo = new Cromossomo();
            cromossomo._valor = this._valor;

            cromossomo.cursos = new List<DAO.Curso>();
            foreach (DAO.Curso item in this.cursos)
                cromossomo.cursos.Add(item == null ? null : (DAO.Curso)item.Clone());

            cromossomo.professores = new List<DAO.Professor>();
            foreach (DAO.Professor item in this.professores)
                cromossomo.professores.Add(item == null ? null : (DAO.Professor)item.Clone());

            cromossomo.disciplinas = new Sorteio.Disciplinas(cromossomo.professores);

            return cromossomo;
        }

        /// <summary>
        /// Calcular fator de avaliação do cromossomo
        /// </summary>
        public void calcularValor()
        {
            _valor = 0;
            ulong sub = 0;
            int porcento = 0;
            List<DAO.HorarioTurma> horariosProf = new List<DAO.HorarioTurma>();
            //Fator de preferência do professor pela disciplina
            //Fator de preferência do professor pelo dia/turno
            //Fator de disciplina estar ou não no mesmo dia
            foreach (DAO.Curso curso in cursos)
            {
                foreach (DAO.Periodo periodo in curso.periodos)
                {
                    foreach (DAO.Turma turma in periodo.turmas)
                    {
                        List<DAO.Disciplina> disciplinasTurma = new List<DAO.Disciplina>();
                        foreach (DAO.Dia dia in turma.dias)
                        {
                            List<DAO.Disciplina> disciplinasDia = new List<DAO.Disciplina>();
                            foreach (DAO.HorarioTurma horario in dia.horarios)
                            {
                                if (horario.professor == null || horario.disciplina == null)
                                    continue;

                                ulong valor = 0;
                                valor = (ulong)horario.professor.getValorPrefDiaTurno(dia.diaSemana, turma.turno);
                                _valor += valor;
                                if (valor == 0)
                                    sub += 20;

                                valor += (ulong)horario.professor.getValorPrefDisciplina(horario.disciplina);
                                _valor += valor;
                                if (valor == 0)
                                    sub += 20;

                                int indexOf = disciplinasTurma.IndexOf(horario.disciplina);
                                if (indexOf >= 0 && indexOf < disciplinasTurma.Count - 1)
                                    porcento += 5;
                                disciplinasDia.Add(horario.disciplina);

                                bool professorOcupado = false;

                                foreach (var item in horariosProf)
                                {
                                    if (item.professor.id == horario.professor.id &&
                                       item.dia.diaSemana == horario.dia.diaSemana &&
                                       item.horario.id == horario.horario.id)
                                    {
                                        professorOcupado = true;
                                        break;
                                    }
                                }
                                if (!professorOcupado)
                                    horariosProf.Add(horario);
                                else
                                {
                                    _valor = 0;
                                    return;
                                }
                            }
                            disciplinasTurma.AddRange(disciplinasDia);
                        }
                    }
                }
            }

            if (sub >= _valor)
                _valor = 0;
            else
                _valor -= sub;

            if (porcento < 100)
                _valor -= (ulong)(_valor / 100.0 * porcento);
            else
                _valor = 50;
        }

        /// <summary>
        /// Validar se cromossomo possui uma grade de horários válida
        /// </summary>
        /// <returns></returns>
        private bool validarCromossomo()
        {
            
            return false;
        }

        /// <summary>
        /// Ajustar cromossomo caso ele contenha uma grade de horário inválida
        /// </summary>
        public void ajusteFino()
        {
            _valor = 0;
        }
    }
}
