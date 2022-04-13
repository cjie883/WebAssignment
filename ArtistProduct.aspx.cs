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
    public partial class ArtistProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, ImageClickEventArgs e)
        {

            ImageButton lnkRowSelection = (ImageButton)sender;
            //Get the Recipe id from command argumen tof linkbutton
            string Art_Id = lnkRowSelection.CommandArgument.ToString();

            // pass Recipe idto another page via query string
            Response.Redirect(string.Format("ProductDetails.aspx?Art_Id={0}", Art_Id), false);
        }

        protected void BtnSubmit_Edit(object sender, EventArgs e)
        {
            LinkButton lnkRowSelection = (LinkButton)sender;
            string edit = lnkRowSelection.CommandArgument.ToString();

            Session["Art_Edit_ID"] = edit;
            Response.Redirect("ProductUpdate.aspx");
        }

        protected void BtnSubmit_Delete(object sender, EventArgs e)
        {
            //int cus = int.Parse(Session["CustomerID"].ToString());//session after login
            int artist = int.Parse(Session["ArtistID"].ToString());//session after login

            LinkButton lnkRowSelection = (LinkButton)sender;
            string remove = lnkRowSelection.CommandArgument.ToString();

            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["Artdist"].ConnectionString;
            con = new SqlConnection(strCon);
            con.Open();

            string strDelete = "Delete from ART Where Art_Artist_Id=@artist_id AND Art_Id=@remove_id";
            //string strDelete = "DELETE FROM [WISH_LIST] WHERE ([Wish_Cus_Id], [Wish_Art_Id]) Values (@cus, @remove_id)";


            SqlCommand cmdDelete = new SqlCommand(strDelete, con);
            cmdDelete.Parameters.AddWithValue("@artist_id", artist);
            cmdDelete.Parameters.AddWithValue("@remove_id", remove);

            cmdDelete.ExecuteNonQuery();
            con.Close();

            Response.Write("<script>alert('Product has been removed')</script>");
            Server.Transfer("ArtistProduct.aspx");
           
        }

        protected void BtnSubmit_Add(object sender, EventArgs e)
        {
            Response.Redirect("ProductAdd.aspx");
        }
    }
}