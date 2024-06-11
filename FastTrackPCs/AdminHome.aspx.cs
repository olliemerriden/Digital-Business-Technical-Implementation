using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FastTrackPCs
{
    public partial class AdminHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdminOrders_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminOrders.aspx"); // go to admin orders page
        }

        protected void btnAdminProducts_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminProducts.aspx"); // go to admin products page
        }

        protected void btnAdminCsustomers_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminCustomers.aspx"); // go to admin customers page
        }

        protected void btnAdminStaff_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminStaff.aspx"); // go to admin staff page
        }
    }
}