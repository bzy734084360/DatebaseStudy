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

namespace _05省市区联动
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private string connStr = "server=.;database=Study;uid=sa;pwd=sa";

        private void Form1_Load(object sender, EventArgs e)
        {
            LoadProvice();
            //LoadCity();
            //LoadDistrict();
        }
        /// <summary>
        /// 加载省份
        /// </summary>
        private void LoadProvice()
        {
            List<AreaInfo> list = new List<AreaInfo>();

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sql = "select *from s_province";
                SqlCommand cmd = new SqlCommand(sql, conn);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    list.Add(new AreaInfo()
                    {
                        Id = Convert.ToInt32(reader["ProvinceId"]),
                        Title = reader["ProvinceName"].ToString()
                    });
                }
                cboPro.DisplayMember = "Title";//显示属性
                cboPro.ValueMember = "Id";//值属性
                cboPro.DataSource = list;
            }
        }

        private void LoadCity()
        {
            int pid = Convert.ToInt32(cboPro.SelectedValue);
            string sql = "select *from s_city t where t.provinceid=@pid";
            List<AreaInfo> list = new List<AreaInfo>();
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.Add(new SqlParameter("@pid", pid));
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    list.Add(new AreaInfo()
                    {
                        Id = Convert.ToInt32(reader["cityid"]),
                        Title = reader["cityName"].ToString()
                    });

                }
                cobCity.DisplayMember = "Title";
                cobCity.ValueMember = "Id";
                cobCity.DataSource = list;

            }
        }

        private void LoadDistrict()
        {
            int cid = Convert.ToInt32(cobCity.SelectedValue);
            string sql = "select *from s_district t where t.cityid=@cid";
            List<AreaInfo> list = new List<AreaInfo>();
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.Add(new SqlParameter("@cid", cid));
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    list.Add(new AreaInfo()
                    {
                        Id = Convert.ToInt32(reader["districtid"]),
                        Title = reader["districtName"].ToString()
                    });

                }
                cobdis.DisplayMember = "Title";
                cobdis.ValueMember = "Id";
                cobdis.DataSource = list;

            }
        }

        private void CboPro_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadCity();
            LoadDistrict();
        }

        private void CobCity_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadDistrict();
        }
    }
}
