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

namespace _02封装SqlHelper
{
    public partial class Form1 : Form
    {
        private Dictionary<string, LoginInfo> dictInfo = new Dictionary<string, LoginInfo>();
        public Form1()
        {
            InitializeComponent();
        }

        private void BtnLogin_Click(object sender, EventArgs e)
        {
            string sql = "select * from userinfo where username=@name";
            SqlParameter p = new SqlParameter("@name", txtUserid.Text);
            SqlDataReader reader = SqlHelper.ExecuteReader(sql, p);
            LoginInfo info = new LoginInfo();
            string pwd = string.Empty;
            while (reader.Read())
            {
                info.Nums = reader["ErrorCount"] != DBNull.Value ? Convert.ToInt32(reader["ErrorCount"]) : 0;
                pwd = reader["userpwd"] != DBNull.Value ? reader["userpwd"].ToString() : string.Empty;
                info.Time = reader["ErrorTime"] != DBNull.Value ? Convert.ToDateTime(reader["ErrorTime"]) : DateTime.MinValue;
            }
            if (ComparTime(txtUserid.Text, info))
            {
                MessageBox.Show("登录失败次数过多，等候15分钟再次登录！");
                return;
            }


            if (string.IsNullOrEmpty(pwd))
            {
                MessageBox.Show("用户名错误！");
            }
            else if (pwd.ToString().ToUpper().Equals(MD5Helper.MD5Encrypt(txtPwd.Text).ToUpper()))
            {
                MessageBox.Show("登录成功！");
                ClearTimeAndNums(txtUserid.Text, info);

            }
            else
            {
                SetTimeAndNums(txtUserid.Text, info);
                MessageBox.Show("密码错误！");
            }
        }

        private void SetTimeAndNums(string userName, LoginInfo loginInfo)
        {
            //判断是否已存入当前用户登录失败记录
            //if (!dictInfo.ContainsKey(userName))
            //{
            //LoginInfo loginInfo = new LoginInfo { Nums = 0, Time = DateTime.Now };
            ////Dictionary<string, LoginInfo> dict = new Dictionary<string, LoginInfo>();
            ////dict.Add(userName, loginInfo);
            //dictInfo.Add(userName, loginInfo);
            //string sql = "select userpwd from userinfo where username=@name";
            string sql = "update userinfo set ErrorCount=@errorCount,ErrorTime=@errorTime  where username=@name";

            SqlParameter[] p = new SqlParameter[] { new SqlParameter("@name", txtUserid.Text),
                new SqlParameter("@errorCount", ++loginInfo.Nums), new SqlParameter("@errorTime",DateTime.Now) };
            SqlHelper.ExecutenNonQuery(sql, p);
            //}
            //else
            //{
            //    dictInfo[userName].Nums++;
            //    dictInfo[userName].Time = DateTime.Now;
            //}
        }
        private void ClearTimeAndNums(string userName, LoginInfo loginInfo)
        {
            //if (dictInfo.ContainsKey(userName))
            //{
            //    dictInfo.Remove(userName);
            //}
            string sql = "update userinfo set ErrorCount=@errorCount,ErrorTime=@errorTime  where username=@name";
            int i = 0;
            SqlParameter[] p = new SqlParameter[] { new SqlParameter("@name", txtUserid.Text),
                new SqlParameter("@errorCount", i), new SqlParameter("@errorTime", Convert.ToDateTime("2000-01-01 00:00:00")) };
            SqlHelper.ExecutenNonQuery(sql, p);

            //string sql = "update userinfo set ErrorTime=@errorTime  where username=@name";
            //,new SqlParameter("@errorCount", 0)

            //SqlParameter[] p = new SqlParameter[] { new SqlParameter("@name", txtUserid.Text), new SqlParameter("@errorTime", Convert.ToDateTime("2000-01-01 00:00:00")) };
            //SqlHelper.ExecutenNonQuery(sql, p);
        }

        private bool ComparTime(string userName, LoginInfo loginInfo)
        {
            bool result = false;
            //if (dictInfo.ContainsKey(userName))
            //{
            //    LoginInfo info = dictInfo[userName];
            //    TimeSpan timeSpan = DateTime.Now - info.Time;
            //    if (timeSpan.TotalMinutes >= 15 || (info.Nums < 2))
            //    {
            //        result = false;
            //    }
            //    else
            //    {
            //        result = true;
            //    }

            //}
            //else
            //{
            //    result = false;
            //}
            TimeSpan timeSpan = DateTime.Now - loginInfo.Time;
            if (timeSpan.TotalMinutes >= 15 || (loginInfo.Nums < 3))
            {
                result = false;
            }
            else
            {
                result = true;
            }
            return result;
        }
    }
    public class LoginInfo
    {
        public int Nums { get; set; }
        public DateTime Time { get; set; }
    }
}
