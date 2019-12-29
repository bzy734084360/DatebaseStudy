using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace _01窗体传值委托
{
    public partial class Form1 : Form
    {
        //event 关键字用于修饰委托对象，表示事件
        public event FormCall formCall;
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void Button1_Click(object sender, EventArgs e)
        {
            Form2 form2 = new Form2();
            formCall += new FormCall(form2.ShowForm2);
            Form3 form3 = new Form3();
            formCall += form3.ShowForm3;
            form2.Show();
            form3.Show();
        }

        private void Button2_Click(object sender, EventArgs e)
        {
            formCall(1);
        }
    }
}
