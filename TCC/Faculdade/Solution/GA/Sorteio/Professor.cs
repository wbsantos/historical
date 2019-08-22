using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Kairos.GA.Sorteio
{
    class Professores
    {
        List<DAO.Professor> professores;
        DAO.Turno turno;

        public Professores(Sorteio.Disciplina disciplina, DAO.Turno turno)
        {
            professores = new List<DAO.Professor>();
            this.turno = turno;

            foreach (DAO.PreferenciaDisciplinas pref in disciplina.preferencias)
            {
                if (valido(pref))
                {
                    professores.Add(pref.professor);
                }
            }
        }

        public Professores(Sorteio.Disciplina disciplina)
        {
            professores = new List<DAO.Professor>();
            
            foreach (DAO.PreferenciaDisciplinas pref in disciplina.preferencias)
            {
                professores.Add(pref.professor);
            }
        }

        private bool valido(DAO.PreferenciaDisciplinas preferencia)
        {
            if (turno == null)
                return false;

            if (preferencia.valor > 0)
            {
                foreach (DAO.PreferenciaDiaTurno prefDiaTurno in preferencia.professor.prefDiaTurno)
                {
                    if (prefDiaTurno.valor > 0 && prefDiaTurno.turno.id == turno.id)
                        return true;
                }
            }

            return false;
        }

        private bool haValidos
        {
            get
            {
                return professores.Count > 0;
            }
        }

        public DAO.Professor sortear()
        {
            if (!haValidos)
                return null;

            int d = Sorteio.Random.Next(0, professores.Count - 1);
            return professores[d];
        }
    }
}
