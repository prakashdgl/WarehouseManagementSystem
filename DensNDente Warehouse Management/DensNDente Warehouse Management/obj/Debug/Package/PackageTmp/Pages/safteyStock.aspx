<%@ Page Title="" Language="C#" MasterPageFile="~/Client.Master" AutoEventWireup="true" CodeBehind="safteyStock.aspx.cs" Inherits="DensNDente_Warehouse_Management.WebForm5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
        
            <div style="width: 100%; float: left;">
                <div class="gridHeaderStyle">
                    Products that need to order
                </div>
                <div>
                    <asp:GridView CssClass="ctable" Width="100%" ID="gridRole" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="DsSafteyProduct" PageSize="30">
                        <Columns>
                            <asp:BoundField DataField="ProductName" HeaderText="Product Name" SortExpression="ProductName" />
                            <asp:BoundField DataField="StandardCost" HeaderText="Standard Cost" SortExpression="StandardCost" />
                            <asp:BoundField DataField="SafetyStockLevel" HeaderText="Safety Stock Level" SortExpression="SafetyStockLevel" />
                            <asp:BoundField DataField="Quantity" HeaderText="Quantity In Stock" SortExpression="Quantity" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="DsSafteyProduct" runat="server" ConnectionString="<%$ ConnectionStrings:DensDBConnectionString %>" SelectCommand="SELECT ProductName, StandardCost, SafetyStockLevel, Quantity FROM tblProduct WHERE (Quantity &lt; SafetyStockLevel) AND (Deleted = 'false')"></asp:SqlDataSource>
                </div>
            </div>
       
  
</asp:Content>
