using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FastTrackPCs
{
    public partial class AdminOrders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

        }

        

        protected void btnReset_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.RawUrl); // refresh page
        }

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            gvOrder.DataSourceID = null; // data source is nulled 
            FastTrackDSTableAdapters.orderDetailTableAdapter orderDetail = new FastTrackDSTableAdapters.orderDetailTableAdapter();
            gvOrder.DataSource = orderDetail.GetAdminOrderByID(int.Parse(ddlStaffID.SelectedValue)); // get new data soruce by ID
            gvOrder.DataBind(); // bind data
        }

        
    }
}