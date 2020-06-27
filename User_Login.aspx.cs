using System;
using System.Configuration;
using System.Data.SqlClient;

namespace BookMarketSystem
{
    public partial class User_Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Convert.ToBoolean(Session["Logged"]) == true)
            {
                Response.Redirect("account.aspx");
            }
        }
        protected void LoginButton_Click(object sender, EventArgs e)
        {
            string connString = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;

            SqlConnection conn = new SqlConnection(connString);

            SqlCommand cmd = new SqlCommand("SELECT UserEMail,UserPassword,UserName,UserFlag,UserId FROM Users", conn);

            conn.Open();

            SqlDataReader sdr = cmd.ExecuteReader();

            while (sdr.Read())
            {
                if (Convert.ToString(sdr[0]) == email.Text && Convert.ToString(sdr[1]) == password.Text)
                {
                    Session["Logged"] = true;
                    Session["UserName"] = Convert.ToString(sdr[2]);
                    Session["Flag"] = Convert.ToInt32(sdr[3]);
                    Session["UserId"] = Convert.ToInt32(sdr[4]);
                    if (Convert.ToInt32(sdr[3]) == 99)
                    {

                        Response.Write("<script type=\"text/javascript\">alert(\"登录成功！欢迎管理员 " + Convert.ToString(sdr[2]) + " 登录！\");</script>");

                    }
                    else
                    {
                        Response.Write("<script type=\"text/javascript\">alert(\"登录成功,！欢迎用户 " + Convert.ToString(sdr[2]) + " 登录！\");</script>");
                    }
                    System.Threading.Thread.Sleep(3000);
                    Response.Redirect("account.aspx");
                }
                else
                {
                    Response.Write("<script type=\"text/javascript\">alert(\"邮箱或密码错误！\");</script>");
                }
            }
            sdr.Close();
            conn.Close();
        }

    }

}
