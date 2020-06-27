using System;
using System.Configuration;
using System.Data.SqlClient;
namespace BookMarketSystem
{
    public partial class index : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToBoolean(Session["Logged"]) == true)
            {
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

            if (Request.QueryString["class"] != null)
            {
                BookData.SelectCommand = "SELECT Books.BookName, Books.BookContent, Authors.AuthorName, Books.BookAddTime, BookClass.ClassName, Books.BookPrice, Books.BookSales, Books.BookId, Books.BookImageUrl FROM Authors INNER JOIN Books ON Authors.AuthorId = Books.AuthorId INNER JOIN BookClass ON Books.ClassId = BookClass.ClassId WHERE BookClass.ClassId = " + Request.QueryString["class"];
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString);

                SqlCommand cmd = new SqlCommand("SELECT ClassName FROM BookClass WHERE ClassId = " + Request.QueryString["class"], conn);

                conn.Open();

                string BookClassName = Convert.ToString(cmd.ExecuteScalar());

                BookClassNameLabel.Text = BookClassName + "类";
                conn.Close();
            }

            if (Request.QueryString["searchkey"] != null)
            {
                BookData.SelectCommand = "SELECT Books.BookName, Books.BookContent, Authors.AuthorName, Books.BookAddTime, BookClass.ClassName, Books.BookPrice, Books.BookSales, Books.BookId, Books.BookImageUrl FROM Authors INNER JOIN Books ON Authors.AuthorId = Books.AuthorId INNER JOIN BookClass ON Books.ClassId = BookClass.ClassId WHERE Books.BookName LIKE '%" + Request.QueryString["searchkey"] + "%'";
            }
        }
    }
}
