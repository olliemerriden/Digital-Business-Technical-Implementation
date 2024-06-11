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
    public partial class StaffLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["staffuser"] != null) //if varible is empty, user has already logged in
            {
                Response.Redirect("AdminHome.aspx"); // take us to admin home page 
            }

            if (!(IsPostBack))
            {
                Session["attemptsReached"] = false; // not reached limit
                ViewState["attempts"] = 3; // store value
                lblAttempts.Text = "You have - 3 attempt(s)"; //assign value
            }

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            FastTrackDSTableAdapters.staffloginTableAdapter staffloginTable = new FastTrackDSTableAdapters.staffloginTableAdapter(); // calls the logintableadapter through the flowerDSTableAdapter with the name loginTable so it can be referenced later on, and gives a new instance of it

            DataTable resultLogin = new DataTable(); // gives the data table the name resultLogin, and gives a new instance of it
            resultLogin = staffloginTable.CheckStaffLogin(txtStaffUsername.Text, txtStaffPassword.Text); //stores the result in resultLogin, calls query to see if the entered values match the values in the table


            //Attempts

            ViewState["attempts"] = int.Parse(ViewState["attempts"].ToString()) - 1; //minus 1 for every attempt

            if (resultLogin.Rows.Count == 0)
            {
                MessageBox.Show("Wrong username and password, please try again.");//display a message to the user
                txtStaffUsername.Text = String.Empty;
                txtStaffPassword.Text = String.Empty;
            }
            else
            {
                MessageBox.Show("You have successfully logged in!"); // displays a message to the user
                Session["staffuser"] = txtStaffUsername.Text; //takes the username value and stores it to put in admin home page
                Response.Redirect("AdminHome.aspx");

            }



            if (int.Parse(ViewState["attempts"].ToString()) <= 0) // if attempts are equal or less than 0
            {
                MessageBox.Show("Too many attempts reached.");//display a message to the user
                Session["attemptsReached"] = true;
                Response.Redirect("Home.aspx");
            }



            lblAttempts.Text = "You have - " + ViewState["attempts"].ToString() + " attempt(s)"; //assign value


        }
    }
}