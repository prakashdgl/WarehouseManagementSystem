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
    public partial class WebForm16 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void loadGrid_Report(DateTime startDate, DateTime endDate)
        {
            SaleInvoice repository = new SaleInvoice();
            var result = repository.getProductByTime(startDate, endDate);
            if (result.Count > 0)
            {
                gridProduct.DataSource = result;
                gridProduct.DataBind();
                gridProduct.Visible = true;
            }
            else
            {
                gridProduct.Visible = false;
                this.ShowWarningNotification("No data found");
            }
        }

        protected void btnGenerateReport_Click(object sender, EventArgs e)
        {
            try
            {
                var startDate = Convert.ToDateTime(txtStartDate.Text);
                var endDate = Convert.ToDateTime(txtEndDate.Text);

                loadGrid_Report(startDate, endDate);
            }
            catch (Exception)
            {
                this.ShowErrorNotification("Please input valid date");
            }

        }

    }
}