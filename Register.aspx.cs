using System;
using System.Configuration;
using System.Data.SqlClient;

namespace BookMarketSystem
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RegButton_Click(object sender, EventArgs e)
        {
            string connString = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;

            SqlConnection conn = new SqlConnection(connString);

            SqlCommand checkUserNameCmd = new SqlCommand("SELECT COUNT(*) FROM Users WHERE UserName='" + username.Text + "'", conn);
            SqlCommand checkEMailCmd = new SqlCommand("SELECT COUNT(*) FROM Users WHERE UserEMail='" + email.Text + "'", conn);
            SqlCommand regNewUserCmd = new SqlCommand("INSERT INTO Users(UserEMail,UserName,UserPassword,UserRegTime,UserStatus,UserFlag) VALUES('" +
                                                        email.Text + "','" + username.Text + "','" + password.Text + "',GETDATE(),0,0)", conn);
            SqlCommand getUserCountCmd = new SqlCommand("SELECT COUNT(*) FROM Users", conn);
            conn.Open();
            if (Convert.ToInt32(checkEMailCmd.ExecuteScalar()) == 0)
            {
                if (Convert.ToInt32(checkUserNameCmd.ExecuteScalar()) == 0)
                {
                    regNewUserCmd.ExecuteNonQuery();
                    Response.Write("<script type=\"text/javascript\">alert(\"欢迎加入！您是我们的第" + Convert.ToInt32(getUserCountCmd.ExecuteScalar()) + "位用户！\");</script>");
                }
                else
                {
                    Response.Write("<script type=\"text/javascript\">alert(\"用户名已被注册！\");</script>");
                }
            }
            else
            {
                Response.Write("<script type=\"text/javascript\">alert(\"该邮箱已经存在对应账号！\");</script>");
            }
            conn.Close();
        }
    }
}
