<%@ Page Title="" Language="C#" MasterPageFile="~/Client.Master" AutoEventWireup="true" CodeBehind="reportProductByCustomer.aspx.cs" Inherits="DensNDente_Warehouse_Management.WebForm17" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
            <div style="width: 100%; float: left">
                <div class="gridHeaderStyle">
                    Best Selling Products By Customer
                </div>
                <div>
                    Select Customer :
            <asp:DropDownList ID="cbCustomer" runat="server"></asp:DropDownList>
                    <asp:Button ID="btnGenerateReport" runat="server" Text="Generate Report" OnClick="btnGenerateReport_Click" CssClass="button" />
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
