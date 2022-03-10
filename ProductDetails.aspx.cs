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
    public partial class ProductDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ArtistID"] != null)
            {
                LinkButton1.Visible = false;
                LinkButton2.Visible = false;
                LinkButton4.Visible = false;
                LinkButton3.PostBackUrl = "ArtistProduct.aspx";
            }

            if (Session["Category"] == null && Session["ArtistID"] != null)
            {
                if (Session["ArtistID"] == null && Session["Category"] != "all")
                {
                    LinkButton3.PostBackUrl = "ProductSub.aspx";
                }


                string Art_Id = Request.QueryString["Art_Id"];

                if (Art_Id != null)
                {
                    Label1.Text = Art_Id;

                    SqlConnection con;
                    string strCon = ConfigurationManager.ConnectionStrings["Artdist"].ConnectionString;
                    con = new SqlConnection(strCon);
                    con.Open();

                    string strSelect = "Select * from ART where Art_Id = " + Art_Id;

                    SqlCommand cmdSelect = new SqlCommand(strSelect, con);
                    SqlDataReader dtrInfo = cmdSelect.ExecuteReader();


                    string Art_Image = "";
                    string Art_Name = "";
                    string Art_Description = "";
                    double Art_Price = 0;
                    int Art_Quantity = 0;
                    int Art_Artist_Id = 0;
                    string Artist_Name = "";

                    if (dtrInfo.HasRows)// has record(s)
                    {
                        while (dtrInfo.Read())
                        {
                            Art_Image += dtrInfo["Art_Image"].ToString();
                            Art_Name += dtrInfo["Art_Name"].ToString();
                            Art_Description += dtrInfo["Art_Description"].ToString();
                            Art_Price += Convert.ToDouble(dtrInfo["Art_Price"].ToString());
                            Art_Quantity = (int)dtrInfo["Art_Quantity"];
                            Art_Artist_Id = (int)dtrInfo["Art_Artist_Id"];
                        }

                        Session["Art_Image_Show"] = Art_Image;
                        Art_Name_Show.Text = Art_Name;
                        Art_Description_Show.Text = Art_Description;
                        Art_Price_Show.Text = Art_Price.ToString();
                        //Art_Quantity_Show.Text = Art_Quantity.ToString();
                        if (Art_Quantity == 0)
                        {
                            LinkButton1.Enabled = false;
                            LinkButton2.Enabled = false;
                            Art_Quantity_Show.Text = "Out of stock";
                        }
                        else
                        {
                            Art_Quantity_Show.Text = Art_Quantity.ToString();
                        }

                    }
                    else
                    {
                        Art_Name_Show.Text = "No Record(s) found.";
                    }
                    con.Close();

                    con.Open();
                    string strSelect2 = "Select Artist_Name from ARTIST where Artist_Id = " + Art_Artist_Id;
                    SqlCommand cmdSelect2 = new SqlCommand(strSelect2, con);
                    SqlDataReader dtrInfo2 = cmdSelect2.ExecuteReader();

                    if (dtrInfo2.HasRows)// has record(s)
                    {
                        while (dtrInfo2.Read())
                        {
                            Artist_Name += dtrInfo2["Artist_Name"].ToString();
                        }
                        Artist_Name_Show.Text = Artist_Name;
                        Session["Pass_Artist_Id"] = Art_Artist_Id;
                    }
                    else
                    {
                        Artist_Name_Show.Text = "No Artist found.";
                    }
                    con.Close();
                }
            }
            else if (Session["CustomerID"] != null)
            {
                if (Session["ArtistID"] == null && Session["Category"] != "all")
                {
                    LinkButton3.PostBackUrl = "ProductSub.aspx";
                }


                string Art_Id = Request.QueryString["Art_Id"];

                if (Art_Id != null)
                {
                    Label1.Text = Art_Id;

                    SqlConnection con;
                    string strCon = ConfigurationManager.ConnectionStrings["Artdist"].ConnectionString;
                    con = new SqlConnection(strCon);
                    con.Open();

                    string strSelect = "Select * from ART where Art_Id = " + Art_Id;

                    SqlCommand cmdSelect = new SqlCommand(strSelect, con);
                    SqlDataReader dtrInfo = cmdSelect.ExecuteReader();


                    string Art_Image = "";
                    string Art_Name = "";
                    string Art_Description = "";
                    double Art_Price = 0;
                    int Art_Quantity = 0;
                    int Art_Artist_Id = 0;
                    string Artist_Name = "";

                    if (dtrInfo.HasRows)// has record(s)
                    {
                        while (dtrInfo.Read())
                        {
                            Art_Image += dtrInfo["Art_Image"].ToString();
                            Art_Name += dtrInfo["Art_Name"].ToString();
                            Art_Description += dtrInfo["Art_Description"].ToString();
                            Art_Price += Convert.ToDouble(dtrInfo["Art_Price"].ToString());
                            Art_Quantity = (int)dtrInfo["Art_Quantity"];
                            Art_Artist_Id = (int)dtrInfo["Art_Artist_Id"];
                        }

                        Session["Art_Image_Show"] = Art_Image;
                        Art_Name_Show.Text = Art_Name;
                        Art_Description_Show.Text = Art_Description;
                        Art_Price_Show.Text = Art_Price.ToString();
                        //Art_Quantity_Show.Text = Art_Quantity.ToString();
                        if (Art_Quantity == 0)
                        {
                            LinkButton1.Enabled = false;
                            LinkButton2.Enabled = false;
                            Art_Quantity_Show.Text = "Out of stock";
                        }
                        else
                        {
                            Art_Quantity_Show.Text = Art_Quantity.ToString();
                        }

                    }
                    else
                    {
                        Art_Name_Show.Text = "No Record(s) found.";
                    }
                    con.Close();

                    con.Open();
                    string strSelect2 = "Select Artist_Name from ARTIST where Artist_Id = " + Art_Artist_Id;
                    SqlCommand cmdSelect2 = new SqlCommand(strSelect2, con);
                    SqlDataReader dtrInfo2 = cmdSelect2.ExecuteReader();

                    if (dtrInfo2.HasRows)// has record(s)
                    {
                        while (dtrInfo2.Read())
                        {
                            Artist_Name += dtrInfo2["Artist_Name"].ToString();
                        }
                        Artist_Name_Show.Text = Artist_Name;
                        Session["Pass_Artist_Id"] = Art_Artist_Id;
                    }
                    else
                    {
                        Artist_Name_Show.Text = "No Artist found.";
                    }
                    con.Close();
                }
            }
        }
        protected void BtnSubmit_Artist(object sender, EventArgs e)
        {

            Response.Redirect("ArtistList.aspx");
        }

        protected void BtnSubmit_Purchase(object sender, EventArgs e)
        {
            //pass art id
            int id = int.Parse(Label1.Text);
            int price = int.Parse(Art_Price_Show.Text);

            Session["Pay_Art_Id"] = id;
            Session["Pay_Art_Price"] = price;

            Response.Redirect("Payment.aspx");
        }

        protected void BtnSubmit_Wish(object sender, EventArgs e)
        {
            int id = int.Parse(Label1.Text);
            int cus = int.Parse(Session["CustomerID"].ToString());//session after login

            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["Artdist"].ConnectionString;

            con = new SqlConnection(strCon);
            con.Open();

            string strInsert = "Insert Into WISH_LIST (Wish_Cus_Id, Wish_Art_Id, Wish_Art_Image) Values (@cus_id, @art_id, @art_image)";

            SqlCommand cmdInsert = new SqlCommand(strInsert, con);

            cmdInsert.Parameters.AddWithValue("@cus_id", cus);
            cmdInsert.Parameters.AddWithValue("@art_id", id);
            cmdInsert.Parameters.AddWithValue("@art_image", Session["Art_Image_Show"]);

            cmdInsert.ExecuteNonQuery();

            con.Close();

            Response.Write("<script>alert('Art has been added into wish list')</script>");
            Server.Transfer("WishList.aspx");
        }

        protected void BtnSubmit_Cart(object sender, EventArgs e)
        {
            int id = int.Parse(Label1.Text);
            int cus = int.Parse(Session["CustomerID"].ToString());//session after login

            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["Artdist"].ConnectionString;

            con = new SqlConnection(strCon);
            con.Open();

            string strInsert = "Insert Into NCART (Cart_Cus_Id, Cart_Art_Id, Cart_Art_Image) Values (@cus_id, @art_id, @art_image)";

            SqlCommand cmdInsert = new SqlCommand(strInsert, con);

            cmdInsert.Parameters.AddWithValue("@cus_id", cus);
            cmdInsert.Parameters.AddWithValue("@art_id", id);
            cmdInsert.Parameters.AddWithValue("@art_image", Session["Art_Image_Show"]);

            cmdInsert.ExecuteNonQuery();

            con.Close();

            Response.Write("<script>alert('Art has been added into Cart')</script>");
            Server.Transfer("Cart.aspx");
        }
    }
}