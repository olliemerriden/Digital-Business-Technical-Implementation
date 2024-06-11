using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using System.Windows.Forms;

using static System.Windows.Forms.VisualStyles.VisualStyleElement.ListView;

namespace FastTrackPCs
{
    public partial class Shop : System.Web.UI.Page
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


            if (!IsPostBack)
            {

            FastTrackDSTableAdapters.productsTableAdapter productsTable = new FastTrackDSTableAdapters.productsTableAdapter();
            dlProducts.DataSource = productsTable.GetAllProducts(); // changes data list soruce to a query
            dlProducts.DataBind(); // binds data



                ddlFilterCpu.DataSource = productsTable.GetShopCpu(); // ddl data soruce based on query
                ddlFilterCpu.DataTextField = "ComputerCpu"; // asigns value
                ddlFilterCpu.DataValueField = "ComputerCpu"; //assigns value
            ddlFilterCpu.DataBind(); // binds data


            ddlFilterRam.DataSource = productsTable.GetShopRam(); // ddl data soruce based on query
            ddlFilterRam.DataTextField = "ComputerRam"; // assigns value
            ddlFilterRam.DataValueField = "ComputerRam";// assings value
            ddlFilterRam.DataBind(); //binds data

            }

            if (!IsPostBack && Session["Basket"] == null) // session is nul
            {
                Session["SessionID"] = Guid.NewGuid().ToString(); // creates new session ID
                Session["Basket"] = null; // basket set to null
            }
            else
            {
                basket = (List<BasketItem>)Session["Basket"]; // stores list items in basket
                UpdateMaster();
            }



        }

        protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void sdsProducts_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            FastTrackDSTableAdapters.productsTableAdapter productsTable = new FastTrackDSTableAdapters.productsTableAdapter();
            dlProducts.DataSource = productsTable.GetAllProducts(); // changes data soruce to get all products
            dlProducts.DataBind(); // data bind
            txtSearch.Text = string.Empty; // changes search to be empty

        }

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            FastTrackDSTableAdapters.productsTableAdapter productsTable = new FastTrackDSTableAdapters.productsTableAdapter();

            

            if (ddlSortPrice.SelectedValue.ToString() == "Ascending") //if the selected sort value is ascending then...
            {
                dlProducts.DataSource = productsTable.GetProductByCpuAndRamSortByAsc(ddlFilterCpu.SelectedValue, ddlFilterRam.SelectedValue, txtSearch.Text); // retrives the query that puts the price in ascending order


            }
            else // if the selected value is not ascending (descending) 
            {

                dlProducts.DataSource = productsTable.GetProductByCpuAndRamSortByDesc(ddlFilterCpu.SelectedValue, ddlFilterRam.SelectedValue, txtSearch.Text); // retrives the query that puts the price in ascending order
            }
            dlProducts.DataBind(); // binds all the data together and brings it closed

            
        }

        protected void dlShop_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddlFilterRam_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        

        protected void dlProducts_ItemCommand(object source, DataListCommandEventArgs e)
        {
            

            if (e.CommandName == "ProductID" ) // if command name is productID
            {
                int productID = Convert.ToInt32(e.CommandArgument);// gets product ID


                // gets item from database based on product ID
                FastTrackDSTableAdapters.productsTableAdapter product = new FastTrackDSTableAdapters.productsTableAdapter();
                FastTrackDS.productsDataTable row = product.GetProductByID(productID); //based on row


                if (row != null && row.Count > 0 ) // if count is more than 0
                {
                    imgDetails.ImageUrl = "img/" + row[0]["ComputerImage"].ToString(); //assign value
                    lblProductName.Text = row[0]["ComputerName"].ToString(); //assign value
                    lblProductDesc.Text = row[0]["ComputerDesc"].ToString(); //assign value
                    lblUnitPrice.Text = row[0]["ComputerPrice"].ToString(); //assign value
                    txtQuantity.Text = "1"; // default ammount
                    lblTotalAmount.Text = lblUnitPrice.Text; //assign value
                    hfProductID.Value = e.CommandArgument.ToString(); // stores hf
                    mvShopPage.SetActiveView(vProductDetails); // sets new view
                }
            }


        }


        protected void btnViewDetails_Click(object sender, EventArgs e)
        {
            
        }

        protected void btnCalculate_Click(object sender, EventArgs e)
        {
            if (lblUnitPrice.Text != "") // not empty
            {
                lblTotalAmount.Text = (Convert.ToDouble(lblUnitPrice.Text) * Convert.ToDouble(txtQuantity.Text)).ToString(); // gets value based on price * quantity
            }
        }

        protected void lbGoToCatalogue_Click(object sender, EventArgs e)
        {
            mvShopPage.SetActiveView(vShop); // sets view to shop
        }

        protected void btnAddToBasket_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt32(txtQuantity.Text) >= 1) // if quantity is equal or greater than 1
            {
                BasketItem item = new BasketItem(); // new instance of basket item
                item.SessionID = Session["SessionID"].ToString(); // stores session
                item.ProductID = Convert.ToInt32(hfProductID.Value); // assing value based on hf
                item.ProductName = lblProductName.Text; //assign value
                item.Quantity = Convert.ToInt32(txtQuantity.Text); //assign value
                item.ProductPrice = float.Parse(lblUnitPrice.Text); //assign value
                item.Amount = item.ProductPrice * item.Quantity; //assign value based on price * quantity

                if (basket == null) // if basket is null
                    basket = new List<BasketItem>(); // create new list
                else
                {
                    foreach (BasketItem basketItem in basket) // for every basket item
                    {
                        if (basketItem.ProductID == item.ProductID) // assing based on product ID
                        {
                            basket.Remove(basketItem); //remove basket item
                            break;
                        }
                    }
                }

                txtQuantity.Text = "1"; //assign value

                basket.Add(item); // add item
                Session["Basket"] = basket; // store session based on basket

                UpdateMaster();
            }

        
    }

        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            //Response.Redirect("Cart.aspx");
            if (basket == null) // if null
            {
                lblBasketCheck.Text = "You must add an item to the basket before procceding."; // changes message
            }
            else
            {
                Response.Redirect("Cart.aspx"); // go to cart page
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            FastTrackDSTableAdapters.productsTableAdapter shop = new FastTrackDSTableAdapters.productsTableAdapter();
            FastTrackDS.productsDataTable result = new FastTrackDS.productsDataTable(); // data table based on search



            if (txtSearch.Text.Trim() == "") // if search is nothing
            {
                dlProducts.DataSource = shop.GetFullShop(); // gets full shop
            }
            else
            {
                dlProducts.DataSource= shop.GetSpecificShop(txtSearch.Text); // get shop by search 
            }
            dlProducts.DataSourceID = null; // nulls data source
            dlProducts.DataBind(); // binds data
        }
    }
}