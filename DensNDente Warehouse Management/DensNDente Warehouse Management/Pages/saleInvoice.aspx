<%@ Page Title="" Language="C#" MasterPageFile="~/Client.Master" AutoEventWireup="true" CodeBehind="saleInvoice.aspx.cs" Inherits="DensNDente_Warehouse_Management.WebForm15" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <style type="text/css">
        .auto-style1 {
            width: 130px;
            text-align: right;
            padding-right: 10px;
            font-weight: bold;
        }
    </style>
     <script type="text/javascript">

         function SelectAll(invoker) {
             var inputElements = document.getElementsByTagName('input');
             for (var i = 0; i < inputElements.length; i++) {
                 var myElement = inputElements[i];
                 if (myElement.type === "checkbox") {
                     myElement.checked = invoker.checked;
                 }
             }
         }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div>
        <div style="width: 100%; float: left">
<center style="font-weight:bold; font-size:26px;color:#ed4e6e">Add New Sales Invoice </center>
            <table>
               
                <tr>
                    <td class="auto-style1">Invoice No:
                    </td>
                    <td>
                        <asp:Label ID="lblInvoiceNo" runat="server" Width="250" Font-Size="Large" ForeColor="RoyalBlue"></asp:Label>

                    </td>
                </tr>
                 <%--<tr>
                    <td class="auto-style1">Invoice Date:
                    </td>
                    <td>
                        <asp:TextBox ID="txtDate" runat="server" Width="250" required></asp:TextBox>
                    </td>
                 
                </tr>--%>
                <tr>
                    <td class="auto-style1">
                        Customer Name:</td>
                    <td>
                        <asp:DropDownList ID="customerDropDown" runat="server" DataSourceID="SqlDataSource1" DataTextField="Firstname" DataValueField="CustomerId">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DensDBConnectionString %>" SelectCommand="SELECT [CustomerId], [Firstname] FROM [tblCustomer] WHERE ([Deleted] = @Deleted)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="false" Name="Deleted" Type="Boolean" />
                            </SelectParameters>
                        </asp:SqlDataSource>
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

                
     <asp:GridView CssClass="ctable"  ID="gridProduct" runat="server" AutoGenerateColumns="False" DataKeyNames="ProductId" >
                <Columns>
                     <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:Label Text="Select Products" runat="server" />
                                   <%-- <input id="chkbox" type="checkbox" onclick=" SelectAll(this)" />--%>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkbox1" runat="server" OnCheckedChanged="chkbox_CheckedChanged" AutoPostBack="true"/>
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
                                    <asp:TextBox ID="txtQuantity" runat="server" OnTextChanged="txtQuantity_TextChanged" AutoPostBack="true" Visible="false" required ></asp:TextBox>
                                </ItemTemplate>
                                <EditItemTemplate>
                                   <asp:TextBox ID="txtQuantity" runat="server" required></asp:TextBox>
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
                        <asp:Label ID="lblTotal" runat="server" Width="250"></asp:Label>

                    </td>
                </tr>
                 <tr>
                    <td class="auto-style1">Tax:
                    </td>
                    <td>
                        <asp:TextBox ID="txtTax" runat="server" Width="250" Text="13" required></asp:TextBox>
                    </td>
                 
                </tr>

                <tr>
                    <td class="auto-style1">Discount:
                    </td>
                    <td>
                        <asp:TextBox ID="txtDiscount" runat="server" Width="250" OnTextChanged="txtDiscount_TextChanged" AutoPostBack="true" 
                            Text="0"></asp:TextBox>
                    </td>
                 
                </tr>
                <tr>
                    <td class="auto-style1">Net Total:
                    </td>
                    <td>
                        <asp:Label ID="lblNetTotal" runat="server" Width="250"></asp:Label>

                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                    </td>
                    <td>
                
            <asp:Button ID="saveSaleInvoice" CssClass="button" runat="server" Text="Save" OnClick="saveSaleInvoice_Click"/>
            </td></tr>    </table>
                        
            
            </div>
    </div>
</div>
</asp:Content>
