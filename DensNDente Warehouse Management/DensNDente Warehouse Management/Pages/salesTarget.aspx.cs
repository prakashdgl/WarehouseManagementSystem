using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DensNDente_Warehouse_Management.EntityFramework;
using DensNDente_Warehouse_Management.Models;
using jQueryNotification.Helper;

namespace DensNDente_Warehouse_Management
{
    public partial class WebForm18 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            SalesTarget repository = new SalesTarget();
            string monthName = cbMonth.SelectedValue;
            int amount = Convert.ToInt32(txtAmount.Text);
            if (!repository.checkSaleTarget_Available(monthName))
            {
                if (repository.Add(new tblSalesTarget { MonthName = monthName, TargetAmount = amount }))
                {
                    this.ShowSuccessfulNotification("Target successfully added for " + monthName);
                    gridSaletarget.DataBind();
                    txtAmount.Text = "";
                }
                else
                {
                    this.ShowErrorNotification("Error occured");
                }
            }
            else
            {
                this.ShowErrorNotification("Target already available for " + monthName);
            }

        }

        protected void gridSaletarget_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            this.ShowSuccessfulNotification("Target Deleted...");
        }

        protected void gridSaletarget_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            this.ShowSuccessfulNotification("Target Updated...");
        }
    }
}