<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User_Login.aspx.cs" Inherits="BookMarketSystem.User_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>用户登录</title>
    <link href="assets/css/Login.css" rel="stylesheet" />
    <link href="assets/css/Material%20Icons.css" rel="stylesheet" />
    <style>
        body {
            background-color: #F2F2F2;
            /*height: 100%;*/
        }
    </style>
    <script type="text/javascript">
        window.onload = () => {
            document.getElementsByTagName("body")[0].style.height = document.body.scrollHeight + "px";
        }
    </script>
</head>
<body>
    <div id="container-login">
        <div id="title">
            <i class="material-icons lock">lock</i>
            用户登录
       
       
       
        </div>
        <form id="form1" runat="server">

            <div class="input">
                <div class="input-addon">
                    <i class="material-icons">email</i>
                </div>
                <asp:TextBox ID="email" CssClass="validate" placeholder="E-mail" runat="server" required="required"></asp:TextBox>
            </div>

            <div class="clearfix"></div>

            <div class="input">
                <div class="input-addon">
                    <i class="material-icons">vpn_key</i>
                </div>
                <asp:TextBox ID="password" CssClass="validate" runat="server" placeholder="密码" TextMode="Password" required="required"></asp:TextBox>
            </div>

            <div class="remember-me">
                <input type="checkbox" />
                <span style="color: #757575">7天内免登录</span>
            </div>

            <asp:Button ID="LoginButton" runat="server" Text="登录" OnClick="LoginButton_Click" />
        </form>

        <div class="forgot-password">
            <a href="#">忘记密码</a>
        </div>

        <div class="register">
            <span style="color: #657575">还没有账号？</span>
            <a href="./Register.aspx">
                <button formnovalidate="formnovalidate" id="register-link">现在注册！</button></a>
        </div>
    </div>
</body>
</html>
