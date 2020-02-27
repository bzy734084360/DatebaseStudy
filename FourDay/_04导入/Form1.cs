using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace _04导入
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Button1_Click(object sender, EventArgs e)
        {
            try
            {


                DialogResult result = openFileDialog1.ShowDialog();
                if (result == DialogResult.OK)
                {
                    //string fileName = @""; 
                    string filename = openFileDialog1.FileName;
                    StreamReader fileReader = new StreamReader(filename);
                    string sql = "insert into PersonList values(@name,@phone,@birthday,@email)";
                    string temp;

                    #region 参数注入 old

                    //using (SqlConnection conn = new SqlConnection("server=127.0.0.1;database=Study;uid=sa;pwd=sa"))
                    //{
                    //    SqlCommand cmd = new SqlCommand(sql, conn);
                    //    conn.Open();
                    //    while ((temp = fileReader.ReadLine()) != null)
                    //    {
                    //        string[] temp1 = temp.Split(new string[] { "---" }, StringSplitOptions.RemoveEmptyEntries);
                    //        cmd.Parameters.Clear();
                    //        cmd.Parameters.Add(new SqlParameter("@name", temp1[0]));
                    //        cmd.Parameters.Add(new SqlParameter("@phone", temp1[1]));
                    //        cmd.Parameters.Add(new SqlParameter("@birthday", temp1[2]));
                    //        cmd.Parameters.Add(new SqlParameter("@email", temp1[3]));
                    //        cmd.ExecuteNonQuery();
                    //    }
                    //}

                    #endregion

                    #region new 

                    StringBuilder sb = new StringBuilder("insert into PerSonList values");

                    int i = 0;
                    while ((temp = fileReader.ReadLine()) != null)
                    {
                        string[] temp1 = temp.Split(new string[] { "---" }, StringSplitOptions.RemoveEmptyEntries);
                        sb.Append($"('{temp1[0]}','{temp1[1]}','{temp1[2]}','{temp1[3]}'),");
                        i++;
                        if (i == 1000)
                        {
                            i = 0;
                            using (SqlConnection conn = new SqlConnection("server=127.0.0.1;database=Study;uid=sa;pwd=sa"))
                            {
                                SqlCommand cmd = new SqlCommand(sb.ToString().Trim(','), conn);
                                conn.Open();
                                cmd.ExecuteNonQuery();
                            }
                            sb = new StringBuilder("insert into PerSonList values");
                        }
                    }
                    using (SqlConnection conn = new SqlConnection("server=127.0.0.1;database=Study;uid=sa;pwd=sa"))
                    {
                        SqlCommand cmd = new SqlCommand(sb.ToString().Trim(','), conn);
                        conn.Open();
                        cmd.ExecuteNonQuery();
                    }
                    #endregion

                    button1.Text = "ok";
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }
    }
}
