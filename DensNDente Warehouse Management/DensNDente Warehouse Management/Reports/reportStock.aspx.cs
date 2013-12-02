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
    public partial class WebForm9 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                loadGrid_Stock();
            }
        }

        private void loadGrid_Stock()
        {

            try
            {
                Product repository = new Product();
                var result = repository.GetProducts_Report();
                if (result != null)
                {
                    gridStock.DataSource = result;
                    gridStock.DataBind();
                }
            }
            catch (Exception)
            {
                this.ShowErrorNotification("Error occured");

            }

        }

    }
}