<%@ Page Title="" Language="C#" MasterPageFile="~/Client.Master" AutoEventWireup="true" CodeBehind="newsletter.aspx.cs" Inherits="DensNDente_Warehouse_Management.WebForm8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 54px;
            font-weight: bold;
            vertical-align: top;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <div style="width: 100%; float: left">
                <table>
                    <tr>
                        <td class="auto-style1"></td>
                        <td style="font-weight: bold; font-size: 26px; color: #ed4e6e">Send Newsletter to all customers</td>
                    </tr>
                    <tr>
                        <td class="auto-style1">Message
                        </td>
                        <td>
                            <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Width="900" Rows="13" require></asp:TextBox>

                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1"></td>
                        <td>
                            <asp:Button ID="btnInsert" Text="Send Newsletter" runat="server" OnClick="btnInsert_Click" CssClass="button" />
                        </td>
                    </tr>
                    <tr>

                        <td class="auto-style1"></td>
                        <td style="text-align: center;">
                            <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                                <ProgressTemplate>
                                    <img src="../Images/ajax-loader.gif" />
                                </ProgressTemplate>
                            </asp:UpdateProgress>
                        </td>

                    </tr>
                </table>

            </div>


            <div style="width: 100%; float: left">

                <div class="gridHeaderStyle">
                    View All Newsletters
                </div>
                <div>
                    <asp:GridView Width="100%" CssClass="ctable" ID="gridNewsletters" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="NewsId" DataSourceID="DSNewsletters">
                        <Columns>
                            <asp:BoundField DataField="NewsDate" DataFormatString="{0:d}" HeaderText="NewsDate" SortExpression="NewsDate" >
                            <ControlStyle Width="100px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Message" HeaderText="Message" SortExpression="Message" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="DSNewsletters" runat="server" ConnectionString="<%$ ConnectionStrings:DensDBConnectionString %>" SelectCommand="SELECT * FROM [tblNewsLetter]"></asp:SqlDataSource>
                </div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
