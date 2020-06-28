<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="BookMarketSystem.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>用户注册</title>
    <link href="assets/css/Login.css" rel="stylesheet" />
    <link href="assets/css/Material%20Icons.css" rel="stylesheet" />
    <style>
        body {
            background-color: #F2F2F2;
        }
    </style>
    <script type="text/javascript">
        window.onload = () => {
            document.getElementsByTagName("body")[0].style.height = document.body.scrollHeight + "px";
        }
    </script>
</head>
<body>
    <div id="container-register">
        <div id="title">
            <i class="material-icons lock">lock</i>用户注册
       
       
       
        </div>
        <form id="form1" runat="server">
            <div>
                <div class="input">
                    <div class="input-addon">
                        <i class="material-icons">email</i>
                    </div>
                    <asp:TextBox ID="email" CssClass="validate" placeholder="E-mail" runat="server" required="required"></asp:TextBox>
                </div>

                <div class="clearfix"></div>

                <div class="input">
                    <div class="input-addon">
                        <i class="material-icons">face</i>
                    </div>
                    <asp:TextBox ID="username" CssClass="validate" runat="server" placeholder="用户名" required="required"></asp:TextBox>
                </div>

                <div class="clearfix"></div>

                <div class="input">
                    <div class="input-addon">
                        <i class="material-icons">vpn_key</i>
                    </div>
                    <asp:TextBox ID="password" CssClass="validate" runat="server" placeholder="密码" TextMode="Password" required="required"></asp:TextBox>
                </div>

                <div class="remember-me">
                    <input type="checkbox" required />
                    <span style="color: #757575">我同意<a href="#">用户协议</a></span>
                </div>
                <asp:Button ID="RegButton" runat="server" Text="注册" OnClick="RegButton_Click" />
            </div>
            <div class="register">
                <span style="color: #657575">已经有帐号了?</span>
                <a href="#" onclick="jumpToLogin()">
                    <button id="register-link">登录</button></a>
            </div>
        </form>
    </div>
    <script>
        function jumpToLogin() {
            window.location.replace("./User_Login.aspx");
        }
    </script>
</body>
</html>
