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
    public partial class WebForm11 : System.Web.UI.Page
    {
        int q = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {                
                    Load_Data_Grid();                
            }
        }
        private void Load_Data_Grid()
        {
            Product repository = new Product();
            var result = repository.GetAll().ToArray();
            gridProduct.DataSource = result;
            gridProduct.DataBind();
        }

        protected void makeRequest_Click(object sender, EventArgs e)
        {
            var repository = new PurchaseOrder();
            var repository_detail = new PurchaseOrderDetail();
            int result = checkForCbTb();
            if (result == 0)
            {
                this.ShowErrorNotification("Please select any product");
            }
            else
            {
                tblPurchaseOrder tbl = new tblPurchaseOrder();
                tblPurchaseOrderDetail tbl_detail = new tblPurchaseOrderDetail();
                tbl.VendorId = Convert.ToInt32(vendorName.SelectedValue);
                tbl.OrderDate = DateTime.Now;
                tbl.TotalValue = q;
                repository.Add(tbl);
                int poid = repository.GetId();

                foreach (GridViewRow row in gridProduct.Rows)
                {
                    CheckBox cb = (CheckBox)row.FindControl("CheckBox1");
                    if (cb.Checked)
                    {                       
                        int id = Convert.ToInt32(gridProduct.DataKeys[row.RowIndex].Value);
                        TextBox txt = (TextBox)row.FindControl("TextBox1");
                        string quantity = txt.Text;
                        tbl_detail.POId = poid;
                        tbl_detail.ProductId = id;
                        tbl_detail.Quantity = Convert.ToInt32(quantity);
                        repository_detail.Add(tbl_detail);                        
                    }
                }               
            }
           
        }

        //Check whether any of the checkbox is checked or not and texbox
        public int checkForCbTb()
        {  
             foreach(GridViewRow row in gridProduct.Rows)
            {
                CheckBox cb = (CheckBox)row.FindControl("CheckBox1");
                if (cb.Checked)
                {
                    TextBox txt = (TextBox)row.FindControl("TextBox1");
                    string quantity = txt.Text;
                    if (quantity != "")
                    {
                        q++;
                    }
                    else
                    {
                        this.ShowErrorNotification("Please mention quantity");
                        txt.Focus();
                    }                   
                }                
            }
             return q;
        }
       
    }
}