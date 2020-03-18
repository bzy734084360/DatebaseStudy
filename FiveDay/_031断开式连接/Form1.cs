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

namespace _031断开式连接
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            //string sql = "select *from studentinfo";
            //using (SqlConnection conn = new SqlConnection("server=.;database=study;uid=sa;pwd=sa"))
            //{
            //    SqlDataAdapter sda = new SqlDataAdapter(sql, conn);
            //    DataTable table = new DataTable();
            //    sda.Fill(table);
            //    dataGridView1.DataSource = table;
            //}
            string sql = "select *from StudentInfo t inner join ClassInfo c on c.ClassID = t.ClassID";
            DataTable dt = SqlHelper.ExecuteTable(sql);
            dataGridView1.AutoGenerateColumns = false;
            dataGridView1.DataSource = dt;

        }

        private void DataGridView1_CellFormatting(object sender, DataGridViewCellFormattingEventArgs e)
        {
            if (e.ColumnIndex == 3)
            {
                if (Convert.ToBoolean(e.Value))
                {
                    e.Value = "男";
                }
                else
                {
                    e.Value = "女";
                }
            }
        }

        private void AddToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FormAdd formAdd = new FormAdd();
            if (formAdd.ShowDialog() == DialogResult.OK)
            {

            }
        }
    }
}
