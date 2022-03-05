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
    public partial class ArtistProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ArtistID"] != null)
            {
                String artistgetid = Session["ArtistID"].ToString();
                int artistid = int.Parse(artistgetid);
                SqlConnection con;
                string strCon = ConfigurationManager.ConnectionStrings["Artdist"].ConnectionString;

                con = new SqlConnection(strCon);
                con.Open();
                String query = "SELECT * FROM ARTIST WHERE Artist_Id=@artistid";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@artistid", artistid);

                SqlDataReader dtrInfo = cmd.ExecuteReader();

                if (dtrInfo.Read())
                {
                    Session["ArtistName"] = dtrInfo.GetString(dtrInfo.GetOrdinal("Artist_Name"));
                    Session["ArtistUsername"] = dtrInfo.GetString(dtrInfo.GetOrdinal("Artist_UserName"));
                    Session["ArtistGender"] = dtrInfo.GetString(dtrInfo.GetOrdinal("Artist_Gender"));
                    Session["ArtistPhone"] = dtrInfo.GetString(dtrInfo.GetOrdinal("Artist_Phone"));
                    Session["ArtistEmail"] = dtrInfo.GetString(dtrInfo.GetOrdinal("Artist_Email"));
                    Session["ArtistAddress"] = dtrInfo.GetString(dtrInfo.GetOrdinal("Artist_Address"));

                    Label2.Text = Session["ArtistID"].ToString();
                    Label4.Text = Session["ArtistName"].ToString();
                    Label6.Text = Session["ArtistUsername"].ToString();
                    if (Session["ArtistGender"].ToString() == "M" || Session["ArtistGender"].ToString() == "m")
                    {
                        Label10.Text = "Male";
                    }
                    else if (Session["ArtistGender"].ToString() == "F" || Session["ArtistGender"].ToString() == "f")
                    {
                        Label10.Text = "Female";
                    }
                    Label12.Text = Session["ArtistPhone"].ToString();
                    Label14.Text = Session["ArtistEmail"].ToString();
                    Label16.Text = Session["ArtistAddress"].ToString();
                }
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("ArtistProfileEdit.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditPassword.aspx");
        }
    }
}