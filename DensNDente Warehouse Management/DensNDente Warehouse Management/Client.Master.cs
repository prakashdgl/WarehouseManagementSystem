using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DensNDente_Warehouse_Management.EntityFramework;
using DensNDente_Warehouse_Management.Models;

namespace DensNDente_Warehouse_Management
{
    public partial class Client : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Login_Check();
        }

        private void Login_Check()
        {

            if (Session["User"] == null)
            {
                // Redirect user to Login Page

                Session.RemoveAll();
                Response.Redirect("~/default.aspx");

            }
            else
            {

                // Display the menu according to role

                tblEmployee user = (tblEmployee)Session["User"];
                tblRole role = (tblRole)Session["UserRole"];

                // Dynamic Menu according to role
                cssmenu.InnerHtml = Generate_Menu(role);

            }

        }

        private String Generate_Menu(tblRole role)
        {

            String menu = "<ul>";
            menu += "<li><a href='../main.aspx'>Home</a></li>";
            if (role.Admin)
            {
                menu += "<li><a href='#'>Admin</a><ul>";
                menu += "<li><a href='../Pages/bin.aspx'>New Bin</a></li>";
                menu += "<li><a href='../Pages/role.aspx'>New Role</a></li>";
                menu += "<li><a href='../Pages/employee.aspx'>New Employee</a></li>";
                menu += "<li><a href='../Pages/newsletter.aspx'>Send Newsletters</a></li>";


                if (role.SalesTarget)
                {
                    menu += "<li><a href='../Pages/salestarget.aspx'>Set Sell Target</a></li>";
                }
                menu += "</ul></li>";

            }
            if (role.Payroll)
            {
                menu += "<li><a href='#'>Payroll</a><ul>";
                menu += "<li><a href='../Pages/salary.aspx'>New Salary</a></li>";
                menu += "</ul></li>";
            }
            if (role.Purchase)
            {
                menu += "<li><a href='#'>Purchase</a><ul>";
                menu += "<li><a href='../Pages/purchaseOrder.aspx'>New Purchase</a></li>";
                menu += "<li><a href='../Pages/purchaseOrderedit.aspx'>Purchase Orders</a></li>";
                menu += "<li><a href='../Pages/vendor.aspx'>New Vendor</a></li>";
                menu += "<li><a href='../Pages/productvendorlink.aspx'>Link Product To Vendor</a></li>";
                menu += "</ul></li>";
            }
            if (role.Reports)
            {
                menu += "<li><a href='#'>Reports</a><ul>";
                menu += "<li><a href='../Reports/reportstock.aspx'>Stock Report</a></li>";
                menu += "<li><a href='../Reports/reportProductSoldByTime.aspx'>Product Sale</a></li>";
                menu += "<li><a href='../Reports/reportProductByCustomer.aspx'>Product Sale By Customer</a></li>";
                menu += "</ul></li>";
            }
            if (role.Sales)
            {
                menu += "<li><a href='#'>Sale</a><ul>";
                menu += "<li><a href='../Pages/saleInvoice.aspx'>New Sale</a></li>";
                menu += "<li><a href='../Pages/salesInvoiceund.aspx'>Sale Orders</a></li>";
                menu += "<li><a href='../Pages/customer.aspx'>New Customer</a></li>";
                menu += "</ul></li>";
            }

            if (role.Stock)
            {
                menu += "<li><a href='#'>Stock</a><ul>";
                menu += "<li><a href='../Pages/bin.aspx'>New Bin</a></li>";
                menu += "<li><a href='../Pages/product.aspx'>New Product</a></li>";
                menu += "<li><a href='../Pages/safteyStock.aspx'>View Saftey Stock</a></li>";
                menu += "</ul></li>";
            }

            // Log out link
            menu += "<li><a href='../Pages/changepassword.aspx'>Change Password</a></li>";
            menu += "<li><a href='../default.aspx'>Log out</a></li>";

            return menu + "</ul>";
        }

    }
}