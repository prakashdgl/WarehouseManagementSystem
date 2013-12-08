using DensNDente_Warehouse_Management.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using jQueryNotification.Helper;
using DensNDente_Warehouse_Management.EntityFramework;

namespace DensNDente_Warehouse_Management.Pages
{
    public partial class productVendorLink : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                // Load_Data_Grid();
                load_dropdown();
            }
        }
        private void Load_Data_Grid(int id)
        {
            Product repository = new Product();
            ProductVendorLink repo = new ProductVendorLink();
            var result = repository.GetAll().ToArray();
            gridProduct.DataSource = result;
            gridProduct.DataBind();

            var tbl2 = repo.Get(id);
            foreach (GridViewRow row in gridProduct.Rows)
            {
                CheckBox cb = (CheckBox)row.FindControl("CheckBox1");
                if (tbl2 != null)
                {
                    foreach (var t in tbl2)
                    {
                        if (t.ProductId == Convert.ToInt32(gridProduct.DataKeys[row.RowIndex].Value))
                        {
                            cb.Checked = true;
                        }
                    }
                }
            }
        }

        private void load_dropdown()
        {
            Vendor repository = new Vendor();
            var result = repository.GetAll().Select(r => new { id = r.VendorId, name = r.VendorName }).ToList();
            result.Insert(0, new { id = 0, name = "--Select Vendor Name--" });
            vendorName.DataSource = result;
            vendorName.DataBind();

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            int count = 0;
            if (vendorName.SelectedIndex == 0)
            {
                this.ShowErrorNotification("Please Select Proper Vendor");
            }

            else
            {
                ProductVendorLink repository = new ProductVendorLink();
                tblProductVendorLink tbl = new tblProductVendorLink();
                List<tblProductVendorLink> list = new List<tblProductVendorLink>();
                foreach (GridViewRow row in gridProduct.Rows)
                {
                    CheckBox cb = (CheckBox)row.FindControl("CheckBox1");
                    if (cb.Checked)
                    {
                        list.Add(new tblProductVendorLink { VendorId = Convert.ToInt32(vendorName.SelectedValue), ProductId = Convert.ToInt32(gridProduct.DataKeys[row.RowIndex].Value) });
                        count++;
                    }
                }

                // method call to add those product with vendor link

                repository.Bulk_Add(list);
                this.ShowSuccessfulNotification("Product linked to Vendor");

                if (count == 0)
                {
                    this.ShowErrorNotification("Please Select any Product");
                }
            }
        }

        protected void vendorName_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(vendorName.SelectedValue);
            Load_Data_Grid(id);
            btnAdd.Visible = true;
            Label1.Visible = true;
        }
    }
}