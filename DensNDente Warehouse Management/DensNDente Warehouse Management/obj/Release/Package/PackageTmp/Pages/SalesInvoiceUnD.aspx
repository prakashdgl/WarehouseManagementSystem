<%@ Page Title="" Language="C#" MasterPageFile="~/Client.Master" AutoEventWireup="true" CodeBehind="SalesInvoiceUnD.aspx.cs" Inherits="DensNDente_Warehouse_Management.Pages.SalesInvoiceUnD" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        .auto-style1 {
            width: 130px;
            text-align: right;
            padding-right: 10px;
            font-weight: bold;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <div>
        <div style="width: 100%; float: left">
            <center style="font-weight: bold; font-size: 26px; color: #ed4e6e; text-decoration: underline;">Update Sales Invoice </center>
            <table>

                <tr>
                    <td class="auto-style1">Invoice No:
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataTextField="name" DataValueField="id" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                        </asp:DropDownList>


                    </td>
                </tr>

                <tr>
                    <td class="auto-style1">Customer Name:</td>
                    <td>
                        <asp:Label ID="lblCustName" runat="server" Text="" Visible="false"></asp:Label>
                    </td>
                </tr>
            </table>


        </div>
        <div style="width: 100%; float: left">
            <div class="gridHeaderStyle">
                Add Products
            </div>
            <br />
            <div style="width: 100%; float: left">


                <asp:GridView CssClass="ctable" ID="gridProduct1" runat="server" AutoGenerateColumns="False" DataKeyNames="ProductId" Visible="false">
                    <Columns>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                <asp:Label ID="Label1" Text="Select Products" runat="server" />

                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkbox1" runat="server" OnCheckedChanged="chkbox1_CheckedChanged" AutoPostBack="true" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:CheckBox ID="chkbox1" runat="server" />
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ProductId" Visible="false" HeaderText="ProductId" InsertVisible="False" ReadOnly="True" SortExpression="ProductId" />
                        <asp:BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName" />
                        <asp:TemplateField HeaderText="SellingCost" SortExpression="SellingCost">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("SellingCost") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="SellingCost" runat="server" Text='<%# Bind("SellingCost") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Quantity" HeaderText="Available Quantity" SortExpression="Quantity" />

                        <asp:TemplateField ControlStyle-Width="10px">
                            <HeaderTemplate>
                                Quantity
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:TextBox type="number" min="0" ID="txtQuantity" runat="server" Visible="false" OnTextChanged="txtQuantity_TextChanged" AutoPostBack="true"></asp:TextBox>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox>
                            </EditItemTemplate>

                            <ControlStyle Width="10px"></ControlStyle>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>

        </div>

        <br />
        <div>
            <div style="width: 100%; float: left">

                <table>

                    <tr>
                        <td class="auto-style1">Total:
                        </td>
                        <td>
                            <asp:Label ID="lblTotal1" runat="server" Width="250" Visible="false"></asp:Label>

                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">Tax:
                        </td>
                        <td>
                            <asp:TextBox ID="txtTax1" Visible="false" runat="server" Width="250" Text="13" required></asp:TextBox>
                        </td>

                    </tr>

                    <tr>
                        <td class="auto-style1">Discount:
                        </td>
                        <td>
                            <asp:TextBox ID="txtDiscount1" runat="server" Width="250" OnTextChanged="txtDiscount_TextChanged" AutoPostBack="true"
                                Text="0" Visible="false"></asp:TextBox>
                        </td>

                    </tr>
                    <tr>
                        <td class="auto-style1">Net Total:
                        </td>
                        <td>
                            <asp:Label ID="lblNetTotal1" runat="server" Width="250" Visible="false"></asp:Label>

                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1"></td>
                        <td>

                            <asp:Button ID="updateSaleInvoice" CssClass="button" runat="server" Text="Update" OnClick="updateSaleInvoice_Click" />
                        </td>
                        <td>
                            <asp:Button ID="deleteSaleInvoice" CssClass="button" runat="server" Text="Delete" OnClick="deleteSaleInvoice_Click" />

                        </td>
                    </tr>
                </table>


            </div>
        </div>
    </div>


</asp:Content>
