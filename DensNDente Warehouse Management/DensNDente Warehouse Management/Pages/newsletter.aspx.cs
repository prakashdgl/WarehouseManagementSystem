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
    public partial class WebForm8 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            NewsLetter repository = new NewsLetter();
            Customer obj = new Customer();
            var emails = obj.GetAll().Select(r => r.Email).ToArray();
            Email eml = new Email();
            foreach (var item in emails)
            {
                eml.sendEmail(item, txtMessage.Text);
            }
            if (repository.Add(new tblNewsLetter { Message = txtMessage.Text, NewsDate = DateTime.Now }))
            {
                txtMessage.Text = "";
                this.ShowSuccessfulNotification("Email sent successfully");
                gridNewsletters.DataBind();
            }
            else
            {
                this.ShowErrorNotification("Error occured");
            }

        }


    }
}