using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace WebAssignment
{
    public partial class ProductAdd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ArtistID"] != null)
            {
                int artist = int.Parse(Session["ArtistID"].ToString());
                TextBox8.Text = artist.ToString();
            }
        }

        protected void BtnSubmit_Add(object sender, EventArgs e)
        {
            int artist = int.Parse(Session["ArtistID"].ToString());//session after login
            SqlConnection thesqlconnection = new SqlConnection(ConfigurationManager.ConnectionStrings["Artdist"].ConnectionString);

            thesqlconnection.Open();
            string strSelect = "Select Art_Name from ART where Art_Name=@name";

            SqlCommand cmdSelect = new SqlCommand(strSelect, thesqlconnection);
            cmdSelect.Parameters.AddWithValue("@name", TextBox3.Text);

            SqlDataReader dtrInfo = cmdSelect.ExecuteReader();

            string msg = "";

            if (dtrInfo.HasRows)// has record(s)
            {
                while (dtrInfo.Read())
                {
                    msg = "Art Name Existed!";
                    Session["ValidName"] = msg;
                    Label1.Visible = true;
                    thesqlconnection.Close();
                    break;
                }

            }



            else
            {
                thesqlconnection.Close();
                if (FileUpload1.HasFile)
                {
                    string imageName = FileUpload1.PostedFile.FileName;
                    string imageFilePath = "imgs/" + FileUpload1.FileName;
                    FileUpload1.PostedFile.SaveAs(Server.MapPath("~/imgs/") + imageName);
                    thesqlconnection.Open();

                    SqlCommand theImageCommand = new SqlCommand("INSERT INTO ART values('" + imageFilePath + "','" + TextBox3.Text.Trim().ToUpper() + "','" + TextBox4.Text.Trim() + "','" + TextBox5.Text.Trim() + "','" + DropDownList.Text.Trim() + "','" + TextBox7.Text.Trim() + "','" + artist + "')", thesqlconnection);

                    theImageCommand.ExecuteNonQuery();
                    thesqlconnection.Close();

                    Response.Redirect("ArtistProduct.aspx");
                }
            }

        }

        protected void DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}