<%@ Page Title="" Language="C#" MasterPageFile="~/Client.Master" AutoEventWireup="true" CodeBehind="purchaseOrder.aspx.cs" Inherits="DensNDente_Warehouse_Management.WebForm11" %>

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
  
        


            <div style="width: 100%; float: left">
                <div style="width: 100%; float: left">
                    <center style="font-weight: bold; font-size: 26px; color: #ed4e6e">Make Delivery Request</center>
                    <table>

                        <tr>
                            <td class="auto-style1">Select Vendor Name:
                            </td>
                            <td>
                                <asp:DropDownList ID="vendorName" DataValueField="id" DataTextField="name" runat="server" AutoPostBack="true" OnSelectedIndexChanged="vendorName_SelectedIndexChanged"></asp:DropDownList>

                            </td>
                        </tr>
                    </table>
                </div>
                <div style="width: 100%; float: left;">
                    <center style="font-weight: bold; font-size: 26px; color: #ed4e6e">Select Products</center>
                </div>
                <div style="width: 100%; float: left;">
                    <div style="width: 20%; float: left;">&nbsp</div>
                    <div style="width: 34%; float: left;">
                        <asp:GridView CssClass="ctable" Visible="false" ID="gridProduct" runat="server" AutoGenerateColumns="False" DataKeyNames="ProductId">
                            <Columns>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <input id="chkbox" type="checkbox" onclick=" SelectAll(this)" />
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CheckBox1" runat="server" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="CheckBox1" runat="server" />
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="ProductId" Visible="false" HeaderText="ProductId" InsertVisible="False" ReadOnly="True" SortExpression="ProductId" />
                                <asp:BoundField DataField="ProductName" HeaderText="Product Name" SortExpression="ProductName" />
                                <asp:TemplateField ControlStyle-Width="10px">
                                    <HeaderTemplate>
                                        Quantity
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" type="number"></asp:TextBox>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" type="number"></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div style="width: 30%; float: left">&nbsp</div>
                </div>
                <div style="width: 100%; margin-left: 35%; float: left">
                    <asp:Button ID="makeRequest" CssClass="button" runat="server" Text="Make Request" OnClick="makeRequest_Click" />

                </div>
            </div>
       
  
</asp:Content>
