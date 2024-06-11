using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics.Eventing.Reader;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;
using System.Xml.Linq;
//using System.Windows.Forms;
using System.Drawing;
using System.Security.Cryptography;
using System.Text;
using System.Security.Policy;

namespace FastTrackPCs
{
    public partial class Login : System.Web.UI.Page
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
            //if (Session["user"] != null) //if varible is empty, user has already logged in
            //{
            //    Response.Redirect("LoggedInHomepage.aspx"); // take us to admin home page 
            //}

            if (!IsPostBack && Session["Basket"] == null) // session is null
            {
                Session["SessionID"] = Guid.NewGuid().ToString(); // set new session
                Session["Basket"] = null; // basket set to null
            }
            else
            {
                basket = (List<BasketItem>)Session["Basket"]; // store list items in basket
                UpdateMaster();
            }

            if (!(IsPostBack))
            {
                Session["attemptsReached"] = false; // not reach limit
                ViewState["attempts"] = 3; // session start at 3
                lblAttempts.Text = "You have - 3 attempt(s)"; // label 
            }

            


        }

        void ChangePH(bool ph)
        {
            phLogin.Visible = ph; // visible
            phSignup.Visible = !ph; // not visisble
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {

           

            try
            {
                int customerID = 0; // customer ID is 0

                //insert customer information
                FastTrackDSTableAdapters.customerTableAdapter customerDB = new FastTrackDSTableAdapters.customerTableAdapter();
                customerID = customerDB.InsertAndGetCustomerID(txtCustomerFirstname.Text, txtCustomerLastname.Text, txtCustomerEmail.Text, txtCustomerPassword.Text, DateTime.Now, true);

                Session["CustomerID"] = customerID; //store customer ID
                lblSignupMessage.ForeColor = Color.Green; // change colour to green
                lblSignupMessage.Text = "Signup successful!"; //change message
                ChangePH(true); // change placeholder
            }
            catch (Exception ex)
            {
                lblSignupMessage.ForeColor = Color.Red; //change to red
                lblSignupMessage.Text = "Failed Signup" + ex.Message; // change message
                //lblSignupMessage.Text = ex.Message;
            }

            


        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {

            
            FastTrackDSTableAdapters.customerTableAdapter customerDB = new FastTrackDSTableAdapters.customerTableAdapter();
            FastTrackDS.customerDataTable row = customerDB.CheckLogin(txtLoginEmail.Text, txtLoginPassword.Text); // check login detials based on database

            //Attempts

            ViewState["attempts"] = int.Parse(ViewState["attempts"].ToString()) - 1;



            if (row.Count > 0)//there are records
            {
                Session["CustomerID"] = (int)row[0]["CustomerID"]; //store customer id in session

                if (!(Session["basket"] is null)) //if basket is not empty
                    Response.Redirect("Cart.aspx"); // go to cart
                else//if basket is empty
                    Response.Redirect("Home.aspx"); // go homepage

            }
            else
            {
                lblSignupMessage.ForeColor = Color.Red; //change to red
                lblSignupMessage.Text = "Wrong username and password, please try again."; // change message
                txtLoginEmail.Text = String.Empty;
                txtLoginPassword.Text = String.Empty;
            }





            if (int.Parse(ViewState["attempts"].ToString()) <= 0)
            {

                
                Session["attemptsReached"] = true; // if attempts have been reached
                Response.Redirect("Home.aspx"); // go to homepage
            }



            lblAttempts.Text = "You have - " + ViewState["attempts"].ToString() + " attempt(s)"; //attempts label



        }

        

        protected void lbLoginIn_Click(object sender, EventArgs e)
        {
            ChangePH(true); // change placeholder
        }

        protected void lbSignup_Click(object sender, EventArgs e)
        {
            ChangePH(false); // change placeholder
        }
    }
}