<%@ Page Language="C#" MasterPageFile="~/Client.Master" AutoEventWireup="true" CodeBehind="purchaseOrderEdit.aspx.cs" Inherits="DensNDente_Warehouse_Management.Pages.purchaseOrderEdit" %>

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
            <center style="font-weight: bold; font-size: 26px; color: #ed4e6e;">Update Purchase Order </center>
            <table>

                <tr>
                    <td class="auto-style1">Order No:
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                        </asp:DropDownList></td>
                </tr>

                <tr>
                    <td class="auto-style1" colspan="2">
                        <asp:Label ID="lblOrderDate" runat="server" Text="" Visible="false"></asp:Label></td>

                </tr>
                <tr>
                    <td class="auto-style1" colspan="2">
                        <asp:Label ID="lblVendorName" runat="server" Text="" Visible="false"></asp:Label>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style1">
                        <asp:Button ID="btnEdit" Visible="false" CssClass="button" runat="server" Text="Edit" OnClick="btnEdit_Click" />
                    </td>
                    <td>
                        <asp:Button ID="btnDeliver" Visible="false" CssClass="button" runat="server" Text="Delivered" OnClick="btnDeliver_Click" />
                    </td>
                </tr>
            </table>


        </div>
        <div style="width: 100%;">
            <div class="gridHeaderStyle">
                <asp:Label ID="lblEditProducts" runat="server" Visible="false" Text="Edit Products"></asp:Label>
            </div>
            <br />
            <div style="width: 100%; float: left">
                <center>
                <asp:GridView CssClass="ctable"  Visible="false" ID="gridProduct" runat="server" AutoGenerateColumns="False" DataKeyNames="PODetailId">
                <Columns>  
                     
                    
                    <asp:BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Label ID="lblProductId" Text='<%# Bind("ProductId") %>' runat="server" Visible="false"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Quantity" SortExpression="Quantity">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Quantity") %>' type="number"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Quantity") %>' type="number"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>                    
                </Columns>
            </asp:GridView>                
    </center>
            </div>

        </div>

        <br />
        <div>
            <div style="width: 100%; float: left">

                <center>
            <asp:Button ID="btnupdate" Visible="false" CssClass="button" runat="server" Text="Update" OnClick="btnupdate_Click" />          
            </center>
            </div>
        </div>
    </div>


</asp:Content>
