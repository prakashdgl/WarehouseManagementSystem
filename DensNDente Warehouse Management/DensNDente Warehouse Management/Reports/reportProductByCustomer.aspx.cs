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
    public partial class WebForm17 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                fillCustomer_DropDown();
            }
        }

        private void fillCustomer_DropDown()
        {

            Customer repository = new Customer();
            cbCustomer.DataTextField = "Firstname";
            cbCustomer.DataValueField = "CustomerId";
            cbCustomer.DataSource = repository.GetAll().ToArray();
            cbCustomer.DataBind();

        }

        protected void btnGenerateReport_Click(object sender, EventArgs e)
        {
            try
            {
                int id = Convert.ToInt32(cbCustomer.SelectedValue);
                loadGrid_Report(id);
            }
            catch (Exception)
            {
                

                this.ShowErrorNotification("Please select valid customer name");
            }
        }

        private void loadGrid_Report(int id)
        {
            SaleInvoice repository = new SaleInvoice();
            var result = repository.getProductByCustomer(id);
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




    }
}