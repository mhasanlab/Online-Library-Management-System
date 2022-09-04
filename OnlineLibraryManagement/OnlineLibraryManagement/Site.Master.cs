using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineLibraryManagement
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"].Equals(""))
                {
                    
                    lnkUserLogin.Visible = true;
                    lnkSignUp.Visible = true;
                    lnkViewBook.Visible = false;
                    lnkLogout.Visible = false;
                    lnkHelloUser.Visible = false;

                    //Admin Button

                    lnkAdminLogin.Visible = true;
                    lnkAutherManagement.Visible = false;
                    lnkPublisherManagement.Visible = false;
                    lnkBookInventory.Visible = false;
                    lnkBookIssuing.Visible = false;
                    lnkMemberManagement.Visible = false;
                    lnkCatagoryManagement.Visible = false;
                }
                else if (Session["role"].Equals("user"))
                {
                    lnkUserLogin.Visible = false;
                    lnkSignUp.Visible = false;
                    lnkViewBook.Visible = true;
                    lnkLogout.Visible = true;
                    lnkHelloUser.Visible = true;

                    lnkHelloUser.Text = "Hello, " + Session["Full_Name"].ToString();

                    //Admin Button

                    lnkAdminLogin.Visible = true;
                    lnkAutherManagement.Visible = false;
                    lnkPublisherManagement.Visible = false;
                    lnkBookInventory.Visible = false;
                    lnkBookIssuing.Visible = false;
                    lnkMemberManagement.Visible = false;
                    lnkCatagoryManagement.Visible = false;
                }

                else if (Session["role"].Equals("admin"))
                {
                    lnkUserLogin.Visible = false;
                    lnkSignUp.Visible = false;
                    lnkViewBook.Visible = true;
                    lnkLogout.Visible = true;
                    lnkHelloUser.Visible = true;

                    lnkHelloUser.Text = "Hello Admin";

                    //Admin Button

                    lnkAdminLogin.Visible = false;
                    lnkAutherManagement.Visible = true;
                    lnkPublisherManagement.Visible = true;
                    lnkBookInventory.Visible = true;
                    lnkBookIssuing.Visible = true;
                    lnkMemberManagement.Visible = true;
                    lnkCatagoryManagement.Visible = true;
                }

            }
            catch
            {

               
            }


        }

        protected void lnkUserLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("userlogin.aspx");
        }

        protected void lnkSignUp_Click(object sender, EventArgs e)
        {
            Response.Redirect("usersignup.aspx");
        }

        protected void lnkAdminLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminlogin.aspx");
        }

        protected void lnkAutherManagement_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminauthormanagement.aspx");
        }

        protected void lnkPublisherManagement_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminpublishermanagement.aspx");
        }

        protected void lnkCatagoryManagement_Click(object sender, EventArgs e)
        {
            Response.Redirect("addnewcategory.aspx");
        }
        protected void lnkBookInventory_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminbookinventory.aspx");
        }

        protected void lnkBookIssuing_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminbookissuing.aspx");
        }

        protected void lnkMemberManagement_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminmembermanagement.aspx");
        }

        protected void lnkViewBook_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewbooks.aspx");
        }

        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            Session["Member_ID"] = "";
            Session["Full_Name"] = "";
            Session["role"] = "";
            Session["Account_Status"] = "";

            // comming back to default

            lnkUserLogin.Visible = true;
            lnkSignUp.Visible = true;
            lnkViewBook.Visible = false;
            lnkLogout.Visible = false;
            lnkHelloUser.Visible = false;

            //Admin Button

            lnkAdminLogin.Visible = true;
            lnkAutherManagement.Visible = false;
            lnkPublisherManagement.Visible = false;
            lnkBookInventory.Visible = false;
            lnkBookIssuing.Visible = false;
            lnkMemberManagement.Visible = false;
            lnkCatagoryManagement.Visible = false;

        }

        
    }
}