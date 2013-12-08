using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DensNDente_Warehouse_Management.Models;
using DensNDente_Warehouse_Management.EntityFramework;
using jQueryNotification.Helper;

namespace DensNDente_Warehouse_Management
{
    public partial class WebForm10 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnChange_Click(object sender, EventArgs e)
        {
            try
            {

                if (txtpassword.Text.Trim().Equals(txtRePassword.Text.Trim(), StringComparison.Ordinal))
                {
                    Employee repository = new Employee();
                    tblEmployee currentUser = (tblEmployee)Session["User"];
                    currentUser.Password = txtRePassword.Text.Trim();
                    if (repository.Update(currentUser))
                    {
                        this.ShowSuccessfulNotification("Your password has been changed successfully");
                        clear_data();
                    }
                    else
                    {
                        this.ShowErrorNotification("Error occured");
                        clear_data();
                    }
                }
                else
                {
                    this.ShowWarningNotification("Both password must be same");

                }

            }
            catch (Exception)
            {
                this.ShowErrorNotification("Error occured");
                clear_data();

            }
        }
        private void clear_data()
        {

            txtpassword.Text = "";
            txtRePassword.Text = "";
        }

    }
}