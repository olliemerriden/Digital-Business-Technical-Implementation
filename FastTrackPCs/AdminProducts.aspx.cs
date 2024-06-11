using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace FastTrackPCs
{
    public partial class AdminProducts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            FastTrackDSTableAdapters.productsTableAdapter productsTable = new FastTrackDSTableAdapters.productsTableAdapter();
            gvProducts.DataSource = productsTable.GetAllProducts(); // data source is all products
            gvProducts.DataBind(); // bind data

            if (!IsPostBack)
            {

                //FastTrackDSTableAdapters.productsTableAdapter productsTable = new FastTrackDSTableAdapters.productsTableAdapter();
                


                    ddlAdminProductID.DataSource = productsTable.GetProductID(); // populates ID based on query
                    ddlAdminProductID.DataTextField = "ProductID"; // assigns value
                    ddlAdminProductID.DataValueField = "ProductID"; // assigns value
                ddlAdminProductID.DataBind();// binds data

                


                ddlFilterCpu.DataSource = productsTable.GetShopCpu(); // populates CPU based on query
                ddlFilterCpu.DataTextField = "ComputerCpu"; // assigns value
                ddlFilterCpu.DataValueField = "ComputerCpu"; // assigns value
                ddlFilterCpu.DataBind(); // binds data

                ddlFilterRam.DataSource = productsTable.GetShopRam(); // populates RAM based on query
                ddlFilterRam.DataTextField = "ComputerRam"; // assigns value
                ddlFilterRam.DataValueField = "ComputerRam"; // assigns value
                ddlFilterRam.DataBind(); // binds data





            }

        }

        protected void btnAdminReset_Click(object sender, EventArgs e)
        {

            FastTrackDSTableAdapters.productsTableAdapter productsTable = new FastTrackDSTableAdapters.productsTableAdapter();
            gvProducts.DataSource = productsTable.GetAllProducts(); // gets all products
            gvProducts.DataBind(); // binds data


        }

        protected void btnAdminRefresh_Click(object sender, EventArgs e)
        {

            FastTrackDSTableAdapters.productsTableAdapter productsTable = new FastTrackDSTableAdapters.productsTableAdapter();


            if (ddlSortPrice.SelectedValue.ToString() == "Ascending") //if the selected sort value is ascending then...
            {
                gvProducts.DataSource = productsTable.GetAdminProductsAsc(ddlFilterCpu.SelectedValue, ddlFilterRam.SelectedValue); // retrives the query that puts the price in ascending order



            }
            else // if the selected value is not ascending (descending) 
            {
                gvProducts.DataSource = productsTable.GetAdminProductsDesc(ddlFilterCpu.SelectedValue, ddlFilterRam.SelectedValue); // retrives the query that puts the price in ascending order
            }
            gvProducts.DataBind(); // binds all the data together and brings it closed


        }

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {

            FastTrackDSTableAdapters.productsTableAdapter productsTable = new FastTrackDSTableAdapters.productsTableAdapter();

            // checks if values are inputted
            if (string.IsNullOrEmpty(txtAdminProductName.Text) || string.IsNullOrEmpty(txtAdminProductDesc.Text) || string.IsNullOrEmpty(txtAdminProductPrice.Text) || string.IsNullOrEmpty(txtAdminProductCpu.Text) || string.IsNullOrEmpty(txtAdminProductRam.Text) || string.IsNullOrEmpty(txtAdminProductGraphics.Text) || string.IsNullOrEmpty(txtAdminProductStorage.Text) || string.IsNullOrEmpty(txtAdminProductCase.Text) || string.IsNullOrEmpty(txtAdminProductImage.Text) ) //is the colour text box is not empty then...
            {
                MessageBox.Show("Product was not created, please try again!"); // error messaege for user
                Response.Redirect(Request.RawUrl); // goes back to the same page if button is pressed



            }
            else // if it is null then...
            {
                
                productsTable.CreateNewProduct(txtAdminProductName.Text, txtAdminProductDesc.Text, decimal.Parse(txtAdminProductPrice.Text), txtAdminProductCpu.Text, txtAdminProductRam.Text, txtAdminProductGraphics.Text, txtAdminProductStorage.Text, txtAdminProductCase.Text, txtAdminProductImage.Text); //inserts the correct values into the table using the InsertFlower query

                MessageBox.Show("You have successfully created a Product."); // message for the user to say succesfully created record
                Response.Redirect(Request.RawUrl); // goes back to the same page if button is pressed



            }




        }

        protected void btnRetrieveProduct_Click(object sender, EventArgs e)
        {


            FastTrackDSTableAdapters.productsTableAdapter productsTable = new FastTrackDSTableAdapters.productsTableAdapter();




            //get query result into data table
            DataTable resultProducts = new DataTable(); // gives the data table the name resultFlower, and gives a new instance of it
            resultProducts = productsTable.GetAllProductsID(int.Parse(ddlAdminProductID.SelectedValue.ToString())); // uses the query GetFlowerByID and ignores the fact it is an int and converts the selected value to a string

            //write for controls
            txtAdminProductName.Text = resultProducts.Rows[0]["ComputerName"].ToString(); // converts the inputed value to a string to put into the table in correct collumn
            txtAdminProductDesc.Text = resultProducts.Rows[0]["ComputerDesc"].ToString(); // converts the inputed value to a string to put into the table in correct collumn
            
            
            txtAdminProductPrice.Text = resultProducts.Rows[0]["ComputerPrice"].ToString(); // converts the inputed value to a string to put into the table in correct collumn

            txtAdminProductCpu.Text = resultProducts.Rows[0]["ComputerCpu"].ToString(); // converts the inputed value to a string to put into the table in correct collumn
            txtAdminProductRam.Text = resultProducts.Rows[0]["ComputerRam"].ToString(); // converts the inputed value to a string to put into the table in correct collumn
            txtAdminProductGraphics.Text = resultProducts.Rows[0]["ComputerGraphics"].ToString(); // converts the inputed value to a string to put into the table in correct collumn
            txtAdminProductStorage.Text = resultProducts.Rows[0]["ComputerStorage"].ToString(); // converts the inputed value to a string to put into the table in correct collumn
            txtAdminProductCase.Text = resultProducts.Rows[0]["ComputerCase"].ToString(); // converts the inputed value to a string to put into the table in correct collumn
            txtAdminProductImage.Text = resultProducts.Rows[0]["ComputerImage"].ToString(); // converts the inputed value to a string to put into the table in correct collumn





        }

        protected void btnUpdateProduct_Click(object sender, EventArgs e)
        {
            FastTrackDSTableAdapters.productsTableAdapter productsTable = new FastTrackDSTableAdapters.productsTableAdapter();


            // checks if values are inputted
            if (string.IsNullOrEmpty(txtAdminProductName.Text) || string.IsNullOrEmpty(txtAdminProductDesc.Text) || string.IsNullOrEmpty(txtAdminProductPrice.Text) || string.IsNullOrEmpty(txtAdminProductCpu.Text) || string.IsNullOrEmpty(txtAdminProductRam.Text) || string.IsNullOrEmpty(txtAdminProductGraphics.Text) || string.IsNullOrEmpty(txtAdminProductStorage.Text) || string.IsNullOrEmpty(txtAdminProductCase.Text) || string.IsNullOrEmpty(txtAdminProductImage.Text)) //is the colour text box is not empty then...
            {
                MessageBox.Show("Product was not updated, please try again!"); // error messaege for user
                Response.Redirect(Request.RawUrl); // goes back to the same page if button is pressed


            }
            else // if it is null then...
            {
               

                productsTable.UpdateProduct(txtAdminProductName.Text, txtAdminProductDesc.Text, decimal.Parse(txtAdminProductPrice.Text), txtAdminProductCpu.Text, txtAdminProductRam.Text, txtAdminProductGraphics.Text, txtAdminProductStorage.Text, txtAdminProductCase.Text, txtAdminProductImage.Text, int.Parse(ddlAdminProductID.SelectedValue.ToString()));

                MessageBox.Show("You have successfully updated a Product."); // message for the user that the record has been successfully updated

                Response.Redirect(Request.RawUrl);
                // Redirects the user to page 

            }


        }

        protected void btnDeleteProduct_Click(object sender, EventArgs e)
        {
            FastTrackDSTableAdapters.productsTableAdapter productsTable = new FastTrackDSTableAdapters.productsTableAdapter();


            if (ddlAdminProductID != null) //is the colour text box is not empty then...
            {

                productsTable.DeleteProduct(int.Parse(ddlAdminProductID.SelectedValue.ToString()));

                MessageBox.Show("You have successfully deleted a Product."); // message for the user that the record has been successfully updated

                Response.Redirect(Request.RawUrl);
                // Redirects the user to page
            }
            else // if it is null then...
            {
                
                
                Response.Redirect(Request.RawUrl);
                // Redirects the user to page
                MessageBox.Show("Product was not deleted, please try again!"); // error messaege for user
                Response.Redirect(Request.RawUrl); // goes back to the same page if button is pressed

            }


        }
    }
}