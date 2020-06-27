using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace BookMarketSystem
{
    public partial class cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["bookid"] != null)
            {
                if (Convert.ToInt32(Request.QueryString["count"]) == 0)
                {
                    return;
                }
                else
                {
                    int UserId = Convert.ToInt32(Session["UserId"]);// 取出书目ID值    
                    int BookId = Convert.ToInt32(Request.QueryString["bookid"]);
                    int Count = Convert.ToInt32(Request.QueryString["count"]);
                    SqlConnection con = new SqlConnection();        //定义数据库连接对象
                    con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;  //定义数据库连接字符串
                    string sql = "SELECT BookCount FROM Cart WHERE UserId=@userid AND BookId=@bookid";
                    con.Open();
                    SqlCommand cmd = new SqlCommand(sql, con);
                    cmd.Parameters.AddWithValue("@userid", UserId);
                    cmd.Parameters.AddWithValue("@bookid", BookId);
                    cmd.Parameters.AddWithValue("@count", Count);
                    if (cmd.ExecuteScalar() == null)
                    {
                        cmd.CommandText = "INSERT INTO Cart(UserId, BookId, BookCount) VALUES(@userid, @bookid, @count)";
                        cmd.ExecuteNonQuery();
                    }
                    else
                    {
                        cmd.CommandText = "UPDATE Cart SET BookCount = BookCount + @count WHERE UserId=@userid AND BookId=@bookid";
                        cmd.ExecuteNonQuery();
                    }

                    con.Close();

                }
            }


            if (Convert.ToBoolean(Session["Logged"]) == false)
            {
                Response.Redirect("User_Login.aspx");
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

        protected void GridView1_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {

            int BookId = Convert.ToInt32(GridView1.Rows[e.RowIndex].Cells[0].Text);// 取出用户ID值   
            int UserId = Convert.ToInt32(Session["UserId"]);// 取出书目ID值    
            SqlConnection con = new SqlConnection();        //定义数据库连接对象
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;  //定义数据库连接字符串
            // SqlCommand com = new SqlCommand();              //定义数据库操作命令对象
            // com.Connection = con;                           //连接数据库
            string sql = "DELETE from Cart WHERE UserId=@userid AND BookId=@bookid";
            con.Open();
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@userid", UserId);
            cmd.Parameters.AddWithValue("@bookid", BookId);
            // com.ExecuteNonQuery();
            cmd.ExecuteNonQuery();
            con.Close();
            GridView1.EditIndex = -1;
            Response.Redirect(Request.Url.ToString());
        }

        // 调用结算存储过程
        protected void Checkout_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            //myProc存储过程的名字
            cmd.CommandText = "Checkout";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserId", Convert.ToInt32(Session["UserId"]));
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            Response.Redirect(Request.Url.ToString());
        }
    }
}
