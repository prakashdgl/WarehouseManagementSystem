<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="DensNDente_Warehouse_Management._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Style/Login.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="login">
            <div class="login-screen">
                <div class="app-title">
                    <h1>Login</h1>
                </div>

                <div class="login-form">
                    <div class="control-group">
                        <asp:TextBox ID="txtEmail" runat="server" placeholder="email"></asp:TextBox>


                    </div>

                    <div class="control-group">
                        <asp:TextBox ID="txtpassword" class="login-field" value="" placeholder="password" runat="server" TextMode="Password"></asp:TextBox>

                    </div>
                    <asp:LinkButton ID="btnLogin" class="btn btn-primary btn-large btn-block" runat="server" OnClick="btnLogin_Click">Login</asp:LinkButton>

                    <a class="login-link" href="lostpassword.aspx">Lost your password?</a>
                    <br />
                    <asp:Label ID="lblError" runat="server" ForeColor="red"></asp:Label>
                </div>
            </div>
        </div>

    </form>
</body>
</html>
