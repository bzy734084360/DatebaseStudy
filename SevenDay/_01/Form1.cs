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

namespace _01
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private int pageIndex, pageSize;

        private void Form1_Load(object sender, EventArgs e)
        {
            //加载数据
            pageIndex = 1;
            pageSize = 2;
            LoadList();
        }

        private void LoadList()
        {
            //调用存储过程
            //名称
            string sql = "SeachStudent";
            //DataTable table = new DataTable();
            //参数构造
            SqlParameter pIndex = new SqlParameter("@pageindex", pageIndex);
            SqlParameter pSize = new SqlParameter("@pagesize", pageSize);
            SqlParameter pCount = new SqlParameter("@rowsCount", SqlDbType.Int);
            using (SqlConnection conn = new SqlConnection("server=.;database=study;uid=sa;pwd=sa"))
            {
                SqlCommand cmd = new SqlCommand(sql, conn);
                //指定命令类型为存储过程
                cmd.CommandType = CommandType.StoredProcedure;
                //将参数设置为输出
                pCount.Direction = ParameterDirection.Output;

                //为cmd添加参数
                cmd.Parameters.Add(pIndex);
                cmd.Parameters.Add(pSize);
                cmd.Parameters.Add(pCount);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                List<StudentInfo> list = new List<StudentInfo>();
                while (reader.Read())
                {
                    StudentInfo st = new StudentInfo();
                    st.StudentID = Convert.ToInt32(reader["StudentID"]);
                    st.StudentName = reader["StudentName"].ToString();
                    st.StudentGender = Convert.ToInt32(reader["StudentGender"]);
                    list.Add(st);
                }
                dataGridView1.DataSource = list;
                //SqlDataAdapter app = new SqlDataAdapter(sql, conn);
                //app.
                //app.Fill(table);
            }
            //返回值需要在执行操作数据库之后获取
            txtCount.Text = pCount.Value.ToString();

            //赋值
            //dataGridView1.DataSource = table;
        }

        private void 上一页ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            pageIndex--;
            if (pageIndex == 0)
            {
                pageIndex = 1;
            }
            LoadList();
        }

        private void 下一页ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            pageIndex++;
            int maxPage;
            int rowsCount = int.Parse(txtCount.Text);
            //计算总页数
            maxPage = (int)Math.Ceiling(rowsCount * 1.0 / pageSize);
            //if (rowsCount % pageSize == 0)
            //{
            //    maxPage = rowsCount / pageSize;
            //}
            //else
            //{
            //    maxPage = Convert.ToInt32((rowsCount / pageSize)) + 1;
            //}
            //修正页索引
            if (pageIndex > maxPage)
            {
                pageIndex = maxPage;
            }
            LoadList();
        }
    }
}
