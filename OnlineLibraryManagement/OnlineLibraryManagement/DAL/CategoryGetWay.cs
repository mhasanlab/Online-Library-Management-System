using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using OnlineLibraryManagement.Models;

namespace OnlineLibraryManagement.DAL
{
    public class CategoryGetWay
    {

        SqlConnection con = new SqlConnection(Connection.GetConnectionString());
        public IQueryable<BookCategory> Get()
        {
            DataTable dt = new DataTable();
            SqlDataAdapter sda = new SqlDataAdapter("SELECT Category_ID, Category_Name FROM tblBookCategory", con);
            sda.Fill(dt);

            return dt.AsEnumerable()
                .Select(r => new BookCategory
                {
                    CategoryId = r.Field<int>("Category_ID"),
                    CategoryName = r.Field<string>("Category_Name")
                }).AsQueryable();
        }

        public void InsertCategory(BookCategory b)
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO tblBookCategory(Category_ID, Category_Name) VALUES(@Category_ID, @Category_Name)", con);
            cmd.Parameters.AddWithValue("@Category_ID", b.CategoryId);
            cmd.Parameters.AddWithValue("@Category_Name", b.CategoryName);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }


        public void UpdateCategory(BookCategory b)
        {
            SqlCommand cmd = new SqlCommand("UPDATE tblBookCategory SET Category_ID =@Category_ID WHERE Category_Name = @Category_Name", con);
            cmd.Parameters.AddWithValue("@Category_ID", b.CategoryId);
            cmd.Parameters.AddWithValue("@Category_Name", b.CategoryName);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }


        public void DeleteCategory(int categoryId)
        {
            SqlCommand cmd = new SqlCommand("DELETE FROM tblBookCategory WHERE Category_ID = @Category_ID", con);
            cmd.Parameters.AddWithValue("@Category_ID", categoryId);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}