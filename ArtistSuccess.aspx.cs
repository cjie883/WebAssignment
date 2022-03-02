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
    public partial class ArtistSuccess : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ArtistRegisterName"] != null)
            {
                SqlConnection con;
                string strCon = ConfigurationManager.ConnectionStrings["Artdist"].ConnectionString;

                con = new SqlConnection(strCon);
                con.Open();
                String query = "SELECT TOP 1 * FROM ARTIST ORDER BY Artist_Id DESC";
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataReader dtrInfo = cmd.ExecuteReader();

                if (dtrInfo.Read())
                {
                    Label2.Text = (dtrInfo.GetInt32(dtrInfo.GetOrdinal("Artist_Id"))).ToString();
                    Label4.Text = (dtrInfo.GetString(dtrInfo.GetOrdinal("Artist_Name"))).ToString();
                    Label6.Text = (dtrInfo.GetString(dtrInfo.GetOrdinal("Artist_Username"))).ToString();
                    Label8.Text = (dtrInfo.GetString(dtrInfo.GetOrdinal("Artist_Password"))).ToString();
                    String gender = (dtrInfo.GetString(dtrInfo.GetOrdinal("Artist_Gender"))).ToString();
                    if (gender == "M" || gender == "m")
                    {
                        Label10.Text = "Male";
                    }
                    else if (gender == "F" || gender == "f")
                    {
                        Label10.Text = "Female";
                    }
                    Label12.Text = (dtrInfo.GetString(dtrInfo.GetOrdinal("Artist_Phone"))).ToString();
                    Label14.Text = (dtrInfo.GetString(dtrInfo.GetOrdinal("Artist_Email"))).ToString();
                    Label16.Text = (dtrInfo.GetString(dtrInfo.GetOrdinal("Artist_Address"))).ToString();
                }
            }
        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("ArtistLogin.aspx");
        }
    }
}