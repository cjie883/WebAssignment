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
    public partial class ProductUpdate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                if (Session["Art_Edit_ID"] != null)
                {
                    int artid = int.Parse(Session["Art_Edit_ID"].ToString());

                    SqlConnection con;
                    string strCon = ConfigurationManager.ConnectionStrings["Artdist"].ConnectionString;

                    con = new SqlConnection(strCon);
                    con.Open();
                    String query = "SELECT * FROM ART WHERE Art_Id=@artid";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@artid", artid);

                    SqlDataReader dtrInfo = cmd.ExecuteReader();

                    if (dtrInfo.Read())
                    {
                        Button1.ImageUrl = dtrInfo.GetString(dtrInfo.GetOrdinal("Art_Image"));
                        TextBox2.Text = dtrInfo.GetString(dtrInfo.GetOrdinal("Art_Name"));
                        TextBox3.Text = dtrInfo["Art_Price"].ToString();
                        TextBox4.Text = (dtrInfo.GetInt32(dtrInfo.GetOrdinal("Art_Quantity"))).ToString();
                        DropDownList1.SelectedValue = dtrInfo.GetString(dtrInfo.GetOrdinal("Art_Category"));
                        TextBox6.Text = dtrInfo.GetString(dtrInfo.GetOrdinal("Art_Description"));
                    }
                }
            }
        }


        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            int artid = int.Parse(Session["Art_Edit_ID"].ToString());
            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["Artdist"].ConnectionString;

            con = new SqlConnection(strCon);
            con.Open();
            string strSelect = "Select Art_Name from ART where Art_Name=@name";

            SqlCommand cmdSelect = new SqlCommand(strSelect, con);
            cmdSelect.Parameters.AddWithValue("@name", TextBox2.Text);

            SqlDataReader dtrInfo = cmdSelect.ExecuteReader();

            string msg = "";

            if (dtrInfo.HasRows)// has record(s)
            {
                while (dtrInfo.Read())
                {
                    msg = "Art Name Existed!";
                    Session["ValidName"] = msg;
                    Label1.Visible = true;
                    con.Close();
                    break;
                }

            }

            else
            {
                con.Close();
                con.Open();
                String query = "UPDATE [ART] SET Art_Name = @artname, Art_Price = @artprice, Art_Quantity = @artquantity, Art_Category = @artcategory, Art_Description = @artdescription WHERE Art_Id=@artid";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@artid", artid);
                cmd.Parameters.AddWithValue("@artname", TextBox2.Text.Trim().ToUpper());
                cmd.Parameters.AddWithValue("@artprice", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@artquantity", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@artcategory", DropDownList1.Text.Trim().ToUpper());
                cmd.Parameters.AddWithValue("@artdescription", TextBox6.Text.Trim());
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Product details has been updated')</script>");
                Server.Transfer("ArtistProduct.aspx");
            }

        }

        //protected void LinkButton3_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("ArtistProduct.aspx");
        //}
    }
}