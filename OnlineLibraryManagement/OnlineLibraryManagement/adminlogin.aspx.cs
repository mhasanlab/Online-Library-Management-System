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
    public partial class adminlogin : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM tblAdminLogin WHERE  Admin_Username='" + txtAdminId.Text.Trim() + "' AND Admin_PassWord= '" + txtAdminPassword.Text.Trim() + "' ", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        //Response.Write("<script>alert('Successful login as Admin');</script>");

                        Session["Admin_Username"] = dr.GetValue(0).ToString();
                        Session[" Admin_Fullname"] = dr.GetValue(2).ToString();
                        Session["role"] = "admin";
                        //Session["Account_Status"] = dr.GetValue(10).ToString();


                    }
                    Response.Redirect("homepage.aspx");
                }
                else
                {
                    this.AdminsignInNotValid.Visible = true;
                }
            }
            catch
            {

            }
        }
    }
}