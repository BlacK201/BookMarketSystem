using System;
using System.Threading;

namespace BookMarketSystem
{
    public partial class account : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToBoolean(Session["Logged"]) == false)
            {
                Response.Write("请登录！");
                Thread.Sleep(3000);
                Response.Redirect("Login.aspx");
            }
            UserName.Text = "用户：" + Convert.ToString(Session["UserName"]);
            if (Convert.ToInt32(Session["Flag"]) == 99)
            {
                UserName.Text += "<br />用户级别: 管理员";

            }
            else if (Convert.ToInt32(Session["Flag"]) == 1)
            {
                UserName.Text += "<br />用户级别: VIP";
            }
            else if (Convert.ToInt32(Session["Flag"]) == 0)
            {
                UserName.Text += "<br />用户级别: 普通用户";
            }

        }

        protected string test(string a)
        {
            if (a == "3")
            {
                return "admin";
            }
            else return a;
        }
    }
}
