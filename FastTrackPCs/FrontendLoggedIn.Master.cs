using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FastTrackPCs
{
    public partial class FrontendLoggedIn : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblLoggedInAs.Text = " Welcome, " + Session["user"];

            if (Session["user"] == null) //session variable is empty then user did not log in
            {
                Response.Redirect("Home.aspx");
            }
            else // session variable has value then user has properly logged in
            {
                lblLoggedInAs.Text = " Welcome, " + Session["user"];
            }

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {

        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session["user"] = null; //reset the session varibale
            Response.Redirect("Home.aspx");
        }
    }
}