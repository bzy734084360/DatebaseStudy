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

namespace _03StudentInfo
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            string sql = "select *from studentinfo";
            using (SqlConnection conn = new SqlConnection("server=.'database=study;uid=sa;pwd=sa"))
            {
                SqlDataAdapter sda = new SqlDataAdapter();
                DataTable table = new DataTable();
                sda.Fill(table);
                dataGridView1.DataSource = table;
            }
        }
    }
}
