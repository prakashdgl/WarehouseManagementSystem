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
    public partial class WebForm4 : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {

                if (Request.QueryString.HasKeys())
                {
                    Get_Product_Data_By_QueryString();
                }
                else
                {
                    load_grid();
                }
            }
        }

        private tblProduct get_data_from_form()
        {

            return new tblProduct
            {
                ProductName = txtProductName.Text.Trim(),
                ProductDescription = txtProdDescription.Text.Trim(),
                ReorderPoint = Convert.ToInt32(txtReoderPoint.Text.Trim()),
                SafetyStockLevel = Convert.ToInt32(txtSafetyLevel.Text.Trim()),
                StandardCost = Convert.ToDecimal(txtStdCost.Text.Trim()),
                SellingCost = Convert.ToDecimal(txtSellingCost.Text.Trim()),
                ImagePath = "dasd",
                Quantity = 0,

                BinId = Convert.ToInt32(ddlBinId.SelectedValue)
            };

        }

        private void Get_Product_Data_By_QueryString()
        {
            // Set up environment
            gridProduct.Visible = false;
            btnInsert.Visible = false;
            btnUpdate.Visible = true;
            linkBack.Visible = true;
            
            Product repository = new Product();
            tblProduct result = repository.Get(Int32.Parse(Request.QueryString["id"]));

            txtProductName.Text = result.ProductName;
            txtProdDescription.Text = result.ProductDescription;
            ddlBinId.SelectedValue = result.BinId.ToString();
            txtReoderPoint.Text = result.ReorderPoint.ToString();
            txtSafetyLevel.Text = result.SafetyStockLevel.ToString();
            txtSellingCost.Text = result.SellingCost.ToString();
            txtStdCost.Text = result.StandardCost.ToString();
        }

        private void clear_form()
        {

            txtProductName.Text = "";
            txtProdDescription.Text = "";
            txtReoderPoint.Text = "";
            txtSafetyLevel.Text = "";
            txtStdCost.Text = "";
            txtSellingCost.Text = "";
        }
        private void load_grid()
        {
            try
            {
                Product repository = new Product();

                var result = repository.GetAll().ToArray();
                if (result != null)
                {
                    gridProduct.DataSource = result;
                    gridProduct.DataBind();
                }
            }
            catch (Exception ex)
            {

                this.ShowErrorNotification("Error while binding grid");
            }
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            var repository = new Product();
            if (repository.Add(get_data_from_form()))
            {
                clear_form();
                load_grid();
                this.ShowSuccessfulNotification("Product added successfully");
            }
            else
            {
                this.ShowErrorNotification("Error occured");
            }
        }


        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            tblProduct result = get_data_from_form();
            result.ProductId = Int32.Parse(Request.QueryString["id"]);
            Product repository = new Product();
            if (repository.Update(result))
            {
                Response.Redirect("~/pages/product.aspx");
            }
            else
            {
                this.ShowErrorNotification("Error occured");
            }
        }


        protected void gridProduct_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = (int)gridProduct.DataKeys[e.RowIndex].Value;
            Product repository = new Product();
            if (repository.Delete(id))
            {
                this.ShowSuccessfulNotification(" deleted.");
                load_grid();
            }
            else
            {
                this.ShowErrorNotification("Error occured.");
                e.Cancel = true;
            }
        }
    }
}