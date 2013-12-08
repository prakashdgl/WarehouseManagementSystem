<%@ Page Title="" Language="C#" MasterPageFile="~/Client.Master" AutoEventWireup="true" CodeBehind="reportStock.aspx.cs" Inherits="DensNDente_Warehouse_Management.WebForm9" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div style="width: 100%; float: left">
        <div class="gridHeaderStyle">
            Current Stock
        </div>
        <div>

            <asp:GridView ID="gridStock" Width="100%" runat="server" AutoGenerateColumns="false" CssClass="ctable">
                <Columns>
                    <asp:BoundField DataField="ProductName" HeaderText="Product Name" SortExpression="ProductName" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity In Stock" SortExpression="Quantity" />

                    <asp:BoundField DataField="SafetyStockLevel" HeaderText="Safety Stock Level" SortExpression="SafetyStockLevel" />
                    <asp:BoundField DataField="StandardCost" HeaderText="Standard Cost" SortExpression="StandardCost" />

                </Columns>
            </asp:GridView>

        </div>
    </div>

</asp:Content>
