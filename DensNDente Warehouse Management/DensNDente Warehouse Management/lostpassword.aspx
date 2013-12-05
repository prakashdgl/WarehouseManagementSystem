<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="lostpassword.aspx.cs" Inherits="DensNDente_Warehouse_Management.lostpassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Dens 'n Dente : Lost Password</title>
    <link href="Style/Login.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="login">




            <div class="login-screen">
                <div class="app-title">
                    <h1>Lost Password</h1>
                </div>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">

                    <ContentTemplate>
                        <div class="login-form">
                            <div class="control-group">
                                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                            </div>

                            <asp:LinkButton ID="btnLogin" class="btn btn-primary btn-large btn-block" runat="server" OnClick="btnLogin_Click">Send email</asp:LinkButton>

                            <a class="login-link" href="default.aspx">back to login</a>
                            <br />
                            <asp:Label ID="lblError" runat="server" ForeColor="red" Font-Bold="true"></asp:Label>
                            <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                                <ProgressTemplate>
                                    <img src="Images/ajax-loader.gif" />
                                </ProgressTemplate>
                            </asp:UpdateProgress>
                        </div>
                    </ContentTemplate>

                </asp:UpdatePanel>
            </div>
        </div>
    </form>
</body>
</html>
