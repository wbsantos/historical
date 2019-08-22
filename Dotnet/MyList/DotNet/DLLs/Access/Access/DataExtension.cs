using System;
using System.Data;
using System.Data.Common;
using static System.Convert;

namespace Access
{
    public static class DataExtension
    {
        #region DataRow Extensions
        public static int? ToInt32Nullable(this DataRow row, string colName)
        {
            return IsDBNull(row[colName]) ? null : (int?)Convert.ToInt32(row[colName]);
        }

        public static int ToInt32(this DataRow row, string colName)
        {
            return IsDBNull(row[colName]) ? 0 : Convert.ToInt32(row[colName]);
        }

        public static double? ToDoubleNullable(this DataRow row, string colName)
        {
            return IsDBNull(row[colName]) ? null : (double?)Convert.ToDouble(row[colName]);
        }

        public static double ToDouble(this DataRow row, string colName)
        {
            return IsDBNull(row[colName]) ? 0d : Convert.ToDouble(row[colName]);
        }

        public static float? ToFloatNullable(this DataRow row, string colName)
        {
            return IsDBNull(row[colName]) ? null : (float?)Convert.ToSingle(row[colName]);
        }

        public static float ToFloat(this DataRow row, string colName)
        {
            return IsDBNull(row[colName]) ? 0f : Convert.ToSingle(row[colName]);
        }

        public static string ToString(this DataRow row, string colName)
        {
            return IsDBNull(row[colName]) ? string.Empty : Convert.ToString(row[colName]);
        }

        public static string ToStringNullable(this DataRow row, string colName)
        {
            return IsDBNull(row[colName]) ? null : Convert.ToString(row[colName]);
        }

        #endregion

        #region DataReader Extensions

        public static T ToEnum<T>(this DbDataReader dr, string colName) where T : struct, IConvertible
        {
            object obj = dr.GetValue(dr.GetOrdinal(colName));
            return IsDBNull(obj) ? default(T) : (T)obj;
        }

        public static int ToInt32(this DbDataReader dr, string colName)
        {
            object obj = dr.GetValue(dr.GetOrdinal(colName));
            return IsDBNull(obj) ? 0 : Convert.ToInt32(obj);
        }

        public static int? ToInt32Nullable(this DbDataReader dr, string colName)
        {
            object obj = dr.GetValue(dr.GetOrdinal(colName));
            return IsDBNull(obj) ? null : (int?)Convert.ToInt32(obj);
        }

        public static double ToDouble(this DbDataReader dr, string colName)
        {
            object obj = dr.GetValue(dr.GetOrdinal(colName));
            return IsDBNull(obj) ? 0d : Convert.ToDouble(obj);
        }

        public static double? ToDoubleNullable(this DbDataReader dr, string colName)
        {
            object obj = dr.GetValue(dr.GetOrdinal(colName));
            return IsDBNull(obj) ? null : (double?)Convert.ToDouble(obj);
        }

        public static float ToFloat(this DbDataReader dr, string colName)
        {
            object obj = dr.GetValue(dr.GetOrdinal(colName));
            return IsDBNull(obj) ? 0f : Convert.ToSingle(obj);
        }

        public static float? ToFloatNullable(this DbDataReader dr, string colName)
        {
            object obj = dr.GetValue(dr.GetOrdinal(colName));
            return IsDBNull(obj) ? null : (float?)Convert.ToSingle(obj);
        }

        public static string ToString(this DbDataReader dr, string colName)
        {
            object obj = dr.GetValue(dr.GetOrdinal(colName));
            return IsDBNull(obj) ? string.Empty : Convert.ToString(obj);
        }

        public static string ToStringNullable(this DbDataReader dr, string colName)
        {
            object obj = dr.GetValue(dr.GetOrdinal(colName));
            return IsDBNull(obj) ? null : Convert.ToString(obj);
        }
        #endregion
    }
}
