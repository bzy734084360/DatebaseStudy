using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _02ScoreInfo
{
    /// <summary>
    /// 数据库公共类
    /// </summary>
    public static class SqlHelper
    {
        private static string conStr = ConfigurationManager.ConnectionStrings["dbtest"].ConnectionString;
        public static int ExecuteNonQuery(string sql, params SqlParameter[] ps)
        {
            using (SqlConnection conn = new SqlConnection(conStr))
            {
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddRange(ps);
                conn.Open();
                return cmd.ExecuteNonQuery();
            }
        }

        public static object ExecuteScalar(string sql, params SqlParameter[] ps)
        {
            using (SqlConnection conn = new SqlConnection(conStr))
            {
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddRange(ps);
                conn.Open();
                return cmd.ExecuteScalar();
            }
        }

        public static DataTable ExecuteTable(string sql, params SqlParameter[] ps)
        {
            using (SqlConnection conn = new SqlConnection(conStr))
            {
                SqlDataAdapter adapter = new SqlDataAdapter(sql, conn);
                adapter.SelectCommand.Parameters.AddRange(ps);
                DataTable table = new DataTable();
                adapter.Fill(table);
                return table;
            }
        }

        /// <summary>
        /// 执行查询 select 返回多行多列
        /// </summary>
        /// <param name="sql"></param>
        /// <param name="ps"></param>
        /// <returns></returns>
        public static SqlDataReader ExecuteReader(string sql, params SqlParameter[] ps)
        {
            return SqlHelper.ExecuteReader(sql, CommandType.Text, ps);
        }

        /// <summary>
        /// 执行查询 select 返回多行多列
        /// </summary>
        /// <param name="sql"></param>
        /// <param name="ps"></param>
        /// <returns></returns>
        public static SqlDataReader ExecuteReader(string sql, CommandType cmdType, params SqlParameter[] ps)
        {
            //ps => SqlParameter[]ps=new  SqlParameter[];
            SqlConnection conn = new SqlConnection(conStr);
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.CommandType = cmdType;
            if (ps.Length > 0)
            {
                cmd.Parameters.AddRange(ps);
            }
            conn.Open();
            //使用SqlDataReader时，连接必须是打开的；设置此参数后，关闭SqlDataReader时会自动关闭使用的连接
            return cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
        }
    }
}
