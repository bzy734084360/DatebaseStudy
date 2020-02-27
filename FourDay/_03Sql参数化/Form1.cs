using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace _03Sql参数化
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Button1_Click(object sender, EventArgs e)
        {
            //查询用户名的个数
            using (SqlConnection conn = new SqlConnection(
                "server=127.0.0.1;database=Study;uid=sa;pwd=sa"))
            {
                //string sql = "select count(*) from UserInfo where username='" + textBox1.Text + "'";
                //参数化SQL语句
                string sql = "select count(*) from UserInfo where username=@name";


                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.Add(new SqlParameter("@name", textBox1.Text));
                    conn.Open();
                    int i = Convert.ToInt32(cmd.ExecuteScalar());
                    MessageBox.Show(i.ToString());
                }
            }
        }

        private void Button2_Click(object sender, EventArgs e)
        {

            //插入数据
            using (SqlConnection conn = new SqlConnection(
                "server=127.0.0.1;database=Study;uid=sa;pwd=sa"))
            {
                //string sql = $"insert into Userinfo values('{textBox1.Text}','132465','{DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")}',null)";
                string sql = $"insert into Userinfo values(@name,'132465','{DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")}',null)";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.Add(new SqlParameter("@name", textBox1.Text));
                    conn.Open();
                    int i = cmd.ExecuteNonQuery();
                    MessageBox.Show(i.ToString());
                }
            }
        }
    }
}
