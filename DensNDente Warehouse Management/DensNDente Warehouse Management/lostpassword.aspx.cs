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
    public partial class lostpassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Employee obj = new Employee();
            tblEmployee result = obj.GetAll().Where(r => r.Email == txtEmail.Text.Trim()).FirstOrDefault();
            if (result != null)
            {
                // Send Email
                Email eml = new Email();
                eml.sendEmail(txtEmail.Text, "Your password is " + result.Password + "<br/>Please use this password for login.");
                txtEmail.Text = "";
                lblError.Text = "Check you mail";
            }
            else
            {
                lblError.Text = "Enter valid email";
                txtEmail.Text = "";

            }
        }
    }
}