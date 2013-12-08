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
    public partial class WebForm15 : System.Web.UI.Page
    {
        static double total = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Load_Data_Grid();
                load_dropdown();
                SaleInvoice s = new SaleInvoice();
                tblSaleInvoice salesinvoice = new tblSaleInvoice();
                int maxid = s.GetId();
                lblInvoiceNo.Text = (maxid + 1).ToString();
            }
        }
        private void Load_Data_Grid()
        {
            Product repository = new Product();
            var result = repository.GetAll().ToArray();
            gridProduct.DataSource = result;
            gridProduct.DataBind();
        }
        private void load_dropdown()
        {
            Customer repository = new Customer();
            var result = repository.GetAll().Where(r => r.Deleted == false).Select(r => new { id = r.CustomerId, name = r.Firstname }).ToList();
            result.Insert(0, new { id = 0, name = "--SELECT NAME--" });
            customerDropDown.DataSource = result;
            customerDropDown.DataBind();
        }
        int q;
        protected void chkbox_CheckedChanged(object sender, EventArgs e)
        {

            int selRowIndex = ((GridViewRow)(((CheckBox)sender).Parent.Parent)).RowIndex;
            CheckBox cb = (CheckBox)gridProduct.Rows[selRowIndex].FindControl("chkbox1");

            if (cb.Checked)
            {

                TextBox txt = (TextBox)gridProduct.Rows[selRowIndex].FindControl("txtQuantity");
                txt.Visible = true;

            }
            else
            {

                TextBox txt = (TextBox)gridProduct.Rows[selRowIndex].FindControl("txtQuantity");
                String quant = txt.Text.Trim();
                txt.Visible = false;
<<<<<<< HEAD
                if (quant == null || quant == "")
                {
                }
                else
=======
                if (quant == null || quant == "") {
                    this.ShowErrorNotification("Please enter value");
                    txt.Focus();
                }else
>>>>>>> 61ee6f6ddb3165cf48ef9aa56c56f356e568343a
                {
                    double quantity = Convert.ToDouble(quant);

                    Label lbl = (Label)gridProduct.Rows[selRowIndex].FindControl("SellingCost");

                    double cost = Convert.ToDouble(lbl.Text);
                    double totalcost = quantity * cost;
                    total -= totalcost;
                    txt.Text = "";
                    txtDiscount.Text = "0";
                    lblTotal.Text = total.ToString();
                    double taxamt = Convert.ToDouble(txtTax.Text);
                    double taxtotal = total + ((total * taxamt) / 100);

                    lblNetTotal.Text = taxtotal.ToString();
                }
            }

        }

        protected void txtQuantity_TextChanged(object sender, EventArgs e)
        {
            total = 0;

            int selRowIndex = ((GridViewRow)(((TextBox)sender).Parent.Parent)).RowIndex;
            CheckBox cb = (CheckBox)gridProduct.Rows[selRowIndex].FindControl("chkbox1");


            if (cb.Checked)
            {
                int id = Convert.ToInt32(gridProduct.DataKeys[selRowIndex].Value);
                Product p = new Product();
                tblProduct product = p.Get(id);
                // CheckBox cb1 = (CheckBox)gridProduct.Rows[selRowIndex].FindControl("chkbox1");
                TextBox txt = (TextBox)gridProduct.Rows[selRowIndex].FindControl("txtQuantity");
                if (txt.Text == "" || txt.Text == null)
                {
                    this.ShowErrorNotification("Please enter Value");
                    txt.Focus();
                }
                else
                {
                    String quantChk = txt.Text;
                    double quantityChk = Convert.ToDouble(quantChk);
                    if (product.Quantity < quantityChk)
                    {
                        this.ShowErrorNotification("Quantity is not enough");
                        quantityChk = product.Quantity;
                        txt.Text = quantityChk.ToString();
                    }
                    foreach (GridViewRow row in gridProduct.Rows)
                    {
                        CheckBox cb1 = (CheckBox)row.FindControl("chkbox1");
                        TextBox txt1 = (TextBox)row.FindControl("txtQuantity");
                        if (cb1.Checked)
                        {
                            String quant = txt1.Text.Trim();
                            double quantity = 0.00;
                            if (quant != "")
                            {

                                quantity = Convert.ToDouble(quant);
                            }

                            Label lbl = (Label)row.FindControl("SellingCost");

                            double cost = Convert.ToDouble(lbl.Text);
                            double totalcost = quantity * cost;
                            total += totalcost;
                            lblTotal.Text = total.ToString();
                            txtDiscount.Text = "0";
                            double taxamt = Convert.ToDouble(txtTax.Text);
                            double taxtotal = total + ((total * taxamt) / 100);

                            lblNetTotal.Text = taxtotal.ToString();
                        }

                    }
                }
            }



        }

        protected void saveSaleInvoice_Click(object sender, EventArgs e)
        {
            Boolean a = true;
            var repository = new SaleInvoice();
            var repository_detail = new SaleInvoiceDetail();
            if (customerDropDown.SelectedValue == "0")
            {
                this.ShowErrorNotification("Please select the Customer");
                a = false;
            }
            foreach (GridViewRow row in gridProduct.Rows)
            {
                CheckBox cb1 = (CheckBox)row.FindControl("chkbox1");
                TextBox txt1 = (TextBox)row.FindControl("txtQuantity");
                if (cb1.Checked)
                {
                    if (txt1.Text == "" || txt1.Text == null)
                    {
                        this.ShowErrorNotification("Please select any product OR Enter Correct Quantity");
                        a = false;
                    }
                }

            }
            if (a)
            {

                tblSaleInvoice tbl = new tblSaleInvoice();
                tblSaleInvoiceDetail tbl_detail = new tblSaleInvoiceDetail();
                tbl.InvoiceNo = lblInvoiceNo.Text;
                tbl.InvoiceDate = DateTime.Now;
                tbl.CustomerId = Convert.ToInt32(customerDropDown.SelectedValue);
                tbl.TotalSale = Math.Round(Convert.ToDecimal(lblTotal.Text), 2);
                tbl.Tax = Math.Round(Convert.ToDecimal(txtTax.Text), 2);
                tbl.Discount = Math.Round(Convert.ToDecimal(txtDiscount.Text), 2);
                tbl.NetSale = Math.Round(Convert.ToDecimal(lblNetTotal.Text), 2);
                repository.Add(tbl);
                int invoiceid = repository.GetId();

                Product repo = new Product();
                tblProduct prod = new tblProduct();

                foreach (GridViewRow row in gridProduct.Rows)
                {
                    CheckBox cb = (CheckBox)row.FindControl("chkbox1");
                    if (cb.Checked)
                    {
                        int id = Convert.ToInt32(gridProduct.DataKeys[row.RowIndex].Value);
                        TextBox txt = (TextBox)row.FindControl("txtQuantity");
                        string quantity = txt.Text;
                        tbl_detail.InvoiceId = invoiceid;
                        tbl_detail.ProductId = id;
                        tbl_detail.Quantity = Convert.ToInt32(quantity);
                        repository_detail.Add(tbl_detail);
                        prod = repo.Get(id);
                        prod.Quantity = prod.Quantity - Convert.ToInt32(quantity);
                        repo.Update(prod);

                    }
                }

                this.ShowSuccessfulNotification("Sale Invoice Added");
                Response.Redirect("saleInvoice.aspx", true);
            }
            else
            {
                this.ShowErrorNotification("Please select any product OR Enter Correct Quantity");
            }
        }

        protected void txtDiscount_TextChanged(object sender, EventArgs e)
        {
            double taxamt = Convert.ToDouble(txtTax.Text);
            double taxtotal = total + ((total * taxamt) / 100);
            double discountTotal = Convert.ToDouble(txtDiscount.Text);
            double nettotal = (taxtotal - (taxtotal * discountTotal) / 100);

            lblNetTotal.Text = nettotal.ToString();
        }


    }


}


