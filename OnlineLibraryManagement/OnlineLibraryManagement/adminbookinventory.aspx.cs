using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineLibraryManagement
{
    public partial class adminbookinventory : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        static string global_filepath;
        static int global_actual_stock, global_current_stock, global_issued_books;
        protected void Page_Load(object sender, EventArgs e)
        {
            //FillAuthorPublisherValues();
            grdAdminBookInventoryList.DataBind();
        }

        // Add Book
        protected void btnAdminInsertBookInventry_Click(object sender, EventArgs e)
        {
            if (CheckIfBookExists())
            {
                Response.Write("<script>alert('Book Already Exists, try some other Book ID');</script>");
            }
            else
            {
                AddNewBook();
            }
        }


        // Update Book
        protected void btnAdminUpdateBookInventry_Click(object sender, EventArgs e)
        {
            UpdateBookByID();
        }

        // Delete Book
        protected void btnAdminDeleteBookInventry_Click(object sender, EventArgs e)
        {
            DeleteBookByID();
        }

        // Search Book
        protected void linkbtnSearchBookMemberId_Click(object sender, EventArgs e)
        {
            GetBookByID();
        }

        // Custome Functions

        void GetBookByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM tblBookDetails WHERE Book_ID='" + txtAdminBookInventoryBookId.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    txtBookInventoryBookName.Text = dt.Rows[0]["Book_Name"].ToString();
                    txtAdminBookInventoryBookPublishDate.Text = dt.Rows[0]["Publish_Date"].ToString();
                    txtAdminBookInventoryBookEdition.Text = dt.Rows[0]["Book_Edition"].ToString();
                    txtAdminBookInventoryBookCost.Text = dt.Rows[0]["Book_Cost"].ToString().Trim();
                    txtAdminBookInventoryBookPages.Text = dt.Rows[0]["Book_Pages"].ToString().Trim();
                    txtAdminBookInventoryActualStock.Text = dt.Rows[0]["Actual_Stock"].ToString().Trim();
                    txtAdminBookInventoryCurrentStock.Text = dt.Rows[0]["Current_Stock"].ToString().Trim();
                    txtAdminBookInventoryBookDescription.Text = dt.Rows[0]["Book_Description"].ToString();
                    txtAdminBookInventoryIssuedBooks.Text = "" + (Convert.ToInt32(dt.Rows[0]["Actual_Stock"].ToString()) - Convert.ToInt32(dt.Rows[0]["Current_Stock"].ToString()));

                    ddlAdminBookInventoryLanguage.SelectedValue = dt.Rows[0]["Book_Language"].ToString().Trim();
                    ddlAdminBookInventoryPublisher.SelectedValue = dt.Rows[0]["Book_Publisher"].ToString().Trim();
                    ddlAdminBookInventoryAuthor.SelectedValue = dt.Rows[0]["Book_Author"].ToString().Trim();

                    libAdminBookInventoryBookGenre.ClearSelection();
                    string[] category = dt.Rows[0]["Category_Name"].ToString().Trim().Split(',');
                    for (int i = 0; i < category.Length; i++)
                    {
                        for (int j = 0; j < libAdminBookInventoryBookGenre.Items.Count; j++)
                        {
                            if (libAdminBookInventoryBookGenre.Items[j].ToString() == category[i])
                            {
                                libAdminBookInventoryBookGenre.Items[j].Selected = true;

                            }
                        }
                    }

                    global_actual_stock = Convert.ToInt32(dt.Rows[0]["Actual_Stock"].ToString().Trim());
                    global_current_stock = Convert.ToInt32(dt.Rows[0]["Current_Stock"].ToString().Trim());
                    global_issued_books = global_actual_stock - global_current_stock;
                    global_filepath = dt.Rows[0]["Book_Img"].ToString();

                }
                else
                {
                    Response.Write("<script>alert('Invalid Book ID');</script>");
                }

            }
            catch (Exception ex)
            {

            }
        }



        void UpdateBookByID()
        {

            if (CheckIfBookExists())
            {
                try
                {

                    int Actual_Stock = Convert.ToInt32(txtAdminBookInventoryActualStock.Text.Trim());
                    int Current_Stock = Convert.ToInt32(txtAdminBookInventoryCurrentStock.Text.Trim());

                    if (global_actual_stock == Actual_Stock)
                    {

                    }
                    else
                    {
                        if (Actual_Stock < global_issued_books)
                        {
                            Response.Write("<script>alert('Actual Stock value cannot be less than the Issued books');</script>");
                            return;
                        }
                        else
                        {
                            Actual_Stock = Actual_Stock - global_issued_books;
                            txtAdminBookInventoryIssuedBooks.Text = "" + Current_Stock;
                        }
                    }

                    string genres = "";
                    foreach (int i in libAdminBookInventoryBookGenre.GetSelectedIndices())
                    {
                        genres = genres + libAdminBookInventoryBookGenre.Items[i] + ",";
                    }
                    genres = genres.Remove(genres.Length - 1);

                    string filepath = "~/book_inventory/books1";
                    string filename = Path.GetFileName(adminBookInventoryFileUpload.PostedFile.FileName);
                    if (filename == "" || filename == null)
                    {
                        filepath = global_filepath;

                    }
                    else
                    {
                        adminBookInventoryFileUpload.SaveAs(Server.MapPath("book_inventory/" + filename));
                        filepath = "~/book_inventory/" + filename;
                    }

                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("UPDATE tblBookDetails SET Book_Name=@Book_Name, Category_Name=@Category_Name, Book_Author=@Book_Author, Book_Publisher=@Book_Publisher, Publish_Date=@Publish_Date, Book_Language=@Book_Language, Book_Edition=@Book_Edition, Book_Cost=@Book_Cost, Book_Pages=@Book_Pages, Book_Description=@Book_Description, Actual_Stock=@Actual_Stock, Current_Stock=@Current_Stock, Book_Img=@Book_Img where Book_ID='" + txtAdminBookInventoryBookId.Text.Trim() + "'", con);

                    cmd.Parameters.AddWithValue("@Book_Name", txtBookInventoryBookName.Text.Trim());
                    cmd.Parameters.AddWithValue("@Category_Name", genres);
                    cmd.Parameters.AddWithValue("@Book_Author", ddlAdminBookInventoryAuthor.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@Book_Publisher", ddlAdminBookInventoryPublisher.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@Publish_Date", txtAdminBookInventoryBookPublishDate.Text.Trim());
                    cmd.Parameters.AddWithValue("@Book_Language", ddlAdminBookInventoryLanguage.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@Book_Edition", txtAdminBookInventoryBookEdition.Text.Trim());
                    cmd.Parameters.AddWithValue("@Book_Cost", txtAdminBookInventoryBookCost.Text.Trim());
                    cmd.Parameters.AddWithValue("@Book_Pages", txtAdminBookInventoryBookPages.Text.Trim());
                    cmd.Parameters.AddWithValue("@Book_Description", txtAdminBookInventoryBookDescription.Text.Trim());
                    cmd.Parameters.AddWithValue("@Actual_Stock", txtAdminBookInventoryActualStock.ToString());
                    cmd.Parameters.AddWithValue("@Current_Stock", txtAdminBookInventoryCurrentStock.ToString());
                    cmd.Parameters.AddWithValue("@Book_Img", filepath);


                    cmd.ExecuteNonQuery();
                    con.Close();
                    grdAdminBookInventoryList.DataBind();
                    Response.Write("<script>alert('Book Updated Successfully');</script>");


                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Book ID');</script>");
            }
        }


        void DeleteBookByID()
        {
            if (CheckIfBookExists())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("DELETE from tblBookDetails WHERE Book_ID='" + txtAdminBookInventoryBookId.Text.Trim() + "'", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Book Deleted Successfully');</script>");

                    grdAdminBookInventoryList.DataBind();

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }

            }
            else
            {
                Response.Write("<script>alert('Invalid Member ID');</script>");
            }
        }






        void FillAuthorPublisherValues()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT Author_Name FROM tblBookAuthor;", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                //da.Fill(dt);
                //ddlAdminBookInventoryAuthor.DataSource = dt;
                //ddlAdminBookInventoryAuthor.DataValueField = "Author_Name";
                //ddlAdminBookInventoryAuthor.DataBind();

                cmd = new SqlCommand("SELECT Publisher_Name FROM tblBookPublisher;", con);
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);
                ddlAdminBookInventoryPublisher.DataSource = dt;
                ddlAdminBookInventoryPublisher.DataValueField = "Publisher_Name";
                ddlAdminBookInventoryPublisher.DataBind();

            }
            catch (Exception ex)
            {

            }
        }

        bool CheckIfBookExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM tblBookDetails WHERE Book_ID='" + txtAdminBookInventoryBookId.Text.Trim() + "' OR Book_Name='" + txtBookInventoryBookName.Text.Trim() + "';", con);
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


        void AddNewBook()
        {
            try
            {
                string category = "";
                foreach (int i in libAdminBookInventoryBookGenre.GetSelectedIndices())
                {
                    category = category + libAdminBookInventoryBookGenre.Items[i] + ",";
                }
               
                category = category.Remove(category.Length - 1);

                string filepath = "~/Book_Inventory/books1.png";
                string filename = Path.GetFileName(adminBookInventoryFileUpload.PostedFile.FileName);
                adminBookInventoryFileUpload.SaveAs(Server.MapPath("Book_Inventory/" + filename));
                filepath = "~/Book_Inventory/" + filename;


                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO tblBookDetails(Book_ID,Book_Name,Category_Name,Book_Author,Book_Publisher,Publish_Date,Book_Language,Book_Edition,Book_Cost,Book_Pages,Book_Description,Actual_Stock,Current_Stock,Book_Img) values(@Book_ID,@Book_Name,@Category_Name,@Book_Author,@Book_Publisher,@Publish_Date,@Book_Language,@Book_Edition,@Book_Cost,@Book_Pages,@Book_Description,@Actual_Stock,@Current_Stock,@Book_Img)", con);

                cmd.Parameters.AddWithValue("@Book_ID", txtAdminBookInventoryBookId.Text.Trim());
                cmd.Parameters.AddWithValue("@Book_Name", txtBookInventoryBookName.Text.Trim());
                cmd.Parameters.AddWithValue("@Category_Name", category);
                cmd.Parameters.AddWithValue("@Book_Author", ddlAdminBookInventoryAuthor.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Book_Publisher", ddlAdminBookInventoryPublisher.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Publish_Date", txtAdminBookInventoryBookPublishDate.Text.Trim());
                cmd.Parameters.AddWithValue("@Book_Language", ddlAdminBookInventoryLanguage.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Book_Edition", txtAdminBookInventoryBookEdition.Text.Trim());
                cmd.Parameters.AddWithValue("@Book_Cost", txtAdminBookInventoryBookCost.Text.Trim());
                cmd.Parameters.AddWithValue("@Book_Pages", txtAdminBookInventoryBookPages.Text.Trim());
                cmd.Parameters.AddWithValue("@Book_Description", txtAdminBookInventoryBookDescription.Text.Trim());
                cmd.Parameters.AddWithValue("@Actual_Stock", txtAdminBookInventoryActualStock.Text.Trim());
                cmd.Parameters.AddWithValue("@Current_Stock", txtAdminBookInventoryActualStock.Text.Trim());
                cmd.Parameters.AddWithValue("@Book_Img", filepath);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Book added successfully.');</script>");
                grdAdminBookInventoryList.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }








        protected void grdAdminBookInventoryList_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}