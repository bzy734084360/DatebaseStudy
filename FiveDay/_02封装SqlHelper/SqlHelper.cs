using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _02封装SqlHelper
{
    /// <summary>
    /// SqlServer数据库工具类
    /// </summary>
    public static partial class SqlHelper
    {
        private static string connStr = ConfigurationManager.ConnectionStrings["dbtest"].ConnectionString;

        /// <summary>
        /// 执行查询 select 返回多行多列
        /// </summary>
        /// <param name="sql"></param>
        /// <param name="ps"></param>
        /// <returns></returns>
        public static SqlDataReader ExecuteReader(string sql, params SqlParameter[] ps)
        {
            //ps => SqlParameter[]ps=new  SqlParameter[];
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(sql, conn);
            if (ps.Length > 0)
            {
                cmd.Parameters.AddRange(ps);
            }
            conn.Open();
            //使用SqlDataReader时，连接必须是打开的；设置此参数后，关闭SqlDataReader时会自动关闭使用的连接
            return cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
        }

        /// <summary>
        /// 执行查询：select 返回首行首列
        /// </summary>
        /// <param name="sql"></param>
        /// <param name="ps"></param>
        /// <returns></returns>
        public static object ExecuteScalar(string sql, params SqlParameter[] ps)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddRange(ps);
                conn.Open();
                return cmd.ExecuteScalar();
            }
        }
        /// <summary>
        /// 执行操作：insert，update，delete
        /// </summary>
        /// <returns></returns>
        public static int ExecutenNonQuery(string sql, params SqlParameter[] ps)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddRange(ps);
                conn.Open();
                return cmd.ExecuteNonQuery();
            }
        }
    }
}
