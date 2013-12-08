<%@ Page Title="" Language="C#" MasterPageFile="~/Client.Master" AutoEventWireup="true" CodeBehind="salesTarget.aspx.cs" Inherits="DensNDente_Warehouse_Management.WebForm18" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
        

            <div>

                <div style="width: 50%; float: left">
                    <table>
                        <tr>
                            <td></td>
                            <td style="font-weight: bold; font-size: 26px; color: #ed4e6e">Add New Sale Target</td>
                        </tr>
                        <tr>
                            <td class="auto-style1">Select Month :
                            </td>
                            <td>
                                <asp:DropDownList ID="cbMonth" runat="server">
                                    <asp:ListItem Selected="True" Text="November 2013" />
                                    <asp:ListItem Text="December 2013" />
                                    <asp:ListItem Text="January 2014" />
                                    <asp:ListItem Text="February 2014" />
                                    <asp:ListItem Text="March 2014" />
                                    <asp:ListItem Text="April 2014" />
                                    <asp:ListItem Text="May 2014" />
                                    <asp:ListItem Text="June 2014" />
                                    <asp:ListItem Text="July 2014" />
                                    <asp:ListItem Text="August 2014" />
                                    <asp:ListItem Text="September 2014" />
                                    <asp:ListItem Text="October 2014" />
                                    <asp:ListItem Text="November 2014" />
                                    <asp:ListItem Text="December 2014" />
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>Amount: </td>
                            <td>
                                <asp:TextBox runat="server" ID="txtAmount" TextMode="Number" min="0" required></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1"></td>
                            <td>
                                <asp:Button ID="btnInsert" CssClass="button" runat="server" Text="Set New Target" OnClick="btnInsert_Click" />
                            </td>
                        </tr>
                    </table>
                </div>
                <div style="width: 50%; float: left">
                    <asp:GridView Width="100%" ID="gridSaletarget" CssClass="ctable" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="SalesTargetId" DataSourceID="SqlDataSource1" OnRowDeleting="gridSaletarget_RowDeleting" OnRowUpdating="gridSaletarget_RowUpdating">
                        <PagerStyle CssClass="PagerStyle" HorizontalAlign="Right" />
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:BoundField DataField="SalesTargetId" HeaderText="SalesTargetId" InsertVisible="False" ReadOnly="True" SortExpression="SalesTargetId" Visible="False" />
                            <asp:BoundField DataField="MonthName" HeaderText="MonthName" SortExpression="MonthName" />
                            <asp:BoundField DataField="TargetAmount" HeaderText="TargetAmount" SortExpression="TargetAmount" />
                            <asp:CheckBoxField DataField="Deleted" HeaderText="Deleted" SortExpression="Deleted" Visible="False" />
                        </Columns>


                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DensDBConnectionString %>" DeleteCommand="UPDATE [tblSalesTarget] SET [Deleted] = 'true' WHERE [SalesTargetId] = @SalesTargetId" SelectCommand="SELECT * FROM [tblSalesTarget] Where Deleted='false'" UpdateCommand="UPDATE [tblSalesTarget] SET [MonthName] = @MonthName, [TargetAmount] = @TargetAmount WHERE [SalesTargetId] = @SalesTargetId">
                        <DeleteParameters>
                            <asp:Parameter Name="SalesTargetId" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="MonthName" Type="String" />
                            <asp:Parameter Name="TargetAmount" Type="Int32" />

                            <asp:Parameter Name="SalesTargetId" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
       
  
</asp:Content>
