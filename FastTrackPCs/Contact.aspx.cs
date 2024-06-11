using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using System.Windows.Forms;

namespace FastTrackPCs
{
    public partial class Contact : System.Web.UI.Page
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
            if (!IsPostBack && Session["Basket"] == null) // if basket session is null
            {
                Session["SessionID"] = Guid.NewGuid().ToString(); // create new session ID
                Session["Basket"] = null; //baset session is nul
            }
            else
            {
                basket = (List<BasketItem>)Session["Basket"]; // store list in basket
                UpdateMaster();
            }
        }

            protected void btnContact_Click(object sender, EventArgs e)
        {
            FastTrackDSTableAdapters.contactTableAdapter contactTable = new FastTrackDSTableAdapters.contactTableAdapter();

            if (txtbContactMessage != null) //is the text box is not empty then...
            {


                contactTable.InsertContactMessage(txtContactName.Text, txtContactEmail.Text, txtbContactMessage.Text); //insert into database
                lblContactMessage.ForeColor = Color.Green; //set to green
                lblContactMessage.Text = "You have successfully submitted a response"; //success message
                txtContactName.Text = String.Empty;
                txtContactEmail.Text = String.Empty;
                txtbContactMessage.Text = String.Empty;

            }
            else // if it is null then...
            {
                lblContactMessage.ForeColor = Color.Red; //set red
                lblContactMessage.Text = "Response was not submitted, please try again!"; //error message
                txtContactName.Text = String.Empty;
                txtContactEmail.Text = String.Empty;
                txtbContactMessage.Text = String.Empty;
            }
        }
    }
}