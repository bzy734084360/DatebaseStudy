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

namespace _02ScoreInfo
{
    public partial class ScoreSave : Form
    {
        public event Action ReloadList;
        public ScoreSave()
        {
            InitializeComponent();
        }

        private void Btn_Save_Click(object sender, EventArgs e)
        {
            string sql;
            if (string.IsNullOrEmpty(lblT.Text))
            {
                sql = "insert into scoreInfo values (@stuid,@subid,@score)";
            }
            else
            {
                //修改
                sql = $"update scoreInfo set stuid=@stuid,subid=@subid,score=@score where scoreid={lblT.Text}";
            }
            SqlParameter[] ps = {
                new SqlParameter("@stuid",cboStudent.SelectedValue),
                new SqlParameter("@subid",cboSub.SelectedValue),
                new SqlParameter("@score",txtScore.Text),
            };
            if (SqlHelper.ExecuteNonQuery(sql, ps) > 0)
            {
                ReloadList();
                this.Close();
            }
            else
            {
                MessageBox.Show("保存失败");
            }
        }

        private void ScoreSave_Load(object sender, EventArgs e)
        {
            //加载班级信息
            string sql = "select *from classInfo";
            cboClass.DisplayMember = "ClassName";
            cboClass.ValueMember = "ClassId";
            cboClass.DataSource = SqlHelper.ExecuteTable(sql);
            //加载科目信息
            sql = "select *from subJectInfo";
            cboSub.DisplayMember = "subTitle";
            cboSub.ValueMember = "subID";
            cboSub.DataSource = SqlHelper.ExecuteTable(sql);
        }

        private void CboClass_SelectedIndexChanged(object sender, EventArgs e)
        {
            string sql = $"select studentId,studentName from StudentInfo where ClassID={cboClass.SelectedValue}";


            cboStudent.DisplayMember = "studentName";
            cboStudent.ValueMember = "studentId";
            DataTable dt = SqlHelper.ExecuteTable(sql);
            if (dt.Rows.Count > 0)
            {
                cboStudent.DataSource = dt;
            }
            else
            {
                //将下拉列表清空
                cboStudent.DataSource = null;
                //cboStudent.Items.Clear();
                cboStudent.Text = "暂无学生";
            }
        }

        public void ShowInfo(int sid)
        {
            string sql = $"select *from ScoreInfoList where scoreId={sid}";
            SqlDataReader reader = SqlHelper.ExecuteReader(sql);
            reader.Read();
            cboClass.SelectedValue = reader["ClassID"];
            cboStudent.SelectedValue = reader["StudentID"];
            cboSub.SelectedValue = reader["subiD"];
            txtScore.Text = reader["score"].ToString();
            lblT.Text = sid.ToString();
        }
    }
}
