using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
//using System.Windows.Forms;

namespace FastTrackPCs
{
    public partial class Cart : System.Web.UI.Page
    {
        public int OrderIDInt()
        {
            FastTrackDSTableAdapters.orderTableAdapter order = new FastTrackDSTableAdapters.orderTableAdapter();
            


            DataTable resultOrderID = new DataTable(); //intlisase data table
            resultOrderID = order.GetNewestOrderID(); // uses the query GetFlowerByID and ignores the fact it is an int and converts the selected value to a string

            
            int orderID = int.Parse(resultOrderID.Rows[0]["OrderID"].ToString()); //store order ID in int
            return orderID;
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
            

            //retrieve or create basket from session
            if (!IsPostBack && Session["Basket"] == null) //basket session is null
            {
                Response.Redirect("Shop.aspx"); // go to shop
            }
            else
            {
                basket = (List<BasketItem>)Session["Basket"]; // make basket equal list
                lblProductSummaryCount.Text = basket.Count.ToString(); // assign to label
                lblSummaryAmount.Text = BasketAmount().ToString();// assing to label

                //double subtotal = Convert.ToDouble(lblSummaryAmount.Text);
                //double shipping = 3;
                //lblShippingValue.Text = shipping.ToString();
                //double sum = subtotal + shipping;
                //lblCartTotalValue.Text = sum.ToString();
                lblCartTotalValue.Text = lblSummaryAmount.Text; // assign to label
                UpdateMaster();
            }

            gvSummary.DataSource = basket; // set data soruce to basket
            gvSummary.DataBind(); // bind the data


            //pay button only when there is something in the basket
            if (!(basket is null) && basket.Count > 0) 
            {
                btnProceedToCheckout.Visible = true; // make button visable
            }
            else
            {
                btnProceedToCheckout.Visible = false; // make button not visable
            }

            if (!(IsPostBack))
            {
                

                //update year
                int thisYear = DateTime.Now.Year;
                for (int yr = thisYear; yr < thisYear + 5; yr++)
                {
                    ddlExpiryYear.Items.Add(new ListItem(yr.ToString()));
                }

                //update month
                int thisMonth = DateTime.Now.Month;
                ddlExpiryMonth.SelectedIndex = thisMonth - 1;
            }

            if(Session["CustomerID"] == null) // if customer session is null
            {
                
            }
            else
            {
            lblLoginMessage.ForeColor = Color.Green; // set greeen
            lblLoginMessage.Text = "You are logged in!"; // change label
            } 
            

            mvCart.SetActiveView(vSummary); // set view

            
            
        }

        protected void btnProceedToCheckout_Click(object sender, EventArgs e)
        {



            //user is logged in move to billing
            if (!(Session["CustomerID"] is null))
            {
                mvCart.SetActiveView(vCard); // go to card view
            }
            else //if not loged in
            {
                Response.Redirect("Login.aspx"); // go to login
            }



        }

        protected void gvSummary_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "UpdateProduct") // if the update button is pressed
            {
                int row = Convert.ToInt32(e.CommandArgument.ToString()); // get row

                txtbUpdateQuantity.Text = basket[row].Quantity.ToString(); // assiign label based on row
                lblUpdateUnitPrice.Text = basket[row].ProductPrice.ToString(); // assiign label based on row
                lblUpdateProductID.Text = basket[row].ProductID.ToString(); // assiign label based on row
                lblUpdateProductName.Text = basket[row].ProductName.ToString(); // assiign label based on row


                hfRowIndex.Value = row.ToString(); // store in hf

                lblCartTotalValue.Text = lblSummaryAmount.Text; // assing label

                mvCart.SetActiveView(vUpdate); // set new view

            }
            else if (e.CommandName == "RemoveProduct") // if remove button is prressed
            {
                int row = Convert.ToInt32(e.CommandArgument.ToString()); // get row

                basket.RemoveAt(row); //remove based on row 

                lblSummaryAmount.Text = BasketAmount().ToString(); // assiign label based on row
                lblProductSummaryCount.Text = basket.Count().ToString(); // assiign label based on row
                lblNewAmount.Text = BasketAmount().ToString(); // assiign label based on row

                gvSummary.DataSource = basket; // change data soruce
                gvSummary.DataBind(); // bind the data

                UpdateMaster();

                lblCartTotalValue.Text = lblSummaryAmount.Text; // assing label




                //mvCart.SetActiveView(vSummary);

                if (basket.Count <= 0) // if basket count is less than or equal to 0
                {
                    Response.Redirect("Shop.aspx"); // go to shop
                    Session["Basket"] = null; // null the basket
                }
                else
                {
                    mvCart.SetActiveView(vSummary); // go to summary
                }

            }
        }

        protected void btnSummaryRecalcuate_Click(object sender, EventArgs e)
        {



            if (lblUpdateUnitPrice.Text != "") //not equal to nothing
            {
                lblNewAmount.Text = (Convert.ToDouble(lblUpdateUnitPrice.Text) * Convert.ToDouble(txtbUpdateQuantity.Text)).ToString(); // unit price * quanity 
                mvCart.SetActiveView(vUpdate); // go to update view
            }


        }

        protected void btnSummaryUpdateBasket_Click(object sender, EventArgs e)
        {
            int row = Convert.ToInt32(hfRowIndex.Value); //get row

            basket[row].Quantity = Convert.ToInt32(txtbUpdateQuantity.Text); // asssing quanitity
            basket[row].Amount = (float)(Convert.ToDouble(lblUpdateUnitPrice.Text) * Convert.ToDouble(txtbUpdateQuantity.Text)); // asign ammount based on price * quanitity

            lblSummaryAmount.Text = BasketAmount().ToString(); // assiign label 
            lblProductSummaryCount.Text = basket.Count().ToString(); // assiign label 
            lblNewAmount.Text = BasketAmount().ToString(); // assiign label 

            UpdateMaster();

            gvSummary.DataSource = basket; // change datasoource
            gvSummary.DataBind(); // bind data

            //double subtotal = Convert.ToDouble(lblSummaryAmount.Text);
            //double shipping = 3;
            //lblShippingValue.Text = shipping.ToString();
            //double sum = subtotal + shipping;
            //lblCartTotalValue.Text = sum.ToString();

            lblCartTotalValue.Text = lblSummaryAmount.Text; // assiign label

            mvCart.SetActiveView(vSummary); // change view to summary
        }

        

        protected void cvExpiryDate_ServerValidate(object source, ServerValidateEventArgs args)
        {
            //Check if the expiration date is valid.

            //Get the year entered
            int ExpirationYear = Convert.ToInt32(ddlExpiryYear.SelectedValue);
            int ThisYear = DateTime.Now.Year;

            //If the expiration year is equal to today's year then check that the month is later
            if (ExpirationYear == ThisYear)
            {
                int ExpirationMonth = Convert.ToInt32(ddlExpiryMonth.SelectedValue);
                int ThisMonth = DateTime.Now.Month;
                if (ExpirationMonth < ThisMonth) // is not in the past
                {
                    cvExpiryDate.ErrorMessage = "The expiration date selected is in the past."; // error message
                    args.IsValid = false;
                }
            }
        }

        protected void cvCVV_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (txtCVV.Text.Length != 3) // if CVV is not 3 length
            {
                cvCVV.ErrorMessage = "Please enter valid CVV"; // error message
                args.IsValid = false;

            }
        }

        protected void cvCardNumber_ServerValidate(object source, ServerValidateEventArgs args)
        {
            //this code is adapted from:
            //https://www.prowaretech.com/articles/archived/asp-net/validate-credit-card-number#!
            //http://www.aboutfortunate.com/Code-Repository.aspx?pageindex=2&entryid=53

            //Create a regular expression object to check the creditcard number against.
            System.Text.RegularExpressions.Regex RegEx = null;
            if (ddlCardType.SelectedValue == "American Express")
                RegEx = new System.Text.RegularExpressions.Regex("3[4,7]\\d{13}");
            else if (ddlCardType.SelectedValue == "Discover")
                RegEx = new System.Text.RegularExpressions.Regex("6011-?\\d{4}-?\\d{4}-?\\d{4}");
            else if (ddlCardType.SelectedValue == "Master Card")
                RegEx = new System.Text.RegularExpressions.Regex("5[1-5]\\d{2}-?\\d{4}-?\\d{4}-?\\d{4");
            else if (ddlCardType.SelectedValue == "Visa")
                RegEx = new System.Text.RegularExpressions.Regex("4\\d{3}-?\\d{4}-?\\d{4}-?\\d{4}");

            //Get the credit card number
            string CreditCardNumber = txtCardNumber.Text.Trim().Replace("-", "");

            //If the regular expression matches then also validate with a checksum.
            //If it doesn't then just don't submit the page.

            if (CreditCardNumber.Length > 4 && !(RegEx == null) && (RegEx.Match(txtCardNumber.Text).Success))
            {
                System.Collections.Generic.IEnumerable<char> rev = CreditCardNumber.Reverse();
                int sum = 0, i = 0;
                foreach (char c in rev)
                {
                    if (c < '0' || c > '9') //check if each digit is a number
                    {
                        cvCardNumber.ErrorMessage = "Please enter a valid card number."; //error message
                        args.IsValid = false;
                    }

                    int tmp = c - '0';
                    if ((i & 1) != 0)
                    {
                        tmp <<= 1;
                        if (tmp > 9)
                            tmp -= 9;
                    }
                    sum += tmp;
                    i++;
                }

                if (!((sum % 10) == 0))
                {
                    cvCardNumber.ErrorMessage = "Please enter a valid card number."; //error message
                    args.IsValid = false;
                }
            }
            else
            {
                cvCardNumber.ErrorMessage = "Please enter a valid card number."; // error message
                args.IsValid = false;
            }
        }

        protected void btnCardCancel_Click(object sender, EventArgs e)
        {
            mvCart.SetActiveView(vSummary); // change view to summary
        }

        protected void btnCardSubmit_Click(object sender, EventArgs e)
        {


            Page.Validate("CreditCard"); // validate based on group name
            if (Page.IsValid && txtCardNumber.Text.Length == 16 && txtCVV.Text.Length == 3) // check length of card and CVV
            {
                //get last 4 digits of credit card
                lblCardInfo.Text = "Billing card is ****" + txtCardNumber.Text.Substring(txtCardNumber.Text.Length - 4); // get last 4 digits for next page

                mvCart.SetActiveView(vBilling); // set to biling view
            }
            else
            {

                lblCardMessage.Text = "Card Details are invalid. Card Number must be 16 digits. CVV must be 3 digits. "; //error message
                mvCart.SetActiveView(vCard); //change view to card
            }

        }

        protected void btnOrderComplete_Click(object sender, EventArgs e)
        {
            Page.Validate("BillingInfo"); // validate based on group name
            if (Page.IsValid && !(Session["CustomerID"] is null)) // not null customer ID
            {
                int customerID = (int)Session["CustomerID"]; //Customer ID Session stored in INT
                string CustomisationRam = (string)Session["ddlRam"]; //session stored in string
                string CustomisationCpu = (string)Session["ddlCpu"];//session stored in string
                string CustomisationGraphics = (string)Session["ddlGraphics"];//session stored in string
                string CustomisationStorgae = (string)Session["ddlStorage"];//session stored in string
                string CustomisationCase = (string)Session["ddlCase"];//session stored in string

                FastTrackDSTableAdapters.orderTableAdapter order = new FastTrackDSTableAdapters.orderTableAdapter();

                
               
                try
                {
                    //insert order

                    
                    // run the sql query to insert the order
                    order.InsertNewOrder(customerID, Session["SessionID"].ToString(), DateTime.Now);

                    

                    //insert order detail
                    foreach (BasketItem item in basket) //save each item in the basket
                    { 
                        
                        FastTrackDSTableAdapters.orderDetailTableAdapter detail = new FastTrackDSTableAdapters.orderDetailTableAdapter();
                        detail.InsertNewOrderDetail(OrderIDInt(), item.ProductID, item.ProductName, "payment", Convert.ToDecimal(item.ProductPrice), item.Quantity); //inset new items into database
                        
                        if (item.ProductID == 0) // if product ID is 0 (for customisation)
                        {
                        //insert customisation
                        FastTrackDSTableAdapters.customisationOrderTableAdapter custom = new FastTrackDSTableAdapters.customisationOrderTableAdapter();
                            //inset new items into database

                            custom.InsertNewCustomOrder(OrderIDInt(), customerID, item.Quantity, Convert.ToDecimal(item.ProductPrice), Session["ddlRam"].ToString(), Session["ddlCpu"].ToString(), Session["ddlGraphics"].ToString(), Session["ddlStorage"].ToString(), Session["ddlCase"].ToString());

                        }
                        
                    }

                    


                    //save card info
                    FastTrackDSTableAdapters.cardInformationTableAdapter card = new FastTrackDSTableAdapters.cardInformationTableAdapter();
                    card.InsertNewCardInfo(txtCardNumber.Text, ddlCardType.SelectedItem.Text, Convert.ToInt32(ddlExpiryMonth.SelectedItem.Text), Convert.ToInt32(ddlExpiryYear.SelectedItem.Text), Convert.ToInt32(txtCVV.Text));

                    //billing info
                    FastTrackDSTableAdapters.billingInfoTableAdapter billing = new FastTrackDSTableAdapters.billingInfoTableAdapter();
                    billing.InsertNewBillingInfo(customerID, txtCardNumber.Text, txtOrderFirstname.Text, txtOrderLastname.Text, txtOrderAddress.Text, txtOrderPostcode.Text, txtOrderCity.Text, ddlOrderCountry.SelectedItem.Text);

                    //success message
                    lblMessage.Text = "Your transaction was successful. Thank you for buying from us.";
                    mvCart.SetActiveView(vConfirmation);


                    basket.Clear(); //clear basket
                    UpdateMaster(); //update master

                    lblSummaryAmount.Text = BasketAmount().ToString(); //assign label
                    lblProductSummaryCount.Text = basket.Count().ToString(); //assign label
                    lblNewAmount.Text = BasketAmount().ToString(); //assign label

                    lblMessage.Text = "Your transaction was successful. Thank you for buying from us."; //success message
                    mvCart.SetActiveView(vConfirmation); // change to confirmation view

                }
                catch (Exception ex)
                {
                    lblPaymentMessage.Text = "Sorry an error occured saving your order: " + ex.Message; //error message
                    mvCart.SetActiveView(vBilling); //chnage to billing view
                }

                

            }

        }

        protected void btnBackToShop_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("Shop.aspx"); // go to shop
        }

        protected void gvSummary_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}