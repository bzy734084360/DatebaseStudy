using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace _01复习
{
    public partial class Form2 : Form
    {
        public Form2()
        {
            InitializeComponent();
        }

        public event Action Show1;

        private void Form2_Load(object sender, EventArgs e)
        {
            if (Show1 != null)
            {
                Show1();
            }
        }
    }
}
