using DensNDente_Warehouse_Management.EntityFramework;
using DensNDente_Warehouse_Management.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using jQueryNotification.Helper;

namespace DensNDente_Warehouse_Management.Pages
{
    public partial class purchaseOrderEdit : System.Web.UI.Page
    {
        PurchaseOrder repository = new PurchaseOrder();
        tblPurchaseOrder po;
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!IsPostBack)
            {
                load_dropdown();
            }
        }

        private void load_dropdown()
        {           
            PurchaseOrder repository = new PurchaseOrder();
            var result = repository.GetAll().Select(r =>r.POId.ToString()).ToList();
            result.Insert(0, "--select--");
            DropDownList1.DataSource = result;            
            DropDownList1.DataBind();
        }

        private void Load_Data_Grid()
        {
            PurchaseOrderDetail repository = new PurchaseOrderDetail();
            int id = Convert.ToInt32(DropDownList1.SelectedValue);
            var result = repository.GetAll(id).Select(r => new { r.PODetailId, r.POId, r.ProductId, ProductName = r.tblProduct.ProductName, r.Quantity }).ToArray();
            gridProduct.DataSource = result;
            gridProduct.DataBind();
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedIndex > 0)
            {
                po = repository.Get(Convert.ToInt32(DropDownList1.SelectedValue));
                lblOrderDate.Text = "Order Date : " + po.OrderDate;
                lblVendorName.Text = "Vendor Name : " + po.tblVendor.VendorName;
                lblVendorName.Visible = true;
                lblOrderDate.Visible = true;
                btnDeliver.Visible = true;
                btnEdit.Visible = true;
            }
            else
            {
                lblVendorName.Visible = true;
                lblOrderDate.Visible = true;
                btnDeliver.Visible = true;
                btnEdit.Visible = true;
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            gridProduct.Visible = true;
            Load_Data_Grid();
            btnupdate.Visible = true;
        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            var repository = new PurchaseOrder();
            var repository_detail = new PurchaseOrderDetail();
            tblPurchaseOrderDetail tbl_detail = new tblPurchaseOrderDetail();
            int poid = repository.GetId();
            foreach (GridViewRow row in gridProduct.Rows)
            {
                int id = Convert.ToInt32(gridProduct.DataKeys[row.RowIndex].Value);
                TextBox txt = (TextBox)row.FindControl("TextBox1");
                Label lblProductId = (Label)row.FindControl("lblProductId");
                tbl_detail.POId = Convert.ToInt32(DropDownList1.SelectedValue);
                tbl_detail.PODetailId = id;
                tbl_detail.ProductId = Convert.ToInt32(lblProductId.Text);
                string quantity = txt.Text;
                tbl_detail.Quantity = Convert.ToInt32(quantity);
                repository_detail.Update(tbl_detail);
            }
        }

        protected void btnDeliver_Click(object sender, EventArgs e)
        {
            PurchaseOrderDetail repository = new PurchaseOrderDetail();
            PurchaseOrder rep_po = new PurchaseOrder();
            int id = Convert.ToInt32(DropDownList1.SelectedValue);
            var result = repository.GetAll().Where(r => r.POId == id).ToArray();
            var pp = rep_po.Get(id);
            pp.Deleted = true;
            rep_po.Update(pp);
            Product rep = new Product();
            tblProduct prod = new tblProduct();
            foreach (var item in result)
            {
                var p = rep.Get(item.ProductId);
                p.Quantity += item.Quantity;
                rep.Update(p);
            }
            this.ShowSuccessfulNotification("Products Delivered");
            gridProduct.Visible = false;
            DropDownList1.SelectedIndex = 0;
        }
    }
}