using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FastTrackPCs
{
    public partial class About : System.Web.UI.Page
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
            if (!IsPostBack && Session["Basket"] == null) // if session basket is null
            {
                Session["SessionID"] = Guid.NewGuid().ToString(); //create session ID
                Session["Basket"] = null; //make basket null
            }
            else
            {
                basket = (List<BasketItem>)Session["Basket"]; // basket is equal to the list
                UpdateMaster(); //update master
            }
        }
        }
    }