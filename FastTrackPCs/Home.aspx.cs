using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FastTrackPCs
{
    public partial class Home : System.Web.UI.Page
    {
        List<BasketItem> basket = new List<BasketItem>(); //list for basket


        //count items
        public int BasketCount()
        {
            return basket.Count(); // returns basket count
        }

        //calculate total ammount 
        public float BasketAmount()
        {
            float amount = 0.0f;
            foreach (BasketItem item in basket) //for every item in basket
            {
                amount += item.ProductPrice * item.Quantity; // multiply price and quanitity
            }
            return amount;
        }

        public void UpdateMaster()
        {
            Label masterAmount, masterCount;
            masterAmount = (Label)Master.FindControl("lblAmount"); //update ammount
            masterCount = (Label)Master.FindControl("lblCount"); //update count
            if (!(masterAmount == null || masterCount == null || basket == null)) //if null
            {
                masterCount.Text = basket.Count.ToString(); // add to labels
                masterAmount.Text = BasketAmount().ToString(); // add to labels
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && Session["Basket"] == null) // if session is null
            {
                Session["SessionID"] = Guid.NewGuid().ToString(); // new session
                Session["Basket"] = null; // basket set to null
            }
            else
            {
                basket = (List<BasketItem>)Session["Basket"]; // store list items in basket
                UpdateMaster();
            }


            if (Session["CustomerID"] == null) // if customer ID is null
            {

            }
            else
            {
                lblLoginMessage.ForeColor = Color.Green; //set to green
                lblLoginMessage.Text = "You are logged in!"; // change label
                
            }
            

            
        }

        protected void btnShopAll_Click(object sender, EventArgs e)
        {
            Response.Redirect("Shop.aspx"); // go to shop
        }
    }
}