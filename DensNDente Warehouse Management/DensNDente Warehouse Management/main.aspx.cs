using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DensNDente_Warehouse_Management.Models;
using DensNDente_Warehouse_Management.EntityFramework;
using jQueryNotification.Helper;
using System.Globalization;


namespace DensNDente_Warehouse_Management
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                totalPurchase();
                totalSale();
                total_Products_below_SafteyStockLevel();
            }
        }

        private void total_Products_below_SafteyStockLevel()
        {
            Product repository = new Product();
            lblSafteyStock.InnerHtml = repository.Get_SafteyStockLevel_Count().ToString();
        }

        private void totalPurchase()
        {
            var now = DateTime.Now;
            var startOfMonth = new DateTime(now.Year, now.Month, 1);
            var endOfMonth = new DateTime(now.Year, now.Month, DateTime.DaysInMonth(now.Year, now.Month));
            PurchaseOrder repository = new PurchaseOrder();

            lblTotalPurchase.InnerHtml = "$" + repository.totalPurchaseByMonth(startOfMonth, endOfMonth).ToString();
        }

        private void totalSale()
        {
            try
            {

                var now = DateTime.Now;
                var startOfMonth = new DateTime(now.Year, now.Month, 1);
                var endOfMonth = new DateTime(now.Year, now.Month, DateTime.DaysInMonth(now.Year, now.Month));
                SalesTarget repository = new SalesTarget();

                String currentMonthName = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(now.Month);
                currentMonthName += " " + now.Year;

                lblPurchaseMonth.InnerHtml = "Total purchase of " + currentMonthName;
                lblSaleMonth.InnerHtml = "Total sale of " + currentMonthName;

                var currentMonthtarget = repository.GetAll().Where(r => r.MonthName.Equals(currentMonthName)).FirstOrDefault();

                SaleInvoice repo = new SaleInvoice();
                decimal totalSale = repo.totalSaleByMonth(startOfMonth, endOfMonth);
                lblTotalSale.InnerHtml = "$" + totalSale.ToString();
                double percentage = Math.Round(Convert.ToDouble((totalSale / currentMonthtarget.TargetAmount) * 100), 2);

                lbltarget.InnerHtml = "Congratulations! You have achieved " + percentage + "% of total sale";

                string rateBar = "<div style='float: left;'>" +
                "   <div class='meter red animate' style='width: 970px;;'>" +
                       "<span style='width: " + percentage + "%'><span></span>" +
                   "</div></div>";

                divRate.InnerHtml = rateBar;

            }
            catch (Exception)
            {


            }

        }

    }
}