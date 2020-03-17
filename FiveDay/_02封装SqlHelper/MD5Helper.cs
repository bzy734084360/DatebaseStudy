using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace _02封装SqlHelper
{
    /// <summary>
    /// MD5加密工具类
    /// </summary>
    public static class MD5Helper
    {
        public static string MD5Encrypt(string text)
        {
            MD5CryptoServiceProvider mD5CryptoServiceProvider = new MD5CryptoServiceProvider();
            MD5 md5 = mD5CryptoServiceProvider;
            byte[] result = Encoding.UTF8.GetBytes(text);
            return BitConverter.ToString(md5.ComputeHash(result)).Replace("-", "");
        }
    }
}
