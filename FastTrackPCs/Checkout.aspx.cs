using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
//using System.Windows.Forms;

namespace FastTrackPCs
{
    public partial class Checkout : System.Web.UI.Page
    {
        List<BasketItem> basket = new List<BasketItem>();


        //count items
        public int BasketCount()
        {
            return basket.Count();
        }

        //calculate total ammount 
        public float BasketAmount()
        {
            float amount = 0.0f;
            foreach (BasketItem item in basket)
            {
                amount += item.ProductPrice * item.Quantity;
            }
            return amount;
        }

        public void UpdateMaster()
        {
            Label masterAmount, masterCount;
            masterAmount = (Label)Master.FindControl("lblAmount");
            masterCount = (Label)Master.FindControl("lblCount");
            if (!(masterAmount == null || masterCount == null || basket == null))
            {
                masterCount.Text = basket.Count.ToString();
                masterAmount.Text = BasketAmount().ToString();
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack && Session["Basket"] == null)
            {
                Response.Redirect("Shop.aspx");
            }
            else
            {
                basket = (List<BasketItem>)Session["Basket"];

                UpdateMaster();
            }

            //if (Session["user"] == null) //session variable is empty then user did not log in
            // {
            //     Response.Redirect("Home.aspx");
            // }
            mvCheckout.SetActiveView(vBilling);

            if (!(IsPostBack))
            {
                int thisYear = DateTime.Now.Year;
                for (int yr = thisYear; yr < thisYear + 5; yr++)
                {
                    ddlExpiryYear.Items.Add(new ListItem(yr.ToString()));
                }


                int thisMonth = DateTime.Now.Month;
                ddlExpiryMonth.SelectedIndex = thisMonth - 1;
            }



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
                if (ExpirationMonth < ThisMonth)
                {
                    cvExpiryDate.ErrorMessage = "The expiration date selected is in the past.";
                    args.IsValid = false;
                }
            }
        }

        protected void cvCVV_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (txtCVV.Text.Length != 3)
            {
                cvCVV.ErrorMessage = "Please enter valid CVV";
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
                        cvCardNumber.ErrorMessage = "Please enter a valid card number.";
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
                    cvCardNumber.ErrorMessage = "Please enter a valid card number.";
                    args.IsValid = false;
                }
            }
            else
            {
                cvCardNumber.ErrorMessage = "Please enter a valid card number.";
                args.IsValid = false;
            }
        }

        protected void btnCardCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Cart.aspx");
        }

        protected void btnCardSubmit_Click(object sender, EventArgs e)
        {
            Page.Validate("CreditCard");
            if (Page.IsValid)
            {
                //get last 4 digits of credit card
                lblCardInfo.Text = "Billing card is ****" + txtCardNumber.Text.Substring(txtCardNumber.Text.Length - 4);

                mvCheckout.SetActiveView(vBilling);
            }
        }

        protected void btnOrderComplete_Click(object sender, EventArgs e)
        {
            Page.Validate("BillingInfo");
            if (Page.IsValid && !(Session["CustomerID"] is null))
            {
                int customerID = (int)Session["CustomerID"];

                try
                {
                    //insert order
                    FastTrackDSTableAdapters.orderTableAdapter order = new FastTrackDSTableAdapters.orderTableAdapter();
                    int orderID = order.InsertNewOrder(customerID, Session["SessionID"].ToString(), DateTime.Now);

                    //insert order detail
                    foreach (BasketItem item in basket) //save each item in the basket
                    {
                        FastTrackDSTableAdapters.orderDetailTableAdapter detail = new FastTrackDSTableAdapters.orderDetailTableAdapter();

                        detail.InsertNewOrderDetail(orderID, item.ProductID, item.ProductName, "payment", Convert.ToDecimal(item.ProductPrice), item.Quantity);
                    }

                    //save card info
                    FastTrackDSTableAdapters.cardInformationTableAdapter card = new FastTrackDSTableAdapters.cardInformationTableAdapter();
                    card.InsertNewCardInfo(txtCardNumber.Text, ddlCardType.SelectedItem.Text, Convert.ToInt32(ddlExpiryMonth.SelectedItem.Text), Convert.ToInt32(ddlExpiryYear.SelectedItem.Text), Convert.ToInt32(txtCVV.Text));

                    //billing info
                    FastTrackDSTableAdapters.billingInfoTableAdapter billing = new FastTrackDSTableAdapters.billingInfoTableAdapter();
                    billing.InsertNewBillingInfo(txtCardNumber.Text, txtOrderFirstname.Text, txtOrderLastname.Text, txtOrderAddress.Text, txtOrderCity.Text, ddlOrderCountry.SelectedItem.Text, txtOrderPostcode.Text);

                    //success message
                    lblMessage.Text = "Your transaction was successful. Thank you for using our service.";

                    basket = null;
                    Session["CustomerID"] = null;
                    UpdateMaster();

                    //lblSummaryAmount.Text = BasketAmount().ToString();
                    //lblItemCount.Text = basket.Count().ToString();
                    //lblAmount.Text = BasketAmount().ToString();

                    //mvMain.SetActiveView(vConfirmation);
                }
                catch
                {

                }

            }
        }
    }
}