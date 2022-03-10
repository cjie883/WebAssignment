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
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                calculateTotal();
                
            }
            if (DataList2.Items.Count == 0)
            {
                Image1.Visible = true;
                Label2.Visible = true;
                Label4.Visible = true;

                Label4.Text = "  <br /><br />";
                Label2.Text = "  Cart is empty now  <br /><br /><br /><br /><br /><br /><br />";
            }
            if(DataList2.Items.Count > 0)
            {
                lbltext.Visible = true;
                lbltext.Text = "Total Price (RM): ";
                labelTotal.Visible = true;
                lblbutton.Visible = true;
            }
        }

        protected void BtnSubmit_Remove(object sender, EventArgs e)
        {
            int cus = int.Parse(Session["CustomerID"].ToString());//session after login

            LinkButton lnkRowSelection = (LinkButton)sender;
            string remove = lnkRowSelection.CommandArgument.ToString();

            //int art_id = int.Parse(Wish_Art_Id);
            //string Wish_Art_Id;
            //Wish_Art_Id = this.Wish_Art_Id.Text.ToString();

            //var remove = (LinkButton)sender;
            ////string remove_id = remove.CommandArgument.ToString();

            //Session["Remove_Art_Id"] = remove;
            //int remove_id = Convert.ToInt32(Session["Romove_Art_Id"]);

            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["Artdist"].ConnectionString;
            con = new SqlConnection(strCon);
            con.Open();

            string strDelete = "Delete from NCART Where Cart_Cus_Id=@cus_id AND Cart_Art_Id=@remove_id";
            //string strDelete = "DELETE FROM [WISH_LIST] WHERE ([Wish_Cus_Id], [Wish_Art_Id]) Values (@cus, @remove_id)";


            SqlCommand cmdDelete = new SqlCommand(strDelete, con);
            cmdDelete.Parameters.AddWithValue("@cus_id", cus);
            cmdDelete.Parameters.AddWithValue("@remove_id", remove);

            cmdDelete.ExecuteNonQuery();
            con.Close();

            Response.Write("<script>alert('Art has been removed')</script>");
            Server.Transfer("Cart.aspx");
        }

        protected void BtnSubmit_Purchase(object sender, EventArgs e)
        {
            //pass art id
            //int id = int.Parse(Wish_Art_Id.Text);
            //int price = int.Parse(Art_Price_Show.Text);
            int cus = int.Parse(Session["CustomerID"].ToString());//session after login

            var art = (LinkButton)sender;
            string art_id = art.CommandArgument.ToString();

            //var art = (LinkButton)sender;
            //Session["Wish_Art_Id"] = art;
            //int art_id = Convert.ToInt32(Session["Wish_Art_Id"]);

            double Art_Price = 0;
            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["Artdist"].ConnectionString;
            con = new SqlConnection(strCon);
            con.Open();

            string strSelect = "Select * from ART where Art_Id = " + art_id;

            SqlCommand cmdSelect = new SqlCommand(strSelect, con);
            SqlDataReader dtrInfo = cmdSelect.ExecuteReader();

            if (dtrInfo.HasRows)// has record(s)
            {
                
                if (dtrInfo.Read())
                {
                    Art_Price = Convert.ToDouble(dtrInfo["Art_Price"].ToString());
                }

                Session["Pay_Art_Price"] = Art_Price;
                
               

            }
            else
            {

            }



            con.Close();

            //int art_price = int.Parse();
            //Session["Pay_Art_Id"] = art_id;

            //Response.Redirect("Payment.aspx");
        }
        protected void calculateTotal()
        {

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Artdist"].ConnectionString);
            String query = "select sum(Art_Price*" + 1 + ") AS Total from ART where Art_Id IN(select Cart_Art_Id from NCART where Cart_Cus_Id = '" + Session["CustomerID"].ToString() + "')";
            SqlCommand cmd = new SqlCommand(query, con);
            con.Open();


            string total = cmd.ExecuteScalar().ToString();
            Session["total"] = total;
            labelTotal.Text = total;

        }
        protected void DataList2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}