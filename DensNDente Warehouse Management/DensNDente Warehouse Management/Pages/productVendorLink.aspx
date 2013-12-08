<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Client.Master" CodeBehind="productVendorLink.aspx.cs" Inherits="DensNDente_Warehouse_Management.Pages.productVendorLink" %>

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

            <table>

                <tr>
                    <td class="auto-style1">Select Vendor Name:
                    </td>
                    <td>
                        <asp:DropDownList ID="vendorName" AutoPostBack="true" DataValueField="id" DataTextField="name" runat="server" OnSelectedIndexChanged="vendorName_SelectedIndexChanged"></asp:DropDownList>

                    </td>
                </tr>
            </table>
        </div>
        <div style="width: 100%; float: left;">
            <center style="font-weight: bold; font-size: 26px; color: #ed4e6e">
           <asp:Label ID="Label1" runat="server" Visible="false" Text="Select Products"></asp:Label> </center>
        </div>
        <div style="width: 100%; float: left;">
            <div style="width: 37%; float: left;">&nbsp</div>
            <div style="width: 34%; float: left;">
                <asp:GridView CssClass="ctable" ID="gridProduct" runat="server" AutoGenerateColumns="False" DataKeyNames="ProductId">
                    <Columns>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                <input id="chkbox" type="checkbox" onclick=" SelectAll(this)" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:CheckBox ID="CheckBox2" runat="server" />
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ProductId" HeaderText="ProductId" InsertVisible="False" ReadOnly="True" SortExpression="ProductId" />
                        <asp:BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName" />
                    </Columns>
                </asp:GridView>
            </div>
            <div style="width: 20%; float: left">&nbsp</div>
        </div>
        <div style="width: 100%; margin-left: 45%; float: left">
            <asp:Button ID="btnAdd" CssClass="button" runat="server" Visible="false" Text="ADD" OnClick="btnAdd_Click" />

        </div>
    </div>
</asp:Content>
