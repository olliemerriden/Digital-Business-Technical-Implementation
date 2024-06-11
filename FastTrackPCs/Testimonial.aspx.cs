using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FastTrackPCs
{
    public partial class Testimonial : System.Web.UI.Page
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

            

            if (!IsPostBack && Session["Basket"] == null) // if basket is null
            {
                Session["SessionID"] = Guid.NewGuid().ToString(); // creates new session ID
                Session["Basket"] = null; // nulls basket
            }
            else
            {
                basket = (List<BasketItem>)Session["Basket"]; // store list in basket 
                UpdateMaster();
            }

            FastTrackDSTableAdapters.TestimonialsTableAdapter Test = new FastTrackDSTableAdapters.TestimonialsTableAdapter();

            dlTestimonials.DataSourceID = null; // nulls datasource
            dlTestimonials.DataSource = Test.GetTestByRating(5, true); // creates new data source
            dlTestimonials.DataBind(); // binds data



        }

        protected void dlTestimonials_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnContact_Click(object sender, EventArgs e)
        {
            try
            {
                FastTrackDSTableAdapters.TestimonialsTableAdapter Test = new FastTrackDSTableAdapters.TestimonialsTableAdapter();
                //inserts new testimomnial
                Test.InsertNewTest(txtTestMessage.Text, DateTime.Now, txtTestName.Text, false, Convert.ToInt32(ddlTestRating.SelectedValue));


                lblTestMessage.ForeColor = Color.Green; // change to green
                lblTestMessage.Text = "Thank you for submitting your testimonial. It is currently pending approval"; // changes message

                txtTestMessage.Text = ""; 
                txtTestName.Text = "";
                ddlTestRating.SelectedIndex = ddlTestRating.Items.Count - 1; // sets to max value

            }
            catch (Exception ex)
            {
                lblTestMessage.ForeColor = Color.Red; // changes to red
                lblTestMessage.Text = "There was an error please try again" + ex.Message; // error message
            }

        }

        protected void btnFilterTest_Click(object sender, EventArgs e)
        {
            FastTrackDSTableAdapters.TestimonialsTableAdapter Test = new FastTrackDSTableAdapters.TestimonialsTableAdapter();

            
            dlTestimonials.DataSourceID = null; // nulls data soruce

            //dlTestimonials.DataBind();

            if (ddlFilterTest.SelectedIndex.ToString() == "4") // if ddl is 5
            {
                dlTestimonials.DataSource = Test.GetTestByRating(1, true); //changes datasoruce based on query
            }
            if (ddlFilterTest.SelectedIndex.ToString() == "3") // if ddl is 4
            {
                dlTestimonials.DataSource = Test.GetTestByRating(2, true); //changes datasoruce based on query
            }
            if (ddlFilterTest.SelectedIndex.ToString() == "2") // if ddl is 3
            {
                dlTestimonials.DataSource = Test.GetTestByRating(3, true); //changes datasoruce based on query
            }
            if (ddlFilterTest.SelectedIndex.ToString() == "1") // if ddl is 2
            {
                dlTestimonials.DataSource = Test.GetTestByRating(4, true); //changes datasoruce based on query
            }
            if (ddlFilterTest.SelectedIndex.ToString() == "0") // if ddl is 1
            {
                dlTestimonials.DataSource = Test.GetTestByRating(5, true); //changes datasoruce based on query
            }

            dlTestimonials.DataBind(); //binds data
            

        }
    }
}