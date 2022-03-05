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
    public partial class CustomerProfileEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                if (Session["CustomerID"] != null)
                {
                    String custgetid = Session["CustomerID"].ToString();
                    int cusid = int.Parse(custgetid);
                    SqlConnection con;
                    string strCon = ConfigurationManager.ConnectionStrings["Artdist"].ConnectionString;

                    con = new SqlConnection(strCon);
                    con.Open();
                    String query = "SELECT * FROM CUSTOMER WHERE Customer_Id=@custid";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@custid", cusid);

                    SqlDataReader dtrInfo = cmd.ExecuteReader();

                    if (dtrInfo.Read())
                    {
                        Session["CustomerName"] = dtrInfo.GetString(dtrInfo.GetOrdinal("Customer_Name"));
                        Session["CustomerUsername"] = dtrInfo.GetString(dtrInfo.GetOrdinal("Customer_UserName"));
                        Session["CustomerGender"] = dtrInfo.GetString(dtrInfo.GetOrdinal("Customer_Gender"));
                        Session["CustomerPhone"] = dtrInfo.GetString(dtrInfo.GetOrdinal("Customer_Phone"));
                        Session["CustomerEmail"] = dtrInfo.GetString(dtrInfo.GetOrdinal("Customer_Email"));
                        Session["CustomerAddress"] = dtrInfo.GetString(dtrInfo.GetOrdinal("Customer_Address"));


                        Label9.Text = Session["CustomerID"].ToString();
                        TextBox2.Text = Session["CustomerName"].ToString();
                        TextBox3.Text = Session["CustomerUsername"].ToString();
                        if (Session["CustomerGender"].ToString() == "M" || Session["CustomerGender"].ToString() == "m")
                        {
                            Label10.Text = "Male";
                        }
                        else if (Session["CustomerGender"].ToString() == "F" || Session["CustomerGender"].ToString() == "f")
                        {
                            Label10.Text = "Female";
                        }
                        TextBox6.Text = Session["CustomerPhone"].ToString();
                        TextBox7.Text = Session["CustomerEmail"].ToString();
                        TextBox8.Text = Session["CustomerAddress"].ToString();
                    }
                }
            }
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            if (TextBox2.Text.Trim().Equals(""))
            {
                Label4.Text = "Please enter your name<br/>";
                Label4.Visible = true;
            }
            else if (CheckName(TextBox2.Text.Trim()) == false)
            {
                Label4.Text = "Name cannot contain number<br/>";
                Label4.Visible = true;
            }
            else
            {
                Label4.Visible = false;
            }

            if (TextBox3.Text.Trim().Equals(""))
            {
                Label14.Text = "Please enter your username<br/>";
                Label14.Visible = true;
                Label15.Visible = false;
                Label16.Visible = false;
                Label17.Visible = false;
                Label18.Visible = false;
                Label19.Visible = false;
                Label20.Visible = false;
                Label21.Visible = false;
            }
            else if (CheckUsername(TextBox3.Text.Trim()) == false)
            {
                Label14.Text = "===============*NOTICE*===============<br/>";
                Label15.Text = "Username length must between 8 to 16<br/>";
                Label16.Text = "Username must begins with a letter<br/>";
                Label17.Text = "Username must contain at least 1 Uppercase Letter<br/>";
                Label18.Text = "Username must contain at least 1 Lowercase Letter<br/>";
                Label19.Text = "Username must contain at least 1 Letter<br/>";
                Label20.Text = "Username must contain at least 1 Digit<br/>";
                Label21.Text = "Blank space is not allow<br/>";
                Label14.Visible = true;
                Label15.Visible = true;
                Label16.Visible = true;
                Label17.Visible = true;
                Label18.Visible = true;
                Label19.Visible = true;
                Label20.Visible = true;
                Label21.Visible = true;
            }
            else if (CheckExistency(TextBox3.Text.Trim()) == true)
            {
                Label14.Text = "Username Existed.Please enter another username<br/>";
                Label14.Visible = true;
                Label15.Visible = false;
                Label16.Visible = false;
                Label17.Visible = false;
                Label18.Visible = false;
                Label19.Visible = false;
                Label20.Visible = false;
                Label21.Visible = false;
            }
            else
            {
                Label14.Visible = false;
                Label15.Visible = false;
                Label16.Visible = false;
                Label17.Visible = false;
                Label18.Visible = false;
                Label19.Visible = false;
                Label20.Visible = false;
                Label21.Visible = false;
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
                Label12.Text = "Please enter your email address<br/>";
                Label12.Visible = true;
            }
            else if (CheckEmail(TextBox7.Text.Trim()) == false)
            {
                Label12.Text = "Invalid Email format<br/>";
                Label12.Visible = true;
            }
            else
            {
                Label12.Visible = false;
            }

            if (TextBox8.Text.Trim().Equals(""))
            {
                Label11.Text = "Please enter your address<br/>";
                Label11.Visible = true;
            }
            else
            {
                Label11.Visible = false;
            }


            if (!TextBox2.Text.Trim().Equals("") && CheckName(TextBox2.Text.Trim()) == true && !TextBox3.Text.Trim().Equals("") && CheckUsername(TextBox3.Text.Trim()) == true && CheckExistency(TextBox3.Text.Trim()) == false && !TextBox6.Text.Trim().Equals("") && CheckPhone(TextBox6.Text.Trim()) == true && !TextBox7.Text.Trim().Equals("") && CheckEmail(TextBox7.Text.Trim()) == true && !TextBox8.Text.Trim().Equals(""))
            {
                String cusgetid = Label9.Text.Trim();
                int cusid = int.Parse(cusgetid);
                SqlConnection con;
                string strCon = ConfigurationManager.ConnectionStrings["Artdist"].ConnectionString;

                con = new SqlConnection(strCon);
                con.Open();
                String query = "UPDATE [CUSTOMER] SET Customer_Name = @custname, Customer_UserName = @custusername, Customer_Phone = @custphone, Customer_Email = @custemail, Customer_Address = @custaddress WHERE Customer_Id=@custid";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@custid", cusid);
                cmd.Parameters.AddWithValue("@custname", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@custusername", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@custphone", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@custemail", TextBox7.Text.Trim());
                cmd.Parameters.AddWithValue("@custaddress", TextBox8.Text.Trim());
                cmd.ExecuteNonQuery();

                Response.Write("<script>alert('Your Profile has been updated')</script>");
                Server.Transfer("CustomerProfile.aspx");
            }
        }


        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustomerProfile.aspx");
        }

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