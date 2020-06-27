<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="BookMarketSystem.cart" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="assets/css/main.css" rel="stylesheet" />
    <link href="assets/css/Material%20Icons.css" rel="stylesheet" />
    <style>
        .text-center {
            text-align: center;
        }
    </style>
    <script src="assets/js/search.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="menu">
                <ul>
                    <li style="width: 0px;"><a></a></li>
                    <li><a href="index.aspx" class="home">商城主页</a></li>
                    <li><a href="account.aspx" class="account">个人中心</a></li>
                    <li class="active"><a href="cart.aspx" class="cart">购物车</a></li>
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
                        <a>购物车</a>
                    </li>
                </ul>
            </div>

            <div style="width: 1000px; margin: 0 auto; margin-top: 10px;">
                <div class="linktree">
                    <a href="#">Home</a>
                    &raquo; <a href="#">Shopping Cart</a>
                </div>
                <h1 style="margin-top: -10px;">Shopping Cart&nbsp;(20.00kg)</h1>
                <br />
                <div class="cart-info">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="CartData_All" OnRowDeleting="GridView1_RowDeleting">
                        <Columns>
                            <asp:BoundField ItemStyle-CssClass="text-center" DataField="BookId" HeaderText="图书编号" InsertVisible="False" SortExpression="BookId">
                                <HeaderStyle BorderWidth="1" BorderStyle="Solid" />
                            </asp:BoundField>

                            <asp:ImageField ItemStyle-CssClass="image" HeaderText="封面" NullImageUrl="assets/images/bookimagenotfound.jpg" DataImageUrlField="BookImageUrl">
                                <HeaderStyle BorderWidth="1" BorderStyle="Solid" />
                            </asp:ImageField>
                            <asp:BoundField ItemStyle-CssClass="name" DataField="BookName" HeaderText="书名" SortExpression="BookName">
                                <HeaderStyle BorderWidth="1" BorderStyle="Solid" />
                            </asp:BoundField>
                            <asp:BoundField ItemStyle-CssClass="model" DataField="AuthorName" HeaderText="作者" SortExpression="AuthorName">
                                <HeaderStyle BorderWidth="1" BorderStyle="Solid" />
                            </asp:BoundField>
                            <asp:BoundField ItemStyle-CssClass="quantity" DataField="BookCount" HeaderText="数量" SortExpression="BookCount">
                                <HeaderStyle BorderWidth="1" BorderStyle="Solid" />
                            </asp:BoundField>
                            <asp:BoundField ItemStyle-CssClass="price" DataField="BookPrice" HeaderText="单价" SortExpression="BookPrice">
                                <HeaderStyle BorderWidth="1" BorderStyle="Solid" />
                            </asp:BoundField>
                            <asp:BoundField ItemStyle-CssClass="total" DataField="TotalPrice" HeaderText="总价" ReadOnly="True" SortExpression="TotalPrice">
                                <HeaderStyle BorderWidth="1" BorderStyle="Solid" />
                            </asp:BoundField>
                            <asp:CommandField DeleteText="delete" ShowDeleteButton="True" HeaderText="删除">
                                <ControlStyle CssClass="material-icons"></ControlStyle>

                                <HeaderStyle BorderWidth="1px" BorderStyle="Solid"></HeaderStyle>

                                <ItemStyle CssClass="text-center"></ItemStyle>
                            </asp:CommandField>
                        </Columns>
                    </asp:GridView>
                </div>
                <div class="buttons">
                    <div class="left"><a class="button" href="cart.aspx"><span>刷新</span></a></div>
                    <div class="right">
                        <asp:Button CssClass="button" ID="Checkout" runat="server" Text="结算" OnClick="Checkout_Click" />
                    </div>
                    <div class="center"><a href="index.aspx" class="button" style="width: 200px;"><span>继续浏览商城</span></a></div>
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
        <asp:SqlDataSource runat="server" ID="CartData_All" ConnectionString='<%$ ConnectionStrings:ConnStr %>' SelectCommand="SELECT Users.UserId, Books.BookId, Books.BookName, Authors.AuthorName, Books.BookPrice, Cart.BookCount, Books.BookPrice * Cart.BookCount AS TotalPrice, Books.BookImageUrl FROM Books INNER JOIN Cart ON Books.BookId = Cart.BookId INNER JOIN Authors ON Authors.AuthorId = Books.AuthorId INNER JOIN Users ON Cart.UserId = Users.UserId WHERE (Users.UserId = @userid)">
            <SelectParameters>
                <asp:SessionParameter SessionField="UserId" Name="userid"></asp:SessionParameter>
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
