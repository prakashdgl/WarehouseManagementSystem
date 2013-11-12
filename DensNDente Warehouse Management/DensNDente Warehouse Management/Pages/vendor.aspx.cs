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
    public partial class WebForm14 : System.Web.UI.Page
    {       
             protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString.HasKeys())
                {
                    Get_Vendor_Data_By_QueryString();
                }
                else
                {
                    Load_Data_Grid();
                }
            }
        }

        private void Load_Data_Grid()
        {
            Vendor repository = new Vendor();
            var result = repository.GetAll().ToArray();
            gridVendor.DataSource = result;
            gridVendor.DataBind();
        }

        private void Get_Vendor_Data_By_QueryString()
        {
            // Set up environment
            gridVendor.Visible = false;
            btnInsert.Visible = false;
            btnUpdate.Visible = true;
            linkBack.Visible = true;


            Vendor repository = new Vendor();
            tblVendor result = repository.Get(Int32.Parse(Request.QueryString["id"]));

            txtName.Text = result.VendorName;           
            txtAddress.Text = result.VendorAddress;           
            txtEmail.Text = result.VendorEmail;
            txtPhoneNumber.Text = result.VendorPhone;
            txtDescription.Text=result.VendorDescription;
        }

        private tblVendor get_Data_From_Form()
        {
            return new tblVendor
            {
                VendorName = txtName.Text.Trim(),               
                VendorAddress = txtAddress.Text.Trim(),              
                VendorEmail = txtEmail.Text.Trim(),
                VendorDescription=txtDescription.Text.Trim(),                
                VendorPhone = txtPhoneNumber.Text.Trim()
            };
        }


        private void clear_form()
        {
            txtName.Text = "";          
            txtAddress.Text = "";
            txtDescription.Text="";
            txtEmail.Text = "";
            txtPhoneNumber.Text = "";
            
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            Insert_Vendor();
        }

        private void Insert_Vendor()
        {
            var repository = new Vendor();
            if (repository.Add(get_Data_From_Form()))
            {

                this.ShowSuccessfulNotification("Vendor added successfully.");
                clear_form();
                Load_Data_Grid();
            }
            else
            {
                this.ShowErrorNotification("Error occured.");
            }

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            tblVendor result = get_Data_From_Form();
            result.VendorId = Int32.Parse(Request.QueryString["id"]);
            Vendor repository = new Vendor();
            if (repository.Update(result))
            {
                Response.Redirect("~/pages/vendor.aspx");
            }
            else
            {
                this.ShowErrorNotification("Error occured");
            }
        }

        protected void gridVendor_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = (int)gridVendor.DataKeys[e.RowIndex].Value;
            Vendor repository = new Vendor();
            if (repository.Delete(id))
            {
                this.ShowSuccessfulNotification("Vendor deleted.");
                Load_Data_Grid();
            }
            else
            {
                this.ShowErrorNotification("Error occured.");
                e.Cancel = true;
            }
        
        }
    }
}