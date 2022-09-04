using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineLibraryManagement
{
    public partial class usersignup : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // Sign Up button click_Event
        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            
            if (CheckMemberExists())
            {
                this.signUpNotValid.Visible = true;
                this.signUpsuccessAlert.Visible = false;
                this.signUpServerProblemAlert.Visible = false;
            }
            else
            {
                SignUpNewMember();
            }
        }

        bool CheckMemberExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM tblLibraryMember WHERE Member_ID = '" + txtUserId.Text.Trim() + "';", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch
            {
                this.signUpServerProblemAlert.Visible = true;
                this.signUpNotValid.Visible = false;
                this.signUpsuccessAlert.Visible = false;

                return false;
            }
        }

        // Custom Method
        void SignUpNewMember()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO tblLibraryMember (Full_Name,  Member_DOB, Member_Contact, Member_Email,  Member_District, Member_City, Member_Postalcode,  Member_Address, Member_ID, Member_Password, Account_Status) VALUES (@Full_Name, @Member_DOB, @Member_Contact, @Member_Email, @Member_District, @Member_City, @Member_Postalcode,  @Member_Address, @Member_ID, @Member_Password, @Account_Status)", con);

                cmd.Parameters.AddWithValue("@Full_Name", txtFullName.Text.Trim());
                cmd.Parameters.AddWithValue("@Member_DOB", txtDOB.Text.Trim());
                cmd.Parameters.AddWithValue("@Member_Contact", txtContactNumber.Text.Trim());
                cmd.Parameters.AddWithValue("@Member_Email", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@Member_District", txtDistrict.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Member_City", txtCity.Text.Trim());
                cmd.Parameters.AddWithValue("@Member_Postalcode", txtZipCode.Text.Trim());
                cmd.Parameters.AddWithValue("@Member_Address", txtAddress.Text.Trim());
                cmd.Parameters.AddWithValue("@Member_ID", txtUserId.Text.Trim());
                cmd.Parameters.AddWithValue("@Member_Password", txtSetUserPassword.Text.Trim());
                cmd.Parameters.AddWithValue("@Account_Status", "Pending");

                cmd.ExecuteNonQuery();
                con.Close();
                this.signUpsuccessAlert.Visible = true;
                this.signUpNotValid.Visible = false;
                this.signUpServerProblemAlert.Visible = false;
                AllClear();
            }
            catch
            {
                this.signUpServerProblemAlert.Visible = true;
                this.signUpNotValid.Visible = false;
                this.signUpsuccessAlert.Visible = false;
            }
        }

        private void AllClear()
        {
            txtFullName.Text = string.Empty;
            txtDOB.Text = string.Empty;
            txtContactNumber.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtCity.Text = string.Empty;
            txtZipCode.Text = string.Empty;
            txtAddress.Text = string.Empty;
            txtUserId.Text = string.Empty;
        }

    }
}