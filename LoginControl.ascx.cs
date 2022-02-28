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
    public partial class LoginControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Login"].Equals("CustomerLogin"))
            {
                Title.Text = "Customer Login";
            }
            else
            {
                Title.Text = "Artist Login";
            }
        }
        protected void Login_Click(object sender, EventArgs e)
        {

            if (loginusername.Text.Trim() == "" && loginpassword.Text.Trim() == "")
            {
                Label3.Text = "Please enter your username";
                Label3.Visible = true;
                Label4.Text = "Please enter your password";
                Label4.Visible = true;
                Label5.Visible = false;
            }
            else if (loginusername.Text.Trim() == "")
            {
                Label3.Text = "Please enter your username";
                Label3.Visible = true;
                Label5.Visible = false;
            }
            else if (loginpassword.Text.Trim() == "")
            {
                Label4.Text = "Please enter your password";
                Label4.Visible = true;
                Label5.Visible = false;
            }
            else
            {
                SqlConnection con;
                string strCon = ConfigurationManager.ConnectionStrings["Artdist"].ConnectionString;
                if (Session["Login"].Equals("CustomerLogin"))
                {
                    con = new SqlConnection(strCon);
                    con.Open();
                    String query = "SELECT * FROM CUSTOMER WHERE Customer_UserName=@custloginusername AND Customer_Password=@custloginpassword";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@custloginusername", loginusername.Text.Trim());
                    cmd.Parameters.AddWithValue("@custloginpassword", loginpassword.Text.Trim());
                    SqlDataReader dtrInfo = cmd.ExecuteReader();
                    if (dtrInfo.Read())
                    {
                        Session["CustomerUsername"] = loginusername.Text.Trim();
                        dtrInfo.Close();
                        string str1 = "Select * from CUSTOMER where Customer_UserName=@custloginusername";
                        SqlCommand cmd1 = new SqlCommand(str1, con);
                        cmd1.Parameters.AddWithValue("@custloginusername", loginusername.Text.Trim());

                        SqlDataReader dtrInfo1 = cmd1.ExecuteReader();
                        if (dtrInfo1.Read())
                        {
                            int custid = dtrInfo1.GetInt32(dtrInfo1.GetOrdinal("Customer_Id"));
                            String name = dtrInfo1.GetString(dtrInfo1.GetOrdinal("Customer_Name"));
                            String gender = dtrInfo1.GetString(dtrInfo1.GetOrdinal("Customer_Gender"));
                            String phone = dtrInfo1.GetString(dtrInfo1.GetOrdinal("Customer_Phone"));
                            String email = dtrInfo1.GetString(dtrInfo1.GetOrdinal("Customer_Email"));
                            String address = dtrInfo1.GetString(dtrInfo1.GetOrdinal("Customer_Address"));

                            Session["CustomerID"] = custid.ToString();
                            Session["CustomerName"] = name.ToString();
                            Session["CustomerPassword"] = loginpassword.Text.Trim();
                            Session["CustomerGender"] = gender.ToString();
                            Session["CustomerPhone"] = phone.ToString();
                            Session["CustomerEmail"] = email.ToString();
                            Session["CustomerAddress"] = address.ToString();
                            Response.Redirect("home.aspx");
                        }
                    }
                    else
                    {
                        Label5.Text = "Account or Password Error";
                        Label5.Visible = true;
                        Label3.Visible = false;
                        Label4.Visible = false;
                    }
                    con.Close();
                }
                else
                {
                    con = new SqlConnection(strCon);
                    con.Open();
                    String query2 = "SELECT * FROM ARTIST WHERE Artist_UserName=@artistloginusername AND Artist_Password=@artistloginpassword";
                    SqlCommand cmd2 = new SqlCommand(query2, con);
                    cmd2.Parameters.AddWithValue("@artistloginusername", loginusername.Text.Trim());
                    cmd2.Parameters.AddWithValue("@artistloginpassword", loginpassword.Text.Trim());
                    SqlDataReader dtrInfo2 = cmd2.ExecuteReader();
                    if (dtrInfo2.Read())
                    {
                        Session["ArtistUsername"] = loginusername.Text.Trim();
                        dtrInfo2.Close();
                        string str2 = "Select * from ARTIST where Artist_UserName=@artistloginusername";
                        SqlCommand cmd3 = new SqlCommand(str2, con);
                        cmd3.Parameters.AddWithValue("@artistloginusername", loginusername.Text.Trim());

                        SqlDataReader dtrInfo3 = cmd3.ExecuteReader();
                        if (dtrInfo3.Read())
                        {
                            int artistid = dtrInfo3.GetInt32(dtrInfo3.GetOrdinal("Artist_Id"));
                            String name = dtrInfo3.GetString(dtrInfo3.GetOrdinal("Artist_Name"));
                            String gender = dtrInfo3.GetString(dtrInfo3.GetOrdinal("Artist_Gender"));
                            String phone = dtrInfo3.GetString(dtrInfo3.GetOrdinal("Artist_Phone"));
                            String email = dtrInfo3.GetString(dtrInfo3.GetOrdinal("Artist_Email"));
                            String address = dtrInfo3.GetString(dtrInfo3.GetOrdinal("Artist_Address"));

                            Session["ArtistID"] = artistid.ToString();
                            Session["ArtistName"] = name.ToString();
                            Session["ArtistPassword"] = loginpassword.Text.Trim();
                            Session["ArtistGender"] = gender.ToString();
                            Session["ArtistPhone"] = phone.ToString();
                            Session["ArtistEmail"] = email.ToString();
                            Session["ArtistAddress"] = address.ToString();
                            Session["Category"] = null;
                            Response.Redirect("home.aspx");
                        }
                    }
                    else
                    {
                        Label5.Text = "Account or Password Error";
                        Label5.Visible = true;
                        Label3.Visible = false;
                        Label4.Visible = false;
                    }
                    con.Close();
                }
            }
        }

        protected void Register_Click(object sender, EventArgs e)
        {
            if (Session["Login"].Equals("CustomerLogin"))
            {
                Response.Redirect("CustomerRegister.aspx");
            }
            else
            {
                Response.Redirect("ArtistRegister.aspx");
            }
        }
    }
}