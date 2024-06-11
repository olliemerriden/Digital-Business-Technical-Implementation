using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FastTrackPCs
{
    public partial class Customisation : System.Web.UI.Page
    {

        double CalculateTotal()
        {
            
            
            double baseCost = 0.00; //set value

            double quote = baseCost; 

            

            //calculate CPU
            if (ddlCpu.SelectedItem.Text == "Intel")
                quote += 250;
            else if (ddlCpu.SelectedItem.Text == "Amd")
                quote += 200;
            else
                quote += 150;

            //calculate RAM
            if (ddlRam.SelectedItem.Text == "8GB")
                quote += 40;
            else if (ddlRam.SelectedItem.Text == "16GB")
                quote += 70;
            else
                quote += 100;


            //calculate GRAPHICS
            if (ddlGraphics.SelectedItem.Text == "Budget")
                quote += 100;
            else if (ddlGraphics.SelectedItem.Text == "Standard")
                quote += 200;
            else 
                quote += 300;

            //calculate STORAGE
            if (ddlStorage.SelectedItem.Text == "500GB")
                quote += 50;
            else if (ddlStorage.SelectedItem.Text == "1TB")
                quote += 100;
            else 
                quote += 120;

            //calculate SIZE
            if (ddlCase.SelectedItem.Text == "Small")
                quote += 40;
            else if (ddlCase.SelectedItem.Text == "Medium")
                quote += 70;
            else 
                quote += 100;



            return quote; //return value




        }

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
            
            if (!IsPostBack)
            {

            FastTrackDSTableAdapters.customisationTableAdapter customisationTable = new FastTrackDSTableAdapters.customisationTableAdapter();



            ddlCpu.DataSource = customisationTable.GetAllCpu(); // get ddl data from query
            ddlCpu.DataTextField = "CustomisationCpu"; // assing value
            ddlCpu.DataValueField = "CustomisationCpu"; // assing value
            ddlCpu.DataBind(); // bind data

            ddlRam.DataSource = customisationTable.GetAllRam(); // get ddl data from query
                ddlRam.DataTextField = "CustomisationRam"; // assing value
                ddlRam.DataValueField = "CustomisationRam"; // assing value
                ddlRam.DataBind(); // bind data

                ddlGraphics.DataSource = customisationTable.GetAllGraphics(); // get ddl data from query
                ddlGraphics.DataTextField = "CustomisationGraphics"; // assing value
                ddlGraphics.DataValueField = "CustomisationGraphics"; // assing value
                ddlGraphics.DataBind(); // bind data

                ddlStorage.DataSource = customisationTable.GetAllStorage(); // get ddl data from query
                ddlStorage.DataTextField = "CustomisationStorage"; // assing value
                ddlStorage.DataValueField = "CustomisationStorage"; // assing value
                ddlStorage.DataBind(); // bind data

                ddlCase.DataSource = customisationTable.GetAllCases(); // get ddl data from query
                ddlCase.DataTextField = "CustomisationCase";  // assing value
                ddlCase.DataValueField = "CustomisationCase"; // assing value
                ddlCase.DataBind(); // bind data



            }

            if (!IsPostBack && Session["Basket"] == null) // if session is null
            {
                Session["SessionID"] = Guid.NewGuid().ToString(); // create new session
                Session["Basket"] = null; //null basket
            }
            else
            {
                basket = (List<BasketItem>)Session["Basket"]; //store list in basket 
                UpdateMaster();
            }






        }




        protected void btnCustomTotal_Click1(object sender, EventArgs e)
        {
            //lblTotalAmount.Text = "Your total is: £" +  CalculateTotal().ToString();
            lblTotalAmount.Text = CalculateTotal().ToString(); //calcuate total using function
            btnAddToBasket.Visible = true; // show basket button
        }

        protected void btnAddToBasket_Click(object sender, EventArgs e)
        {
            if (!(lblTotalAmount.Text.IsNullOrEmpty())) // if ammount is not empty
            {
                BasketItem item = new BasketItem(); // new instance of basket item
                item.SessionID = Session["SessionID"].ToString(); // store session ID
                
                item.ProductName = "Custom Design"; // assign item
                item.Quantity = 1; // assign item
                item.ProductPrice = float.Parse(lblTotalAmount.Text); // assing item
                item.Amount = item.ProductPrice * item.Quantity; // assing item based on price * quantity

                if (basket == null) // basket is null
                basket = new List<BasketItem>(); // create new list
                else
                {
                    foreach (BasketItem basketItem in basket) // for each item in basket
                    {
                        if (basketItem.ProductID == item.ProductID) // set product ID
                        {
                            basket.Remove(basketItem); // remove basket item
                            break;
                        }
                    }
                }

                Session["ddlRam"] = ddlRam.Text; // store in session
                Session["ddlCpu"] = ddlCpu.Text; // store in session
                Session["ddlGraphics"] = ddlGraphics.Text; // store in session
                Session["ddlStorage"] = ddlStorage.Text; // store in session
                Session["ddlCase"] = ddlCase.Text; // store in session

                basket.Add(item); // add item to basket
                Session["Basket"] = basket; // store in session

                UpdateMaster();

                Response.Redirect("Cart.aspx"); // change view to cart
            }
        }
    }
}