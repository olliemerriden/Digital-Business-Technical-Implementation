using FastTrackPCs.FastTrackDSTableAdapters;
using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using System.Xml.Linq;

namespace FastTrackPCs
{
    public partial class AdminCustomers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            FastTrackDSTableAdapters.customerTableAdapter customerTable = new FastTrackDSTableAdapters.customerTableAdapter();


                ddlAdminCustomerID.DataTextField = "CustomerID"; // assigns value
                ddlAdminCustomerID.DataValueField = "CustomerID"; // assigns value
                ddlAdminCustomerID.DataBind(); // binds data
                
            }
            
            
            
           


        }

        protected void btnAddCustomer_Click(object sender, EventArgs e)
        {

            FastTrackDSTableAdapters.customerTableAdapter customerTable = new FastTrackDSTableAdapters.customerTableAdapter();



            // checks if values are inputted
            if (string.IsNullOrEmpty(txtAdminCustomerFirstname.Text) || string.IsNullOrEmpty(txtAdminCustomerLastname.Text) || string.IsNullOrEmpty(txtAdminCustomerEmail.Text) || string.IsNullOrEmpty(txtAdminCustomerPassword.Text)) //is the colour text box is not empty then...
            {

                
                MessageBox.Show("Customer was not created, please try again!"); // error messaege for user
                Response.Redirect(Request.RawUrl); // goes back to the same page if button is pressed


            }
            else // if it is null then...
            {
                customerTable.CreateNewCustomer(txtAdminCustomerFirstname.Text, txtAdminCustomerLastname.Text, txtAdminCustomerEmail.Text, txtAdminCustomerPassword.Text, DateTime.Now, true); //inserts the correct values into the table using the InsertFlower query

                MessageBox.Show("You have successfully created a customer."); // message for the user to say succesfully created record
                Response.Redirect(Request.RawUrl); // goes back to the same page if button is pressed
            }


        }

        protected void btnRetrieveCustomer_Click(object sender, EventArgs e)
        {

            FastTrackDSTableAdapters.customerTableAdapter customerTable = new FastTrackDSTableAdapters.customerTableAdapter();




            //get query result into data table
            DataTable resultCustomer = new DataTable(); // gives the data table the name resultFlower, and gives a new instance of it
            resultCustomer = customerTable.GetAllAdminID(int.Parse(ddlAdminCustomerID.SelectedValue.ToString())); // uses the query GetFlowerByID and ignores the fact it is an int and converts the selected value to a string

            //write for controls
            txtAdminCustomerFirstname.Text = resultCustomer.Rows[0]["Firstname"].ToString(); // converts the inputed value to a string to put into the table in correct collumn
            txtAdminCustomerLastname.Text = resultCustomer.Rows[0]["Lastname"].ToString(); // converts the inputed value to a string to put into the table in correct collumn
            txtAdminCustomerEmail.Text = resultCustomer.Rows[0]["Email"].ToString(); // converts the inputed value to a string to put into the table in correct collumn
            txtAdminCustomerPassword.Text = resultCustomer.Rows[0]["Password"].ToString(); // converts the inputed value to a string to put into the table in correct collumn

            



        }

        protected void btnUpdateCustomer_Click(object sender, EventArgs e)
        {

            FastTrackDSTableAdapters.customerTableAdapter customerTable = new FastTrackDSTableAdapters.customerTableAdapter();



            // checks if values are inputted
            if (string.IsNullOrEmpty(txtAdminCustomerFirstname.Text) || string.IsNullOrEmpty(txtAdminCustomerLastname.Text) ||  string.IsNullOrEmpty(txtAdminCustomerEmail.Text) || string.IsNullOrEmpty(txtAdminCustomerPassword.Text)) //is the colour text box is not empty then...
            {

                MessageBox.Show("Customer was not updated, please try again!"); // error messaege for user
                Response.Redirect(Request.RawUrl); // goes back to the same page if button is pressed

            }
            else // if it is null then...
            {
                customerTable.UpdateCustomer(txtAdminCustomerFirstname.Text, txtAdminCustomerLastname.Text, txtAdminCustomerEmail.Text, txtAdminCustomerPassword.Text, int.Parse(ddlAdminCustomerID.SelectedValue.ToString()));


                MessageBox.Show("You have successfully updated a customer."); // message for the user that the record has been successfully updated

                Response.Redirect(Request.RawUrl);
                // Redirects the user to page 


            }





        }

        protected void btnDeleteCustomer_Click(object sender, EventArgs e)
        {

            FastTrackDSTableAdapters.customerTableAdapter customerTable = new FastTrackDSTableAdapters.customerTableAdapter();
            // checks if value is inputted
            if (ddlAdminCustomerID != null)
            {

                customerTable.DeleteCustomer(int.Parse(ddlAdminCustomerID.SelectedValue.ToString())); // deletes row based on ID

                MessageBox.Show("You have successfully deleted a customer."); // message for the user that the record has been successfully updated

                Response.Redirect(Request.RawUrl);
                // Redirects the user to page 

               
            }
            else // if it is null then...
            {
                MessageBox.Show("Customer was not deleted, please try again!"); // error messaege for user
                Response.Redirect(Request.RawUrl); // goes back to the same page if button is pressed

            }


        }
    }
}