using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DensNDente_Warehouse_Management.Models;
using DensNDente_Warehouse_Management.EntityFramework;
using jQueryNotification.Helper;
namespace DensNDente_Warehouse_Management.Pages
{
    public partial class SalesInvoiceUnD : System.Web.UI.Page
    {
         static double total = 0;
        int q;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                Load_Data_Grid();
                load_dropdown();
            }
        }
        private void Load_Data_Grid()
        {
            Product repository = new Product();
            var result = repository.GetAll().ToArray();
            gridProduct1.DataSource = result;
            gridProduct1.DataBind();
        }
        private void load_dropdown()
        {
            SaleInvoice repository = new SaleInvoice();
            var result = repository.GetAll().Where(r => r.Deleted == false).Select(r => new { id = r.InvoiceId, name = r.InvoiceNo }).ToList();
            result.Insert(0, new { id = 0, name = "--SELECT ID--" });
            DropDownList1.DataSource = result;
            DropDownList1.DataBind();
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue == "0")
            {
                this.ShowErrorNotification("Please select proper id");
            }
            else
           {
            Load_Data_Grid();
            lblCustName.Visible = true;
            gridProduct1.Visible = true;
            lblTotal1.Visible = true; 
            txtDiscount1.Visible = true;
            txtTax1.Visible = true;
            lblNetTotal1.Visible = true;
            SaleInvoice repository = new SaleInvoice();
            tblSaleInvoice saleInvoice = repository.Get(Convert.ToInt32(DropDownList1.SelectedValue));
            Customer c = new Customer();
            tblCustomer cust = c.Get(saleInvoice.CustomerId);
            lblCustName.Text = cust.Firstname + " " +cust.Lastname;
            lblTotal1.Text= saleInvoice.TotalSale.ToString();
            txtTax1.Text= saleInvoice.Tax.ToString();
            txtDiscount1.Text=saleInvoice.Discount.ToString();
            lblNetTotal1.Text=saleInvoice.NetSale.ToString();

            SaleInvoiceDetail repo = new SaleInvoiceDetail();
            tblSaleInvoiceDetail sid = new tblSaleInvoiceDetail();
            
IEnumerable<tblSaleInvoiceDetail> enume= repo.GetOnInvoiceId(Convert.ToInt32(saleInvoice.InvoiceId));
            var enumer= enume.GetEnumerator();
            while (enumer.MoveNext())
            {
                int rowindex = enumer.Current.ProductId - 1;
                CheckBox cb = (CheckBox)gridProduct1.Rows[rowindex].FindControl("chkbox1");
                cb.Checked = true;
                
                TextBox txt = (TextBox)gridProduct1.Rows[rowindex].FindControl("txtQuantity");
                txt.Visible = true;
                txt.Text = enumer.Current.Quantity.ToString();

            }
            total = Convert.ToDouble(lblTotal1.Text);
           }
        }



        protected void chkbox1_CheckedChanged(object sender, EventArgs e)
        {

            int selRowIndex = ((GridViewRow)(((CheckBox)sender).Parent.Parent)).RowIndex;
            CheckBox cb = (CheckBox)gridProduct1.Rows[selRowIndex].FindControl("chkbox1");

            if (cb.Checked)
            {

                TextBox txt = (TextBox)gridProduct1.Rows[selRowIndex].FindControl("txtQuantity");
                txt.Visible = true;

            }
            else
            {

                TextBox txt = (TextBox)gridProduct1.Rows[selRowIndex].FindControl("txtQuantity");
                String quant = txt.Text.Trim();
                txt.Visible = false;
                if (quant == null || quant == "")
                {
                    this.ShowErrorNotification("Please enter correct value");
                    txt.Focus();
                }else
                {
                    double quantity = Convert.ToDouble(quant);

                    Label lbl = (Label)gridProduct1.Rows[selRowIndex].FindControl("SellingCost");

                    double cost = Convert.ToDouble(lbl.Text);
                    double totalcost = quantity * cost;
                    total -= totalcost;
                    txt.Text = "";
                    txt.Visible = false;
                    txtDiscount1.Text = "0";
                    double taxamt = Convert.ToDouble(txtTax1.Text);
                    double taxtotal = total + ((total * taxamt) / 100);

                    lblNetTotal1.Text = taxtotal.ToString();
                     }
            }

        }

        protected void txtQuantity_TextChanged(object sender, EventArgs e)
        {

            {
                total = 0;

                int selRowIndex = ((GridViewRow)(((TextBox)sender).Parent.Parent)).RowIndex;
                CheckBox cb = (CheckBox)gridProduct1.Rows[selRowIndex].FindControl("chkbox1");


                if (cb.Checked)
                {
                    int id = Convert.ToInt32(gridProduct1.DataKeys[selRowIndex].Value);
                    Product p = new Product();
                    tblProduct product = p.Get(id);
                    // CheckBox cb1 = (CheckBox)gridProduct.Rows[selRowIndex].FindControl("chkbox1");
                    TextBox txt = (TextBox)gridProduct1.Rows[selRowIndex].FindControl("txtQuantity");
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
                        foreach (GridViewRow row in gridProduct1.Rows)
                        {
                            CheckBox cb1 = (CheckBox)row.FindControl("chkbox1");
                            TextBox txt1 = (TextBox)row.FindControl("txtQuantity");
                            if (cb1.Checked)
                            {
                                String quant = txt1.Text;
                                double quantity = Convert.ToDouble(quant);

                                Label lbl = (Label)row.FindControl("SellingCost");

                                double cost = Convert.ToDouble(lbl.Text);
                                double totalcost = quantity * cost;
                                total += totalcost;
                                lblTotal1.Text = total.ToString();
                                txtDiscount1.Text = "0";
                                double taxamt = Convert.ToDouble(txtTax1.Text);
                                double taxtotal = total + ((total * taxamt) / 100);

                                lblNetTotal1.Text = taxtotal.ToString();
                            }

                        }
                    }
                }
            }
        }                

        
        protected void updateSaleInvoice_Click(object sender, EventArgs e)
        {
            Boolean a = true;
            var repository = new SaleInvoice();
            var repository_detail = new SaleInvoiceDetail();
            if (DropDownList1.SelectedValue == "0")
            {
                this.ShowErrorNotification("Please select the Customer");
                a = false;
            }
            foreach (GridViewRow row in gridProduct1.Rows)
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

                SaleInvoiceDetail repo1 = new SaleInvoiceDetail();
                IEnumerable<tblSaleInvoiceDetail> enume1 = repo1.GetOnInvoiceId(Convert.ToInt32(DropDownList1.SelectedValue));
                var enumer1 = enume1.GetEnumerator();
                while (enumer1.MoveNext())
                {

                    Product p_repository = new Product();
                    tblProduct prod1 = p_repository.Get(enumer1.Current.ProductId);
                    prod1.Quantity = prod1.Quantity + Convert.ToInt32(enumer1.Current.Quantity);
                    p_repository.Update(prod1);
                }
                
                SaleInvoiceDetail sid = new SaleInvoiceDetail();
                tblSaleInvoiceDetail tbl_sid = new tblSaleInvoiceDetail();
                sid.DeleteByInvoiceId(Convert.ToInt32(DropDownList1.SelectedValue));
                

                tblSaleInvoice saleInvoice = repository.Get(Convert.ToInt32(DropDownList1.SelectedValue));
           
                
              //  tbl.InvoiceNo = lblInvoiceNo.Text;
                saleInvoice.InvoiceDate = DateTime.Now;
               saleInvoice.CustomerId = saleInvoice.CustomerId;
                saleInvoice.TotalSale = Math.Round(Convert.ToDecimal(lblTotal1.Text), 2);
                saleInvoice.Tax = Math.Round(Convert.ToDecimal(txtTax1.Text), 2);
                saleInvoice.Discount = Math.Round(Convert.ToDecimal(txtDiscount1.Text), 2);
                saleInvoice.NetSale = Math.Round(Convert.ToDecimal(lblNetTotal1.Text), 2);
                repository.Update(saleInvoice);

               
                Product repo = new Product();
                tblProduct prod = new tblProduct();

                foreach (GridViewRow row in gridProduct1.Rows)
                {
                    CheckBox cb = (CheckBox)row.FindControl("chkbox1");
                    if (cb.Checked)
                    {
                        int id = Convert.ToInt32(gridProduct1.DataKeys[row.RowIndex].Value);
                        TextBox txt = (TextBox)row.FindControl("txtQuantity");
                        string quantity = txt.Text;
                        tbl_sid.InvoiceId = Convert.ToInt32(DropDownList1.SelectedValue);
                        tbl_sid.ProductId = id;
                        tbl_sid.Quantity = Convert.ToInt32(quantity);
                       sid.Add(tbl_sid);
                        prod=repo.Get(id);
                        prod.Quantity = prod.Quantity - Convert.ToInt32(quantity);
                        repo.Update(prod);
                        
                    }
                }
                this.ShowSuccessfulNotification("Sale Invoice Added");
                Response.Redirect("SalesInvoiceUnD.aspx", true);
            }
            else
            {
                this.ShowErrorNotification("Please select any product OR Enter Correct Quantity");
            }
        }

        protected void txtDiscount_TextChanged(object sender, EventArgs e)
        {
            double taxamt = Convert.ToDouble(txtTax1.Text);
            double taxtotal = total + ((total * taxamt) / 100);
            double discountTotal = Convert.ToDouble(txtDiscount1.Text);
            double nettotal = (taxtotal - (taxtotal * discountTotal) / 100);

            lblNetTotal1.Text = nettotal.ToString();
        }

        protected void deleteSaleInvoice_Click(object sender, EventArgs e)
        {Boolean z=true;
            if (DropDownList1.SelectedValue == "0")
            {
                this.ShowErrorNotification("Please select the Customer");
                z = false;
            }
            if (z)
            {
                SaleInvoiceDetail repo1 = new SaleInvoiceDetail();
                IEnumerable<tblSaleInvoiceDetail> enume1 = repo1.GetOnInvoiceId(Convert.ToInt32(DropDownList1.SelectedValue));
                var enumer1 = enume1.GetEnumerator();
                while (enumer1.MoveNext())
                {

                    Product p_repository = new Product();
                    tblProduct prod1 = p_repository.Get(enumer1.Current.ProductId);
                    prod1.Quantity = prod1.Quantity + Convert.ToInt32(enumer1.Current.Quantity);
                    p_repository.Update(prod1);
                }
                SaleInvoice repoSale = new SaleInvoice();
                tblSaleInvoice tblSale = repoSale.Get(Convert.ToInt32(DropDownList1.SelectedValue));
                bool a = repoSale.Delete(tblSale.InvoiceId);

                SaleInvoiceDetail repo = new SaleInvoiceDetail();
                tblSaleInvoiceDetail sid = new tblSaleInvoiceDetail();
                bool b = repo.DeleteByInvoiceDetailId(tblSale.InvoiceId);
                if (a == true && b == true)
                {
                    this.ShowSuccessfulNotification("Sale Inovice Deleted");
                    Response.Redirect("SalesInvoiceUnD.aspx", true);
                }
            }
        }


       

       
    }

    
}