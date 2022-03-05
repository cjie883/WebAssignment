using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Text.RegularExpressions;

namespace WebAssignment
{
    public partial class ArtistProfileEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
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


                        Label9.Text = Session["ArtistID"].ToString();
                        TextBox2.Text = Session["ArtistName"].ToString();
                        Label14.Text = Session["ArtistUsername"].ToString();
                      
                        if (Session["ArtistGender"].ToString() == "M" || Session["ArtistGender"].ToString() == "m")
                        {
                            Label10.Text = "Male";
                        }
                        else if (Session["ArtistGender"].ToString() == "F" || Session["ArtistGender"].ToString() == "f")
                        {
                            Label10.Text = "Female";
                        }
                        TextBox6.Text = Session["ArtistPhone"].ToString();
                        TextBox7.Text = Session["ArtistEmail"].ToString();
                        TextBox8.Text = Session["ArtistAddress"].ToString();
                    }
                }
            }
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            if (TextBox2.Text.Trim().Equals(""))
            {
                Label12.Text = "Please enter your name<br/>";
                Label12.Visible = true;
            }
            else if (CheckName(TextBox2.Text.Trim()) == false)
            {
                Label12.Text = "Name cannot contain number<br/>";
                Label12.Visible = true;
            }
            else
            {
                Label12.Visible = false;
            }
    

            if (TextBox6.Text.Trim().Equals(""))
            {
                Label15.Text = "Please enter your phone number<br/>";
                Label15.Visible = true;
            }
            else if (CheckPhone(TextBox6.Text.Trim()) == false)
            {
                Label15.Text = "Invalid Phone Number (Example:01234567890)<br/>";
                Label15.Visible = true;
            }
            else
            {
                Label15.Visible = false;
            }

            if (TextBox7.Text.Trim().Equals(""))
            {
                Label16.Text = "Please enter your email address<br/>";
                Label16.Visible = true;
            }
            else if (CheckEmail(TextBox7.Text.Trim()) == false)
            {
                Label16.Text = "Invalid Email format<br/>";
                Label16.Visible = true;
            }
            else
            {
                Label16.Visible = false;
            }

            if (TextBox8.Text.Trim().Equals(""))
            {
                Label17.Text = "Please enter your address<br/>";
                Label17.Visible = true;
            }
            else
            {
                Label17.Visible = false;
            }

            if (!TextBox2.Text.Trim().Equals("") && CheckName(TextBox2.Text.Trim()) == true && !TextBox6.Text.Trim().Equals("") && CheckPhone(TextBox6.Text.Trim()) == true && !TextBox7.Text.Trim().Equals("") && CheckEmail(TextBox7.Text.Trim()) == true && !TextBox8.Text.Trim().Equals(""))
            {
                String artistgetid = Label9.Text.Trim();
                int artistid = int.Parse(artistgetid);
                SqlConnection con;
                string strCon = ConfigurationManager.ConnectionStrings["Artdist"].ConnectionString;

                con = new SqlConnection(strCon);
                con.Open();
                String query = "UPDATE [ARTIST] SET Artist_Name = @artistname, Artist_Phone = @artistphone, Artist_Email = @artistemail, Artist_Address = @artistaddress WHERE Artist_Id=@artistid";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@artistid", artistid);
                cmd.Parameters.AddWithValue("@artistname", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@artistphone", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@artistemail", TextBox7.Text.Trim());
                cmd.Parameters.AddWithValue("@artistaddress", TextBox8.Text.Trim());
                cmd.ExecuteNonQuery();

                Response.Write("<script>alert('Your Profile has been updated')</script>");
                Server.Transfer("ArtistProfile.aspx");
            }
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("ArtistProfile.aspx");
        }

        //done
        protected Boolean CheckName(string name)
        {
            Boolean valid = true;
            for (int i = 0; i < name.Length; i++)
            {
                char c = name[i];
                if (Char.IsDigit(c) || Char.IsNumber(c))
                {
                    valid = false;
                }
            }

            return valid;
        }

        //done
        protected Boolean CheckUsername(string username)
        {
            char cf = username[0];

            return (CheckUnamePword(username) && username.Length <= 16 && Char.IsLetter(cf));
        }

        //done
        protected Boolean CheckExistency(string username)
        {
            Boolean valid = false;

            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["Artdist"].ConnectionString;

            con = new SqlConnection(strCon);
            con.Open();
            String query = "SELECT * FROM CUSTOMER WHERE Customer_UserName=@custusername";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@custusername", username);
            SqlDataReader dtrInfo = cmd.ExecuteReader();
            if (dtrInfo.Read())
            {
                valid = true;
            }
            else
            {
                dtrInfo.Close();

                String query1 = "SELECT * FROM ARTIST WHERE Artist_UserName=@artistusername";
                SqlCommand cmd1 = new SqlCommand(query1, con);
                cmd1.Parameters.AddWithValue("@artistusername", username);
                SqlDataReader dtrInfo1 = cmd1.ExecuteReader();

                if (dtrInfo1.Read())
                {
                    valid = true;
                }
            }

            return valid;
        }

        //done
        protected Boolean CheckUnamePword(string usernameorpassword)
        {
            int charCount = 0;
            int numCount = 0;
            int upperCount = 0;
            int blankCount = 0;
            int lowerCount = 0;

            for (int i = 0; i < usernameorpassword.Length; i++)
            {
                char ch = usernameorpassword[i];

                if (Char.IsUpper(ch) == true)
                {
                    upperCount++;
                    charCount++;
                }
                else if (Char.IsLower(ch) == true)
                {
                    lowerCount++;
                    charCount++;
                }
                else if (Char.IsDigit(ch) == true)
                {
                    numCount++;
                }
                else if (Char.IsWhiteSpace(ch) == true)
                {
                    blankCount++;
                }
                else if (Char.IsLetter(ch) == true)
                {
                    charCount++;
                }
            }
            return (charCount >= 1 && numCount >= 1 && upperCount > 0 && blankCount == 0 && usernameorpassword.Length >= 8 && lowerCount >= 1);
        }

        //done
        protected Boolean CheckPhone(string phonenum)
        {
            Boolean valid = true;

            for (int i = 0; i < phonenum.Length; i++)
            {
                char ch = phonenum[i];

                if (Char.IsWhiteSpace(ch) == true)
                {
                    valid = false;
                }
                else if (Char.IsLetter(ch) == true)
                {
                    valid = false;
                }
            }

            if (phonenum.Length != 10 && phonenum.Length != 11)
            {
                valid = false;
            }

            return valid;
        }

        //done
        protected Boolean CheckEmail(string email)
        {
            Boolean valid = true;

            string emailformat = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";

            Regex format = new Regex(emailformat);

            if (!format.IsMatch(email))
            {
                valid = false;
            }

            return valid;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditPassword.aspx");
        }
    }
}