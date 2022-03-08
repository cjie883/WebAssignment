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
    public partial class UpdatePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string password;

            if (Session["CustomerID"] != null)
            {
                password = Session["CustomerPassword"].ToString();
            }
            else
            {
                password = Session["ArtistPassword"].ToString();
            }

            if (TextBox1.Text.Trim().Equals(""))
            {
                Label4.Text = "Please enter your current password<br/>";
                Label4.Visible = true;
            }
            else if (!TextBox1.Text.Trim().Equals(password))
            {
                Label4.Text = "Wrong Current Password<br/>";
                Label4.Visible = true;
            }
            else
            {
                Label4.Visible = false;
            }

            if (TextBox2.Text.Trim().Equals(""))
            {
                Label5.Text = "Please enter your new password<br/>";
                Label5.Visible = true;
                Label7.Visible = false;
                Label8.Visible = false;
                Label9.Visible = false;
                Label10.Visible = false;
                Label11.Visible = false;
                Label12.Visible = false;
            }
            else if (CheckPassword(TextBox2.Text.Trim()) == false)
            {
                Label5.Text = "===============*NOTICE*===============<br/>";
                Label7.Text = "Password length must between 8 to 16<br/>";
                Label8.Text = "Password must contain at least 1 Uppercase Letter<br/>";
                Label9.Text = "Password must contain at least 1 Lowercase Letter<br/>";
                Label10.Text = "Password must contain at least 1 Letter<br/>";
                Label11.Text = "Password must contain at least 1 Digit<br/>";
                Label12.Text = "Blank space is not allow<br/>";
                Label5.Visible = true;
                Label7.Visible = true;
                Label8.Visible = true;
                Label9.Visible = true;
                Label10.Visible = true;
                Label11.Visible = true;
                Label12.Visible = true;
            }
            else if (TextBox2.Text.Trim() == password)
            {
                Label5.Text = "New password is the same with current<br/> ";
                Label7.Text = "password. Please enter again<br/>";
                Label5.Visible = true;
                Label7.Visible = true;
                Label8.Visible = false;
                Label9.Visible = false;
                Label10.Visible = false;
                Label11.Visible = false;
                Label12.Visible = false;
            }
            else
            {
                Label5.Visible = false;
                Label7.Visible = false;
                Label8.Visible = false;
                Label9.Visible = false;
                Label10.Visible = false;
                Label11.Visible = false;
                Label12.Visible = false;
            }

            if (TextBox3.Text.Trim().Equals(""))
            {
                Label6.Text = "Please enter your confirm password<br/>";
                Label6.Visible = true;
            }
            else if (!TextBox3.Text.Trim().Equals(TextBox2.Text.Trim()))
            {
                Label6.Text = "Confirm password is not same with new password<br/>";
                Label6.Visible = true;
            }
            else
            {
                Label6.Visible = false;
            }

            if (!TextBox1.Text.Trim().Equals("") && TextBox1.Text.Trim().Equals(password) && !TextBox2.Text.Trim().Equals("") && CheckPassword(TextBox2.Text.Trim()) == true && !TextBox3.Text.Trim().Equals("") && TextBox3.Text.Trim().Equals(TextBox2.Text.Trim()) && TextBox2.Text.Trim() != password)
            {
                string id;
                if (Session["CustomerID"] != null)
                {
                    id = Session["CustomerID"].ToString();
                    int cusid = int.Parse(id);
                    SqlConnection con;
                    string strCon = ConfigurationManager.ConnectionStrings["Artdist"].ConnectionString;

                    con = new SqlConnection(strCon);
                    con.Open();
                    String query = "UPDATE [CUSTOMER] SET Customer_Password = @custpassword WHERE Customer_Id=@custid";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@custid", cusid);
                    cmd.Parameters.AddWithValue("@custpassword", TextBox2.Text.Trim());

                    cmd.ExecuteNonQuery();

                    Session["CustomerPassword"] = TextBox2.Text.Trim();
                    Response.Write("<script>alert('Your Password has been updated')</script>");
                    Server.Transfer("CustomerProfile.aspx");
                }
                else
                {
                    id = Session["ArtistID"].ToString();
                    int artistid = int.Parse(id);
                    SqlConnection con;
                    string strCon = ConfigurationManager.ConnectionStrings["Artdist"].ConnectionString;

                    con = new SqlConnection(strCon);
                    con.Open();
                    String query = "UPDATE [ARTIST] SET Artist_Password = @artistpassword WHERE Artist_Id=@artistid";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@artistid", artistid);
                    cmd.Parameters.AddWithValue("@artistpassword", TextBox2.Text.Trim());

                    cmd.ExecuteNonQuery();

                    Session["ArtistPassword"] = TextBox2.Text.Trim();
                    Response.Write("<script>alert('Your Password has been updated')</script>");
                    Server.Transfer("ArtistProfile.aspx");
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (Session["CustomerID"] != null)
            {
                Response.Redirect("CustomerProfileEdit.aspx");
            }
            else
            {
                Response.Redirect("ArtistProfileEdit.aspx");
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            if (Session["CustomerID"] != null)
            {
                Response.Redirect("CustomerProfile.aspx");
            }
            else
            {
                Response.Redirect("ArtistProfile.aspx");
            }
        }

        protected Boolean CheckPassword(string password)
        {
            return (CheckUnamePword(password));
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
    }
}