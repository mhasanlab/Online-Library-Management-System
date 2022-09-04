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
    public partial class adminmembermanagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            grdAdminManageMemberList.DataBind();
        }

        // Load Member Data
        protected void linkbtnSearchBookMemberId_Click(object sender, EventArgs e)
        {
            GetMemberByID();
        }

        // Active Member
        protected void linkbtnAdminAccountActive_Click(object sender, EventArgs e)
        {
            UpdateMemberStatusByID("Active");
        }

        // Pending Member
        protected void linkbtnAdminAccountPending_Click(object sender, EventArgs e)
        {
            UpdateMemberStatusByID("Pending");
        }

        // Deactive Member
        protected void linkbtnAdminAccountDactive_Click(object sender, EventArgs e)
        {
            UpdateMemberStatusByID("Deactive");
        }

        // Delete Member
        protected void btnAdminMemberPermanentDelete_Click(object sender, EventArgs e)
        {
            DeleteMemberByID();
        }

        // user defined function

        bool CheckIfMemberExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM tblLibraryMember WHERE Member_ID='" + txtViewBookId.Text.Trim() + "';", con);
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
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }

        void DeleteMemberByID()
        {
            if (CheckIfMemberExists())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("DELETE FROM tblLibraryMember WHERE Member_ID='" + txtViewBookId.Text.Trim() + "'", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    //Message
                    this.MemberStatusUpdated.Visible = false;
                    this.MemberDeleted.Visible = true;
                    this.MemberIdNotValid.Visible = false;
                    ClearForm();
                    grdAdminManageMemberList.DataBind();

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }

            }
            else
            {
                //Message
                this.MemberStatusUpdated.Visible = false;
                this.MemberDeleted.Visible = false;
                this.MemberIdNotValid.Visible = true;
            }
        }

        void GetMemberByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM tblLibraryMember WHERE Member_ID='" + txtViewBookId.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        txtAdminAccountStatus.Text = dr.GetValue(0).ToString();
                        txtAminMamberFullName.Text = dr.GetValue(10).ToString();
                        txtAdminMemberDOB.Text = dr.GetValue(1).ToString();
                        txtAdminMemberContact.Text = dr.GetValue(2).ToString();
                        txtAdminMemberEmail.Text = dr.GetValue(3).ToString();
                        txtAdminMemberDistrict.Text = dr.GetValue(4).ToString();
                        txtAdminMemberCity.Text = dr.GetValue(5).ToString();
                        txtAdminMemberZipCode.Text = dr.GetValue(6).ToString();
                        txtAdminMemberAddress.Text = dr.GetValue(7).ToString();

                    }

                }
                else
                {
                    //Message
                    this.MemberStatusUpdated.Visible = false;
                    this.MemberDeleted.Visible = false;
                    this.MemberIdNotValid.Visible = true;
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        // Update Member Status
        void UpdateMemberStatusByID(string status)
        {
            if (CheckIfMemberExists())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();

                    }
                    SqlCommand cmd = new SqlCommand("UPDATE tblLibraryMember SET Account_Status='" + status + "' WHERE Member_ID='" + txtViewBookId.Text.Trim() + "'", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    grdAdminManageMemberList.DataBind();
                    //Message
                    this.MemberStatusUpdated.Visible = true;
                    this.MemberDeleted.Visible = false;
                    this.MemberIdNotValid.Visible = false;
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                //Message
                this.MemberStatusUpdated.Visible = false;
                this.MemberDeleted.Visible = false;
                this.MemberIdNotValid.Visible = true;
            }

        }

        void ClearForm()
        {
            txtViewBookId.Text = "";
            txtAdminAccountStatus.Text = "";
            txtAminMamberFullName.Text = "";
            txtAdminMemberDOB.Text = "";
            txtAdminMemberContact.Text = "";
            txtAdminMemberEmail.Text = "";
            txtAdminMemberDistrict.Text = "";
            txtAdminMemberCity.Text = "";
            txtAdminMemberZipCode.Text = "";
            txtAdminMemberAddress.Text = "";
        }

        
    }
}