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

namespace _03SqlParammeter
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Button1_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection("server=.;database=Study;uid=Study;pwd=FEIzhuliuxiaofu1"))
            {
                //string sql = $"select count(*) from userinfo where username='{textBox1.Text}'";
                string sql = "select count(*) from userinfo where username=@name";

                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.Add(new SqlParameter("@name", textBox1.Text));
                conn.Open();
                int i = Convert.ToInt32(cmd.ExecuteScalar());
                label1.Text = i.ToString();
            }
        }

        private void Button2_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection("server=.;database=Study;uid=Study;pwd=FEIzhuliuxiaofu1"))
            {
                string sql = $"insert into userinfo values('{textBox2.Text}','21232f297a57a5a743894a0e4a801fc3','1991-01-01 00:00:00.000',null) ";

                SqlCommand cmd = new SqlCommand(sql, conn);
                conn.Open();
                int i = Convert.ToInt32(cmd.ExecuteNonQuery());
                label1.Text = i.ToString();
            }
        }
    }
}
