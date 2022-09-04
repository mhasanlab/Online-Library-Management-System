using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineLibraryManagement
{
    public partial class adminbookcatagory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           

        }

        protected void frmAddnewCategory_PageIndexChanging(object sender, FormViewPageEventArgs e)
        {
            //CatagoryView.DataBind();
            //frmAddnewCategory.DataBind();
            //dsCategoryView.DataBind();
            

        }

        protected void CatagoryView_SelectedIndexChanged(object sender, EventArgs e)
        {
            //CatagoryView.DataBind();
            //frmAddnewCategory.DataBind();
            //dsCategoryView.DataBind();
        }
    }
}