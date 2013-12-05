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
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Session.RemoveAll();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Employee obj = new Employee();
            tblEmployee result = obj.GetAll().Where(r => r.Email == txtEmail.Text.Trim() && r.Password == txtpassword.Text).FirstOrDefault();
            if (result != null)
            {
                Session.Timeout = 30;

                Session["User"] = result;
                Session["UserRole"] = result.tblRole;
                Response.Redirect("~/main.aspx");
            }
            else
            {
                lblError.Text = "Enter valid credentials";
                txtEmail.Text = "";
                txtpassword.Text = "";
            }
        }
    }
}