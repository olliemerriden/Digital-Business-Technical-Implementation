using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace FastTrackPCs
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnProceedToCheckout_Click(object sender, EventArgs e)
        {

            if (Session["user"] == null) //session variable is empty then user did not log in
            {
                MessageBox.Show("You must log in before preceding");
                Response.Redirect(Request.RawUrl);

            }
            else 
            {
                Response.Redirect("Checkout.aspx");
            }

        }
    }
}