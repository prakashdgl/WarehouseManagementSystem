<%@ Page Title="" Language="C#" MasterPageFile="~/Client.Master" AutoEventWireup="true" CodeBehind="changePassword.aspx.cs" Inherits="DensNDente_Warehouse_Management.WebForm10" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
             <tr>
                        <td class="auto-style1"></td>
                        <td style="font-weight: bold; font-size: 26px; color: #ed4e6e">Change your password</td>
                    </tr>
        </tr>
        <tr>
            <td>New Password:</td>
            <td>
                <asp:TextBox ID="txtpassword" runat="server" TextMode="Password" required></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Re Type Password:</td>
            <td>
                <asp:TextBox ID="txtRePassword" runat="server" TextMode="Password" required></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="btnChange" runat="server" CssClass="button" Text="Save changes" OnClick="btnChange_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
