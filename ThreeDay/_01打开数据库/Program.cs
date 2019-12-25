using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace _01打开数据库
{
    class Program
    {
        static void Main(string[] args)
        {
            int r = 0;
            //连接字符串
            string str = @"Data Source=DESKTOP-UI62UKP\SQLEXPRESS;Initial Catalog=Study;Persist Security Info=True;User ID=sa;Password=sa";
            using (SqlConnection con = new SqlConnection(str))//连接数据库
            {
                //con.Close();
                //con.Dispose();
                //con.Open();打开数据库
                //修改数据
                string sql = "update StudentInfo set studentName='张七八' where StudentID=5";
                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    con.Open();
                    //cmd.Dispose();
                    //增删改调用该方法 返回受影响的行数
                    r = cmd.ExecuteNonQuery();

                }
            }
            Console.WriteLine(r > 0 ? "操作成功" : "操作失败");
            Console.ReadKey();
        }
    }
}
