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
    public partial class ArtistRegister : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("ArtistLogin.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if (TextBox2.Text.Trim().Equals(""))
            {
                Label9.Text = "Please enter your name<br/>";
                Label9.Visible = true;
            }
            else if (CheckName(TextBox2.Text.Trim()) == false)
            {
                Label9.Text = "Name cannot contain number<br/>";
                Label9.Visible = true;
            }
            else
            {
                Label9.Visible = false;
            }

            if (TextBox3.Text.Trim().Equals(""))
            {
                Label10.Text = "Please enter your username<br/>";
                Label10.Visible = true;
                Label16.Visible = false;
                Label17.Visible = false;
                Label18.Visible = false;
                Label19.Visible = false;
                Label20.Visible = false;
                Label21.Visible = false;
                Label22.Visible = false;
            }
            else if (CheckUsername(TextBox3.Text.Trim()) == false)
            {
                Label10.Text = "===============*NOTICE*===============<br/>";
                Label16.Text = "Username length must between 8 to 16<br/>";
                Label17.Text = "Username must begins with a letter<br/>";
                Label18.Text = "Username must contain at least 1 Uppercase Letter<br/>";
                Label19.Text = "Username must contain at least 1 Lowercase Letter<br/>";
                Label20.Text = "Username must contain at least 1 Letter<br/>";
                Label21.Text = "Username must contain at least 1 Digit<br/>";
                Label22.Text = "Blank space is not allow<br/>";
                Label10.Visible = true;
                Label16.Visible = true;
                Label17.Visible = true;
                Label18.Visible = true;
                Label19.Visible = true;
                Label20.Visible = true;
                Label21.Visible = true;
                Label22.Visible = true;
            }
            else if (CheckExistency(TextBox3.Text.Trim()) == true)
            {
                Label10.Text = "Username Existed. Please enter another Username<br/>";
                Label10.Visible = true;
                Label16.Visible = false;
                Label17.Visible = false;
                Label18.Visible = false;
                Label19.Visible = false;
                Label20.Visible = false;
                Label21.Visible = false;
                Label22.Visible = false;
            }
            else
            {
                Label10.Visible = false;
                Label16.Visible = false;
                Label17.Visible = false;
                Label18.Visible = false;
                Label19.Visible = false;
                Label20.Visible = false;
                Label21.Visible = false;
                Label22.Visible = false;
            }

            if (TextBox4.Text.Trim().Equals(""))
            {
                Label11.Text = "Please enter your password<br/>";
                Label11.Visible = true;
                Label23.Visible = false;
                Label24.Visible = false;
                Label25.Visible = false;
                Label26.Visible = false;
                Label27.Visible = false;
                Label28.Visible = false;
            }
            else if (CheckPassword(TextBox4.Text.Trim()) == false)
            {
                Label11.Text = "===============*NOTICE*===============<br/>";
                Label23.Text = "Password length must between 8 to 16<br/>";
                Label24.Text = "Password must contain at least 1 Uppercase Letter<br/>";
                Label25.Text = "Password must contain at least 1 Lowercase Letter<br/>";
                Label26.Text = "Password must contain at least 1 Letter<br/>";
                Label27.Text = "Password must contain at least 1 Digit<br/>";
                Label28.Text = "Blank space is not allow<br/>";
                Label11.Visible = true;
                Label23.Visible = true;
                Label24.Visible = true;
                Label25.Visible = true;
                Label26.Visible = true;
                Label27.Visible = true;
                Label28.Visible = true;
            }
            else
            {
                Label11.Visible = false;
                Label23.Visible = false;
                Label24.Visible = false;
                Label25.Visible = false;
                Label26.Visible = false;
                Label27.Visible = false;
                Label28.Visible = false;
            }

            if (TextBox1.Text.Trim().Equals(""))
            {
                Label12.Text = "Please enter confirm password<br/>";
                Label12.Visible = true;
            }
            else if (!TextBox1.Text.Trim().Equals(TextBox4.Text.Trim()))
            {
                Label12.Text = "Password and Confirm password is not same<br/>";
                Label12.Visible = true;
            }
            else
            {
                Label12.Visible = false;
            }

            if (TextBox6.Text.Trim().Equals(""))
            {
                Label13.Text = "Please enter your phone number<br/>";
                Label13.Visible = true;
            }
            else if (CheckPhone(TextBox6.Text.Trim()) == false)
            {
                Label13.Text = "Invalid Phone Number (Example:01234567890)<br/>";
                Label13.Visible = true;
            }
            else
            {
                Label13.Visible = false;
            }

            if (TextBox7.Text.Trim().Equals(""))
            {
                Label14.Text = "Please enter your email address<br/>";
                Label14.Visible = true;
            }
            else if (CheckEmail(TextBox7.Text.Trim()) == false)
            {
                Label14.Text = "Invalid Email format<br/>";
                Label14.Visible = true;
            }
            else
            {
                Label14.Visible = false;
            }

            if (TextBox8.Text.Trim().Equals(""))
            {
                Label15.Text = "Please enter your address<br/>";
                Label15.Visible = true;
            }
            else
            {
                Label15.Visible = false;
            }

            if (!TextBox2.Text.Trim().Equals("") && CheckName(TextBox2.Text.Trim()) == true && !TextBox3.Text.Trim().Equals("") && CheckUsername(TextBox3.Text.Trim()) == true && CheckExistency(TextBox3.Text.Trim()) == false && !TextBox4.Text.Trim().Equals("") && CheckPassword(TextBox4.Text.Trim()) == true && !TextBox1.Text.Trim().Equals("") && TextBox1.Text.Trim().Equals(TextBox4.Text.Trim()) && !TextBox6.Text.Trim().Equals("") && CheckPhone(TextBox6.Text.Trim()) == true && !TextBox7.Text.Trim().Equals("") && CheckEmail(TextBox7.Text.Trim()) == true && !TextBox8.Text.Trim().Equals(""))
            {
                SqlConnection con;
                string strCon = ConfigurationManager.ConnectionStrings["Artdist"].ConnectionString;

                con = new SqlConnection(strCon);

                String query = "INSERT INTO ARTIST (Artist_Name, Artist_UserName, Artist_Password, Artist_Gender, Artist_Phone, Artist_Email, Artist_Address) " +
                    "VALUES (@artistregistername,@artistregisterusername,@artistregisterpassword,@artistregistergender,@artistregisterphone,@artistregisteremail,@artistregisteraddress)";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@artistregistername", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@artistregisterusername", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@artistregisterpassword", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@artistregistergender", DropDownList1.SelectedValue);
                cmd.Parameters.AddWithValue("@artistregisterphone", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@artistregisteremail", TextBox7.Text.Trim());
                cmd.Parameters.AddWithValue("@artistregisteraddress", TextBox8.Text.Trim());
                con.Open();
                cmd.ExecuteNonQuery();

                Session["ArtistRegisterName"] = TextBox2.Text.Trim();

                Response.Redirect("ArtistRegistrationSuccess.aspx");
            }
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
    }
}