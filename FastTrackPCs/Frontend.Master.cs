using Azure;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FastTrackPCs
{
    public partial class Frontend : System.Web.UI.MasterPage
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


            
            
        }




        protected void btnCart_Click(object sender, EventArgs e)
        {
            
            //retrieve or create basket from session
            if (lblCount.Text == "0") // if no basket items
            {
                Response.Redirect("Shop.aspx"); // go to shop
            }
            else
            {
                Response.Redirect("Cart.aspx"); // go to cart
            }

        }

        protected void btnUser_Click(object sender, EventArgs e)
        {

            if (Session["user"] == null) //session variable is empty then user did not log in
            {
                Response.Redirect("Login.aspx");
            }
            else // session variable has value then user has properly logged in
            {
                Response.Redirect("Home.aspx");
            }


        }

    }
}