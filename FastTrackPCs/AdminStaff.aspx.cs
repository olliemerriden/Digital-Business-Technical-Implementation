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
    public partial class AdminStaff : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddStaff_Click(object sender, EventArgs e)
        {
            FastTrackDSTableAdapters.staffloginTableAdapter staffTable = new FastTrackDSTableAdapters.staffloginTableAdapter();

            //checks if values are inputted
            if(string.IsNullOrEmpty(txtAdminStaffUsername.Text) || string.IsNullOrEmpty(txtAdminStaffPassword.Text))
            {

                MessageBox.Show("Staff member was not created, please try again!"); // error messaege for user
                Response.Redirect(Request.RawUrl); // goes back to the same page if button is pressed

            }
            else
            {
                staffTable.InsertNewStaff(txtAdminStaffUsername.Text, txtAdminStaffPassword.Text, DateTime.Now, cbStaffIsActive.Checked);

                MessageBox.Show("You have successfully created a staff member."); // message for the user to say succesfully created record
                Response.Redirect(Request.RawUrl); // goes back to the same page if button is pressed
            }
        }

        protected void btnRetrieveStaff_Click(object sender, EventArgs e)
        {
            FastTrackDSTableAdapters.staffloginTableAdapter staffTable = new FastTrackDSTableAdapters.staffloginTableAdapter();

            

            DataTable resultStaff = new DataTable(); // new data table
            resultStaff = staffTable.GetAllAdminID(int.Parse(ddlStaffID.SelectedValue.ToString())); // gets stafff by ID

            txtAdminStaffUsername.Text = resultStaff.Rows[0]["StaffLoginUsername"].ToString(); // assigns control
            txtAdminStaffPassword.Text = resultStaff.Rows[0]["StaffLoginPassword"].ToString(); // assigns control

            if (bool.Parse(resultStaff.Rows[0]["IsActive"].ToString()) == true) // checks if data base value is 'true'
            {
                cbStaffIsActive.Checked = true; // set to ticked
            }
            else
            {
                cbStaffIsActive.Checked = false; // not ticked
            }

        }

        protected void btnUpdateStaff_Click(object sender, EventArgs e)
        {
            FastTrackDSTableAdapters.staffloginTableAdapter staffTable = new FastTrackDSTableAdapters.staffloginTableAdapter();
            //checks if values are inputted
            if (string.IsNullOrEmpty(txtAdminStaffUsername.Text) || string.IsNullOrEmpty(txtAdminStaffPassword.Text))
            {

                MessageBox.Show("Staff member was not updated, please try again!"); // error messaege for user
                Response.Redirect(Request.RawUrl); // goes back to the same page if button is pressed

            }
            else // if it is null then...
            {
                staffTable.UpdateStaff(txtAdminStaffUsername.Text, txtAdminStaffPassword.Text, cbStaffIsActive.Checked, int.Parse(ddlStaffID.SelectedValue.ToString()));

                MessageBox.Show("You have successfully updated a staff member."); // message for the user that the record has been successfully updated

                Response.Redirect(Request.RawUrl);
                // Redirects the user to page 


            }
        }

        protected void btnDeleteStaff_Click(object sender, EventArgs e)
        {
            FastTrackDSTableAdapters.staffloginTableAdapter staffTable = new FastTrackDSTableAdapters.staffloginTableAdapter();
            // checks if ID is null
            if (ddlStaffID != null)
            {

                staffTable.DeleteStaff(int.Parse(ddlStaffID.SelectedValue.ToString())); // deletes row based on ID

                MessageBox.Show("You have successfully deleted a staff member."); // message for the user that the record has been successfully updated

                Response.Redirect(Request.RawUrl);
                // Redirects the user to page 


            }
            else // if it is null then...
            {
                MessageBox.Show("Staff member was not deleted, please try again!"); // error messaege for user
                Response.Redirect(Request.RawUrl); // goes back to the same page if button is pressed

            }

        }
    }
}