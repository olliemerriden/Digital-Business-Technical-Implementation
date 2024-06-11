using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;
using System.Xml.Linq;

namespace FastTrackPCs
{
    public partial class Backend : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblLoggedIAnAs.Text = " Welcome, " + Session["user"]; // assigns username to label

            if (Session["staffuser"] == null) //session variable is empty then user did not log in
            {
                Response.Redirect("Home.aspx");
            }
            else // session variable has value then user has properly logged in
            {
                lblLoggedIAnAs.Text = " Welcome, " + Session["staffuser"];  // assigns username to label
            }

        }

        



        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session["staffuser"] = null; //reset the session varibale
            Response.Redirect("Home.aspx"); // go to home
        }


        protected void btnAdminHome_Click(object sender, EventArgs e)
        {
            //Session["staffuser"] = null; //reset the session varibale
            Response.Redirect("AdminHome.aspx"); // go to Admin Home
        }

        protected void btnAdminOrders_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminOrders.aspx"); // go to orders
        }

        protected void btnAdminProducts_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminProducts.aspx"); // go to products
        }

        protected void btnAdminCustomers_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminCustomers.aspx"); // go to customers
        }

        protected void btnAdminStaff_Click(object sender, EventArgs e)
        { 
            Response.Redirect("AdminStaff.aspx"); // go to staff
        }
    }
}