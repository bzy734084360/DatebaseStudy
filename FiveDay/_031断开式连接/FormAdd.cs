using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace _031断开式连接
{
    public partial class FormAdd : Form
    {
        public FormAdd()
        {
            InitializeComponent();
        }

        private void Button1_Click(object sender, EventArgs e)
        {

        }

        private void FormAdd_Load(object sender, EventArgs e)
        {
            string sql = "Select *from classinfo order by ClassID";
            DataTable dt = SqlHelper.ExecuteTable(sql);
            comboBox1.DisplayMember = "ClassName";
            comboBox1.ValueMember = "ClassID";
            comboBox1.DataSource = dt;
        }
    }
}
