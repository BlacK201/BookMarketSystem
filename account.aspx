<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="account.aspx.cs" Inherits="BookMarketSystem.account" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="assets/css/main.css" rel="stylesheet" />
    <script src="assets/js/search.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="menu">
                <ul>
                    <li style="width: 0px;"><a></a></li>
                    <li><a href="index.aspx" class="home">商城主页</a></li>
                    <li class="active"><a href="account.aspx" class="account">个人中心</a></li>
                    <li><a href="cart.aspx" class="cart">购物车</a></li>
                    <li style="float: right;"><a href="User_Login.aspx" class="register">
                        <asp:Label ID="UserName" runat="server" Text="登录"></asp:Label></a>
                    </li>
                </ul>
            </div>

            <div style="width: 1000px; margin: 0 auto;">
                <div id="cart">
                    <div class="heading">
                        <a href="cart.aspx" style="padding: 8px; margin-left: -14px;">购物车</a><span style="font-size: 14px; color: #fff;">&raquo;</span>
                        <a href="cart.aspx">
                            <asp:DataList ID="cart_total" runat="server" DataSourceID="CartData">
                                <ItemTemplate>
                                    <asp:Label Text='<%# Convert.ToString(Eval("Count")) + "本 - ￥" + Convert.ToDouble(Eval("TotalPrice")).ToString("F2") %>' runat="server" ID="TotalPriceLabel" CssClass="cart-total" />
                                </ItemTemplate>
                            </asp:DataList>
                        </a>
                    </div>
                    <div class="content"></div>
                </div>

                <div id="search">
                    <div onclick="search()" class="button-search"></div>
                    <input onkeypress="return onKeyPress(event)" id="searchkey" type="text" name="filter_name" placeholder="搜索" value="" onkeydown="this.style.color = '#888';" />
                </div>
            </div>
            <div class="header">
                <div class="logo_img">
                    <a href="index.html">
                        <img alt="Site Name" src="assets/images/logo.png" /></a>
                </div>
            </div>

            <div id="menu">
                <ul>
                    <li>
                        <a>个人中心</a>
                    </li>
                </ul>
            </div>
            <div style="width: 1000px; margin: 0 auto; margin-top: 10px;">
                <div id="column-right">
                    <div class="box">
                        <div class="box-heading_left">个人中心</div>
                        <div class="box-content" style="background: none; border: solid 1px #E3E3E2;">
                            <div class="box-category">
                                <ul>
                                    <li><a href="#">我的账户</a></li>
                                    <li><a href="#">信息修改(暂不提供)</a></li>
                                    <li>
                                        <asp:LinkButton ID="Logout" runat="server" OnClick="Logout_Click">退出登录</asp:LinkButton></li>

                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="content">
                    <h2>我的账户</h2>
                    <div class="content">
                        <ul>
                            <li>
                                <asp:Label ID="accountInformation" runat="server" Text="用户信息<br />"></asp:Label></li>
                        </ul>
                    </div>
                    <h2>信息修改</h2>
                    <div class="content">
                        <ul>
                            <li><a href="#">修改个人信息</a></li>
                            <li><a href="#">修改登录密码</a></li>
                        </ul>
                    </div>
                    <h2>我的订单</h2>
                    <div class="content">
                        <ul>
                            <asp:DataList ID="OrderList" runat="server" Width="100%" DataSourceID="OrderData">
                                <ItemTemplate>
                                    <li>书名：《<asp:Label ID="BookNameLabel" runat="server" Text='<%# Eval("BookName") %>' />》<br />
                                        作者：<asp:Label ID="AuthorNameLabel" runat="server" Text='<%# Eval("AuthorName") %>' /><br />
                                        成交价格：<asp:Label ID="OrderPriceLabel" runat="server" Text='<%# Eval("OrderPrice") %>' /><br />
                                        成交时间：<asp:Label ID="OrderCreateTimeLabel" runat="server" Text='<%# Eval("OrderCreateTime") %>' />
                                    </li>
                                </ItemTemplate>
                            </asp:DataList>

                            <asp:SqlDataSource ID="OrderData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStr %>" SelectCommand="SELECT Authors.AuthorName, Books.BookName, Users.UserName, Orders.OrderPrice, Orders.OrderCreateTime FROM Authors INNER JOIN Books ON Authors.AuthorId = Books.AuthorId INNER JOIN BookClass ON Books.ClassId = BookClass.ClassId INNER JOIN Orders ON Books.BookId = Orders.BookId INNER JOIN Users ON Orders.UserId = Users.UserId WHERE (Users.UserId = @userid) ORDER BY Orders.OrderCreateTime DESC">
                                <SelectParameters>
                                    <asp:SessionParameter Name="userid" SessionField="UserId" />
                                </SelectParameters>
                            </asp:SqlDataSource>

                        </ul>
                    </div>
                </div>
            </div>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <div class="icart-footer">
                <div class="icart-footer-top">
                    <div style="width: 1000px; margin: 0 auto;">
                    </div>
                </div>
                <div class="icart-footer-container">
                    <div class="column_footer" style="width: 100%;">
                        <h3>About Us</h3>
                        <span>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris vel ante felis, aliquet sagittis lacus. Etiam in purus vitae tortor lacinia pretium. Maecenas quam diam, porttitor bibendum lacinia a, feugiat sit amet felis. Praesent ut mi justo, a volutpat ligula. Praesent sodales felis sed odio consectetur eget cursus metus mollis. Proin sollicitudin accumsan lectus a ornare... .
                   
                   </span>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="icart-footer-bottom">
                    <div style="width: 1000px; margin: 0 auto;">
                        <div class="icart-logo-footer">
                            <a href="index.php">
                                <img src="assets/images/logo-footer.png" alt="Footer Logo" /></a>
                        </div>
                        <div class="clearfix"></div>
                    </div>

                </div>
            </div>
        </div>

        <asp:SqlDataSource runat="server" ID="CartData" ConnectionString='<%$ ConnectionStrings:ConnStr %>' SelectCommand="SELECT SUM(BookCount) AS Count, SUM(BookCount * BookPrice) AS TotalPrice FROM (SELECT Books.BookPrice, Cart.BookCount, Users.UserId FROM Books INNER JOIN Cart ON Books.BookId = Cart.BookId INNER JOIN Users ON Cart.UserId = Users.UserId WHERE (Users.UserId = @userid)) AS t GROUP BY UserId">
            <SelectParameters>
                <asp:SessionParameter SessionField="UserId" Name="userid"></asp:SessionParameter>
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
