<%@ Page Title="" Language="C#" MasterPageFile="~/Client.Master" AutoEventWireup="true" CodeBehind="employee.aspx.cs" Inherits="DensNDente_Warehouse_Management.WebForm7" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 90px;
            font-weight:bold;

        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
        


            <div style="width: 100%; float: left">
                <div style="width: 50%; float: left">
                    <table>
                        <tr>
                            <td class="auto-style1"></td>
                            <td style="font-weight: bold; font-size: 26px; color: #ed4e6e">Add New Employee</td>
                        </tr>
                        <tr>
                            <td class="auto-style1">First Name:</td>
                            <td>
                                <asp:TextBox ID="txtFirstName" runat="server" required></asp:TextBox>

                            </td>
                        </tr>

                        <tr>
                            <td class="auto-style1">Middle Name:</td>
                            <td>
                                <asp:TextBox ID="txtMiddleName" runat="server"></asp:TextBox>

                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">Last Name:</td>
                            <td>
                                <asp:TextBox ID="txtLastName" runat="server" required></asp:TextBox>

                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">Email:</td>
                            <td>
                                <asp:TextBox ID="txtEmail" runat="server" type="email" required></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td class="auto-style1">Phone No:</td>
                            <td>
                                <asp:TextBox ID="txtPhoneNo" runat="server" MaxLength="10" pattern="[0-9]{10}"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td class="auto-style1">Mobile No:</td>
                            <td>
                                <asp:TextBox ID="txtMobileNo" runat="server" MaxLength="10" pattern="[0-9]{10}" required></asp:TextBox></td>
                        </tr>
                    </table>
                </div>
                <div style="width: 50%; float: left">
                    <table>
                        <tr style="height: 34px;">
                            <td class="auto-style1"></td>
                            <td></td>
                        </tr>

                        <tr>
                            <td class="auto-style1">SIN No:</td>
                            <td>
                                <asp:TextBox ID="txtSinNo" runat="server" pattern="[0-9]{9}" title="9 Digits required" required></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td class="auto-style1">Address:</td>
                            <td>
                                <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" required></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td class="auto-style1">Password:</td>
                            <td>
                                <asp:TextBox ID="txtPassword" type="password" runat="server" required></asp:TextBox>
                            </td>

                        </tr>

                        <tr>

                            <td class="auto-style1">Assign Role:</td>
                            <td>
                                <asp:DropDownList ID="cbRole" runat="server"></asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">Pay Per Hour</td>
                            <td>
                                <asp:TextBox ID="txtPay" runat="server" required></asp:TextBox>
                            </td>

                        </tr>
                        <tr>
                            <td class="auto-style1"></td>
                            <td>
                                <asp:Button ID="btnInsert" runat="server" Text="Add New Employee" CssClass="button" OnClick="btnInsert_Click" />
                                <asp:Button ID="btnUpdate" runat="server" Text="Update Employee" CssClass="button" Visible="false" OnClick="btnUpdate_Click" />
                                <asp:HyperLink ID="linkBack" CssClass="button-cancel" runat="server" NavigateUrl="~/Pages/employee.aspx" Visible="false">Cancel</asp:HyperLink>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div style="width: 100%; float: left">

                <div class="gridHeaderStyle">
                    View All Employee
                </div>
                <div>
                    <asp:GridView Width="100%" ID="gridEmployee" DataKeyNames="EmployeeId" runat="server" CssClass="ctable" AutoGenerateColumns="False" AutoGenerateDeleteButton="True" OnRowDeleting="gridEmployee_RowDeleting" PageSize="1">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <a href="employee.aspx?id=<%# Eval("EmployeeId") %>">Edit</a>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:BoundField DataField="Firstname" HeaderText="First Name" />
                            <asp:BoundField DataField="MiddleName" HeaderText="Middle Name" />
                            <asp:BoundField DataField="LastName" HeaderText="Last Name" />
                            <asp:BoundField DataField="Email" HeaderText="Email" />
                            <asp:BoundField DataField="PhoneNo" HeaderText="Phone No" />
                            <asp:BoundField DataField="MobileNo" HeaderText="Mobile No" />
                            <asp:BoundField DataField="Address" HeaderText="Address" />
                            <asp:BoundField DataField="SINNo" HeaderText="SIN No" />
                            <asp:BoundField DataField="PayPerHour" HeaderText="Pay" DataFormatString="{0:c}" />

                        </Columns>

                    </asp:GridView>
                </div>
            </div>
       
  
</asp:Content>
