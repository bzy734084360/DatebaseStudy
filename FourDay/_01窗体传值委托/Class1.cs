using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _01窗体传值委托
{
    /// <summary>
    /// 定义了一个方法的格式，是一个类型，命名规则与类一样
    /// </summary>
    /// <param name="a"></param>
    /// <param name="b"></param>
    public delegate void A1(int a, string b);
    //窗体传值对象
    public delegate void FormCall(int id);

}
