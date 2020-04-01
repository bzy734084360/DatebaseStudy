using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace _02ScoreInfo
{
    public partial class ScoreList : Form
    {
        public ScoreList()
        {
            InitializeComponent();
        }
        public event Action<int> ShowInfo;
        private void ScoreList_Load(object sender, EventArgs e)
        {
            LoadList();
        }

        private void LoadList()
        {
            string sql = "select *from ScoreInfoList";
            DataTable table = SqlHelper.ExecuteTable(sql);
            dgTable.DataSource = table;
        }

        private void AddToolStripMenuItem_Click(object sender, EventArgs e)
        {
            //
            ScoreSave scoreSave = new ScoreSave();
            scoreSave.ReloadList += LoadList;
            scoreSave.Show();

        }

        private void RemoveToolStripMenuItem_Click(object sender, EventArgs e)
        {
            int sid = Convert.ToInt32(dgTable.SelectedRows[0].Cells[0].Value);
            if (MessageBox.Show("确认要删除吗？", "提示", MessageBoxButtons.YesNo) == DialogResult.Yes)
            {
                //删除
                string sql = $"delete from scoreInfo where scoreid={sid}";
                if (SqlHelper.ExecuteNonQuery(sql) > 0)
                {
                    LoadList();
                }
                else
                {
                    MessageBox.Show("删除失败！");
                }
            }
        }

        private void EditToolStripMenuItem_Click(object sender, EventArgs e)
        {
            //获取选中行
            int sid = Convert.ToInt32(dgTable.SelectedRows[0].Cells[0].Value);
            ScoreSave scoreSave = new ScoreSave();
            scoreSave.ReloadList += LoadList;
            ShowInfo += scoreSave.ShowInfo;
            scoreSave.Show();
            ShowInfo(sid);
        }
    }
}
