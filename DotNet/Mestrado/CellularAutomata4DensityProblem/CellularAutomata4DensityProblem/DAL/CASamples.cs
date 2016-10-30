using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Access;
using System.Data;

namespace CellularAutomata4DensityProblem.DAL
{
    class CASamples
    {
        private const string SP_INSERTSAMPLE = "CA_CREATESAMPLE";
        private const string SP_CLEANREPEATED = "CA_CLEANREPEATED";
        private const string SP_GETCORRECTPENDENCIES = "CA_GETCORRECTPENDENCIES";
        private const string SP_UPDATECORRECTANSWER = "CA_UPDATECORRECTANSWER";
        private const string SP_UPDATETOMSROLESANSWER = "CA_UPDATETOMSROLESANSWER";
        private const string SP_UPDATEROLE232ANSWER = "CA_UPDATEROLE232ANSWER";

        public enum AnswerKind
        {
            Correct = 0,
            Role232 = 1,
            TomsRole = 2
        }

        public bool InserirSample(long sample)
        {
            int ret;
            Access.DataBase.ExecuteNonQuery(SP_INSERTSAMPLE, new object[] { sample }, out ret);
            return ret == 0;
        }

        public int CleanRepeated()
        {
            int ret;
            Access.DataBase.ExecuteNonQuery(SP_CLEANREPEATED, null, out ret);
            return ret;
        }

        public List<DML.CASample> GetAnswersPendencies(int quantity, AnswerKind kind)
        {
            var ds = Access.DataBase.GetData(SP_GETCORRECTPENDENCIES, new object[] { quantity, (int)kind });
            List<DML.CASample> list = new List<DML.CASample>();
            if (ds == null)
                return list;

            list.AddRange( from row in ds.Tables[0].Rows.Cast<DataRow>()
                           select new DML.CASample()
                           {
                               ID = row.ToInt32("ID"),
                               State = row.ToInt64("INITIALSTATE"),
                               Correct = row.ToEnum<DML.CASample.Answer>("CORRECTANSWER"),
                               Role232 = row.ToEnum<DML.CASample.Answer>("ROLE232ANSWER"),
                               TomsRole = row.ToEnum<DML.CASample.Answer>("TOMSROLEANSWER"),
                           });
            return list;
        }

        public void UpdateCorrecAnswer(DML.CASample sample)
        {
            Access.DataBase.ExecuteNonQuery(SP_UPDATECORRECTANSWER, new object[] { sample.ID, (int)sample.Correct });
        }

        public void UpdateRole232Answer(DML.CASample sample)
        {
            Access.DataBase.ExecuteNonQuery(SP_UPDATEROLE232ANSWER, new object[] { sample.ID, (int)sample.Role232 });
        }

        public void UpdateTomsRoleAnswer(DML.CASample sample)
        {
            Access.DataBase.ExecuteNonQuery(SP_UPDATETOMSROLESANSWER, new object[] { sample.ID, (int)sample.TomsRole });
        }
    }
}
