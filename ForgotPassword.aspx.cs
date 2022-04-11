using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Configuration;
using System.Data.SqlClient;
using System.Net.Mail;
using System.IO;

namespace WebAssignment
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["Artdist"].ConnectionString;

            con = new SqlConnection(strCon);
            con.Open();

            if (TextBox3.Text.Trim().Equals(""))
            {
                Label4.Text = "Please enter your password<br/>";
                Label4.Visible = true;
                Label5.Visible = false;
                Label6.Visible = false;
                Label7.Visible = false;
                Label8.Visible = false;
                Label9.Visible = false;
                Label10.Visible = false;
            }
            else if (CheckPassword(TextBox3.Text.Trim()) == false)
            {
                Label4.Text = "===============*NOTICE*===============<br/>";
                Label5.Text = "Password length must between 8 to 16<br/>";
                Label6.Text = "Password must contain at least 1 Uppercase Letter<br/>";
                Label7.Text = "Password must contain at least 1 Lowercase Letter<br/>";
                Label8.Text = "Password must contain at least 1 Letter<br/>";
                Label9.Text = "Password must contain at least 1 Digit<br/>";
                Label10.Text = "Blank space is not allow<br/>";
                Label4.Visible = true;
                Label5.Visible = true;
                Label6.Visible = true;
                Label7.Visible = true;
                Label8.Visible = true;
                Label9.Visible = true;
                Label10.Visible = true;
            }
            else
            {
                Label4.Visible = false;
                Label5.Visible = false;
                Label6.Visible = false;
                Label7.Visible = false;
                Label8.Visible = false;
                Label9.Visible = false;
                Label10.Visible = false;
            }

            if (TextBox4.Text.Trim().Equals(""))
            {
                Label11.Text = "Please enter confirm password<br/>";
                Label11.Visible = true;
            }
            else if (!TextBox4.Text.Trim().Equals(TextBox3.Text.Trim()))
            {
                Label11.Text = "Password and Confirm password is not same<br/>";
                Label11.Visible = true;
            }
            else
            {
                Label11.Visible = false;
            }

            if (!TextBox3.Text.Trim().Equals("") && CheckPassword(TextBox3.Text.Trim()) == true && !TextBox4.Text.Trim().Equals("") && TextBox4.Text.Trim().Equals(TextBox3.Text.Trim()))
            {
                if (Session["CustChangeEmail"] != null)
                {
                    String updatecustomer = "UPDATE [CUSTOMER] SET Customer_Password = @custpassword WHERE Customer_Email=@custemail";
                    SqlCommand cmd3 = new SqlCommand(updatecustomer, con);
                    cmd3.Parameters.AddWithValue("@custpassword", TextBox3.Text.Trim());
                    cmd3.Parameters.AddWithValue("@custemail", TextBox1.Text.Trim());
                    cmd3.ExecuteNonQuery();

                    Response.Write("<script>alert('Password changed successfully!')</script>");

                    Server.Transfer("CustomerLogin.aspx");
                }
                else
                {
                    String updatecustomer = "UPDATE [ARTIST] SET Artist_Password = @artpassword WHERE Artist_Email=@artemail";
                    SqlCommand cmd4 = new SqlCommand(updatecustomer, con);
                    cmd4.Parameters.AddWithValue("@artpassword", TextBox3.Text.Trim());
                    cmd4.Parameters.AddWithValue("@artemail", TextBox1.Text.Trim());
                    cmd4.ExecuteNonQuery();

                    Response.Write("<script>alert('Password changed successfully!')</script>");

                    Server.Transfer("ArtistLogin.aspx");
                }
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["Artdist"].ConnectionString;

            con = new SqlConnection(strCon);
            con.Open();

            String checkingcustomer = "SELECT * FROM CUSTOMER WHERE Customer_Email=@custemail";
            SqlCommand cmd1 = new SqlCommand(checkingcustomer, con);
            cmd1.Parameters.AddWithValue("@custemail", TextBox1.Text.Trim());

            SqlDataReader dtrInfo1 = cmd1.ExecuteReader();
            if (dtrInfo1.Read())
            {
                Label1.Visible = true;
                TextBox2.Visible = true;
                Button1.Visible = true;
                Button5.Visible = true;
                Button4.Visible = false;
                String email = dtrInfo1.GetString(dtrInfo1.GetOrdinal("Customer_Email"));

                Session["CustChangeEmail"] = email.ToString();


                MailMessage msg = new MailMessage();
                msg.To.Add("leongjc-wm19@student.tarc.edu.my");
                msg.From = new MailAddress("trytosimple2020@gmail.com");
                msg.Subject = "Forgot Password";

                Random random = new Random();

                int num1 = random.Next(0, 9);
                int num2 = random.Next(0, 9);
                int num3 = random.Next(0, 9);
                int num4 = random.Next(0, 9);
                int num5 = random.Next(0, 9);
                int num6 = random.Next(0, 9);

                string code = num1.ToString() + num2.ToString() + num3.ToString() + num4.ToString() + num5.ToString() + num6.ToString();

                string mailbody = "Forgot Password \n" + "The Verification Code is: " + code + "\n" + "Copyright © 2021. Artdist";

                msg.Body = mailbody;

                SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = new System.Net.NetworkCredential("trytosimple2020@gmail.com", "simple@1001");
                smtp.EnableSsl = true;
                smtp.Send(msg);

                Session["code"] = code;
            }
            else
            {
                String checkingartist = "SELECT * FROM ARTIST WHERE Artist_Email=@artistemail";
                SqlCommand cmd2 = new SqlCommand(checkingartist, con);
                cmd2.Parameters.AddWithValue("@artistemail", TextBox1.Text.Trim());
                dtrInfo1.Close();
                SqlDataReader dtrInfo2 = cmd2.ExecuteReader();
                if (dtrInfo2.Read())
                {
                    String email = dtrInfo2.GetString(dtrInfo2.GetOrdinal("Artist_Email"));
                    Session["ArtistChangeEmail"] = email.ToString();
                    Label1.Visible = true;
                    TextBox2.Visible = true;
                    Button1.Visible = true;
                    Button5.Visible = true;
                    Button4.Visible = false;

                    MailMessage msg = new MailMessage();
                    msg.To.Add("leongjc-wm19@student.tarc.edu.my");
                    msg.From = new MailAddress("trytosimple2020@gmail.com");
                    msg.Subject = "Forgot Password";

                    Random random = new Random();

                    int num1 = random.Next(0, 9);
                    int num2 = random.Next(0, 9);
                    int num3 = random.Next(0, 9);
                    int num4 = random.Next(0, 9);
                    int num5 = random.Next(0, 9);
                    int num6 = random.Next(0, 9);

                    string code = num1.ToString() + num2.ToString() + num3.ToString() + num4.ToString() + num5.ToString() + num6.ToString();

                    string mailbody = "Forgot Password \n" + "The Verification Code is: " + code + "\n" + "Copyright © 2021. Artdist";

                    msg.Body = mailbody;

                    SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
                    smtp.UseDefaultCredentials = false;
                    smtp.Credentials = new System.Net.NetworkCredential("trytosimple2020@gmail.com", "simple@1001");
                    smtp.EnableSsl = true;
                    smtp.Send(msg);

                    Session["code"] = code;
                }
                else
                {
                    Label2.Visible = true;
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string code = Session["code"].ToString();
            if (TextBox2.Text == code)
            {
                passwordtext.Visible = true;
                TextBox3.Visible = true;
                Button2.Visible = true;
                Label3.Visible = true;
                TextBox4.Visible = true;
                Button5.Visible = false;
                Button6.Visible = true;
            }
            else
            {
                wrongcode.Visible = true;
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

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}