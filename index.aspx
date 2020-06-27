<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="BookMarketSystem.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="assets/css/main.css" rel="stylesheet" />
    <script src="assets/js/search.js"></script>
    <style>
        /*将table行列转置的css*/
        #menuview tr {
            float: left;
            -webkit-transform: rotate(90deg);
            -moz-transform: rotate(90deg);
        }

        #menuview td {
            -webkit-transform: rotate(-90deg);
            -moz-transform: rotate(-90deg);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="menu">
            <ul>
                <li style="width: 0px;"><a></a></li>
                <li class="active"><a href="index.aspx" class="home">商城主页</a></li>
                <li><a href="account.aspx" class="account">个人中心</a></li>
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
                <li><a href="index.aspx">不限类别</a></li>
                <asp:GridView ID="menuview" runat="server" AutoGenerateColumns="False" DataKeyNames="ClassId" DataSourceID="BookClassData">
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <li><a href="index.aspx?class=<%# Eval("ClassId") %>"><%# Eval("ClassName") %></a></li>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Left"></ItemStyle>
                        </asp:TemplateField>
                    </Columns>

                </asp:GridView>
            </ul>
        </div>

        <div style="width: 1000px; margin: 0 auto; margin-top: 10px;">
            <div class="linktree">
                <a href="#">Home</a>
                &raquo; <a href="#">分类查看</a>
            </div>
            <br />
            <asp:Label ID="BookClassNameLabel" runat="server" Text="不限类别" Font-Size="XX-Large"></asp:Label>
            <br />
            <div id="notification"></div>
            <div id="column-left">
            </div>

            <div id="content">
                <div class="column">
                </div>

                <div class="product-list">
                    <asp:GridView Width="100%" BorderWidth="0" ID="BookList" runat="server" AutoGenerateColumns="False" DataSourceID="BookData">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <div class="struct">
                                        <div class="struct-right"></div>
                                        <div class="struct-left"></div>
                                        <div class="struct-center">
                                            <div class="line">
                                                <div class="line">
                                                    <a href="#" class="image-link">
                                                        <div class="image">
                                                            <img src="assets/images/bookimagenotfound.jpg" title="<%# Eval("BookName") %>" alt="<%# Eval("BookName") %>"></img>
                                                        </div>
                                                    </a>
                                                </div>
                                                <div class="right">
                                                    <div class="price">
                                                        <%# "￥" + Convert.ToDouble(Eval("BookPrice")).ToString("F2") %>
                                                    </div>
                                                    <div class="cart combo">
                                                        <input id="AddCount<%# Eval("BookId") %>" type="text" placeholder="数量" /><a onclick="AddCert('<%# Eval("BookId") %>')" title="加入购物车"><span class="icon icon-basket">加入购物车</span></a>
                                                    </div>
                                                </div>
                                                <div class="name"><a href="#"><%# Eval("BookName") %></a></div>
                                                <div class="description"><%# Eval("BookContent") %></div>
                                                <div class="clearfix"></div>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
                <div class="clearfix"></div>
                <div class="column">
                    <div class="pagination">
                    </div>
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
        <asp:SqlDataSource runat="server" ID="CartData" ConnectionString='<%$ ConnectionStrings:ConnStr %>' SelectCommand="SELECT SUM(BookCount) AS Count, SUM(BookCount * BookPrice) AS TotalPrice FROM (SELECT Books.BookPrice, Cart.BookCount, Users.UserId FROM Books INNER JOIN Cart ON Books.BookId = Cart.BookId INNER JOIN Users ON Cart.UserId = Users.UserId WHERE (Users.UserId = @userid)) AS t GROUP BY UserId">
            <SelectParameters>
                <asp:SessionParameter SessionField="UserId" Name="userid"></asp:SessionParameter>
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource runat="server" ID="BookData" ConnectionString='<%$ ConnectionStrings:ConnStr %>' SelectCommand="SELECT Books.BookId, Books.BookName, Books.BookContent, Authors.AuthorName, Books.BookAddTime, BookClass.ClassName, Books.BookPrice, Books.BookSales FROM Authors INNER JOIN Books ON Authors.AuthorId = Books.AuthorId INNER JOIN BookClass ON Books.ClassId = BookClass.ClassId"></asp:SqlDataSource>

        <asp:SqlDataSource runat="server" ID="BookClassData" ConnectionString='<%$ ConnectionStrings:ConnStr %>' SelectCommand="SELECT [ClassId], [ClassName] FROM [BookClass]"></asp:SqlDataSource>
    </form>
    <script>
        function AddCert(BookId) {
            // console.log(document.getElementById("UserName").innerText);
            if (document.getElementById("UserName").innerText == "登录") {
                alert("请先登录！");
                window.location.replace("./User_Login.aspx");
                return;
            }
            var count = document.getElementById("AddCount" + BookId).value;

            if (count === "") {
                alert("请输入添加的数量！");
                return;
            }

            var httpRequest = new XMLHttpRequest
            httpRequest.open('GET', 'cart.aspx?bookid=' + BookId + '&count=' + count, true);
            httpRequest.send();
            alert("已添加到购物车!");
            location.reload();
        }
    </script>
</body>
</html>
