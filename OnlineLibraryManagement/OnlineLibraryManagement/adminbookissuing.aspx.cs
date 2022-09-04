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
    public partial class adminbookissuing : System.Web.UI.Page
    {

        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            grdIssuedBookList.DataBind();
        }

        // go
        protected void btnSearchBookMemberId_Click(object sender, EventArgs e)
        {
            GetNames();
        }


        // issue
        protected void btnIssueBook_Click(object sender, EventArgs e)
        {
            if (CheckIfBookExist() && CheckIfMemberExist())
            {

                if (CheckIfIssueEntryExist())
                {
                    Response.Write("<script>alert('This Member already has this book');</script>");
                }
                else
                {
                    issueBook();
                }

            }
            else
            {
                Response.Write("<script>alert('Wrong Book ID or Member ID');</script>");
            }
        }

        // return
        protected void btnReturnBook_Click(object sender, EventArgs e)
        {
            if (CheckIfBookExist() && CheckIfMemberExist())
            {

                if (CheckIfIssueEntryExist())
                {
                    returnBook();
                }
                else
                {
                    Response.Write("<script>alert('This Entry does not exist');</script>");
                }

            }
            else
            {
                Response.Write("<script>alert('Wrong Book ID or Member ID');</script>");
            }
        }


        // custom function


        bool CheckIfMemberExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT Full_Name FROM tblLibraryMember WHERE Member_ID='" + txtBookIssueMemberId.Text.Trim() + "'", con);
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
                return false;
            }

        }


        bool CheckIfBookExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT Book_Name FROM tblBookDetails WHERE Book_ID='" + txtBookissueBookId.Text.Trim() + "' AND Current_Stock >0", con);
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
                return false;
            }

        }


        bool CheckIfIssueEntryExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM tblBookIssue WHERE Member_ID='" + txtBookIssueMemberId.Text.Trim() + "' AND Book_ID='" + txtBookissueBookId.Text.Trim() + "'", con);
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
                return false;
            }

        }

        void issueBook()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO tblBookIssue(Member_ID,Member_Name,Book_ID,Book_Name,Issue_Date,Return_Date) values(@Member_ID,@Member_Name,@Book_ID,@Book_Name,@Issue_Date,@Return_Date)", con);

                cmd.Parameters.AddWithValue("@Member_ID", txtBookIssueMemberId.Text.Trim());
                cmd.Parameters.AddWithValue("@Member_Name", txtBookissueBookName.Text.Trim());
                cmd.Parameters.AddWithValue("@Book_ID", txtBookissueBookId.Text.Trim());
                cmd.Parameters.AddWithValue("@Book_Name", txtBookissueBookName.Text.Trim());
                cmd.Parameters.AddWithValue("@Issue_Date", txtBookIssueStartDate.Text.Trim());
                cmd.Parameters.AddWithValue("@Return_Date", txtBookIssueReturnDate.Text.Trim());

                cmd.ExecuteNonQuery();

                cmd = new SqlCommand("update  tblBookDetails set Current_Stock = Current_Stock-1 WHERE Book_ID='" + txtBookissueBookId.Text.Trim() + "'", con);

                cmd.ExecuteNonQuery();

                con.Close();
                Response.Write("<script>alert('Book Issued Successfully');</script>");

                grdIssuedBookList.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }


        // return book


        void returnBook()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }


                SqlCommand cmd = new SqlCommand("Delete FROM tblBookIssue WHERE Book_ID='" + txtBookissueBookId.Text.Trim() + "' AND Member_ID='" + txtBookIssueMemberId.Text.Trim() + "'", con);
                int result = cmd.ExecuteNonQuery();

                if (result > 0)
                {

                    cmd = new SqlCommand("update tblBookDetails set Current_Stock = Current_Stock+1 WHERE Book_ID='" + txtBookissueBookId.Text.Trim() + "'", con);
                    cmd.ExecuteNonQuery();
                    con.Close();

                    Response.Write("<script>alert('Book Returned Successfully');</script>");
                    grdIssuedBookList.DataBind();

                    con.Close();

                }
                else
                {
                    Response.Write("<script>alert('Error - Invalid details');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void GetNames()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT Book_Name FROM tblBookDetails WHERE Book_ID='" + txtBookissueBookId.Text.Trim() + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    txtBookissueBookName.Text = dt.Rows[0]["Book_Name"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Wrong Book ID');</script>");
                }

                cmd = new SqlCommand("SELECT Full_Name FROM tblLibraryMember WHERE Member_ID='" + txtBookIssueMemberId.Text.Trim() + "'", con);
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    txtBookissueMemberName.Text = dt.Rows[0]["Full_Name"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Wrong User ID');</script>");
                }


            }
            catch (Exception ex)
            {

            }
        }

        protected void grdIssuedBookList_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}