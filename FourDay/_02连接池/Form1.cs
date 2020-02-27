using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace _02连接池
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Button1_Click(object sender, EventArgs e)
        {
            Stopwatch watch = new Stopwatch();
            watch.Start();
            for (int i = 0; i < 100; i++)
            {
                SqlConnection conn = new SqlConnection(@"server=DESKTOP-92O7JQI\SQLEXPRESS;database=Study;uid=sa;pwd=sa");
                conn.Open();
                conn.Close();
                conn.Dispose();
            }
            watch.Stop();
            label1.Text = watch.ElapsedMilliseconds.ToString();
        }

        private void Button2_Click(object sender, EventArgs e)
        {
            Stopwatch watch = new Stopwatch();
            watch.Start();
            for (int i = 0; i < 100; i++)
            {
                SqlConnection conn = new SqlConnection(@"server=DESKTOP-92O7JQI\SQLEXPRESS;database=Study;uid=sa;pwd=sa;pooling=false");
                conn.Open();
                conn.Close();
                conn.Dispose();
            }
            watch.Stop();
            label2.Text = watch.ElapsedMilliseconds.ToString();
        }
    }
}
