<%@ Page Title="" Language="C#" MasterPageFile="~/Client.Master" AutoEventWireup="true" CodeBehind="reportProductSoldByTime.aspx.cs" Inherits="DensNDente_Warehouse_Management.WebForm16" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div style="width: 100%; float: left">
        <div class="gridHeaderStyle">
            Sold Product By Time Period
        </div>
        <div>
            <table width="100%">
                <tr>
                    <td>Start Date:
                        <asp:TextBox ID="txtStartDate" runat="server" TextMode="Date"></asp:TextBox></td>
                    <td>End Date:
                        <asp:TextBox ID="txtEndDate" runat="server" TextMode="Date"></asp:TextBox></td>
                    <td>
                        <asp:Button ID="btnGenerateReport" runat="server" Text="Generate Report" CssClass="button" OnClick="btnGenerateReport_Click" />
                    </td>
                </tr>
            </table>
        </div>
        <div>

            <asp:GridView ID="gridProduct" Width="100%" runat="server" AutoGenerateColumns="false" CssClass="ctable" Visible="False">
                <Columns>
                    <asp:BoundField DataField="ProductName" HeaderText="Product Name" />
                    <asp:BoundField DataField="TotalQTY" HeaderText="Total Qty Sold" />
                </Columns>
            </asp:GridView>

        </div>
    </div>

</asp:Content>
