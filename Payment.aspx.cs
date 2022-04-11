using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.Net;
using System.Net.Mail;
using System.IO;

namespace WebAssignment
{
    public partial class Payment : System.Web.UI.Page
    {
        string strName = "/^[A-Za-z]+/";
        string strEmail = "^(.+)@(.+)$";
        string cardName = "/^[A-Za-z]+/";
        string cardNum = "[0-9]{16}";
        string expiration = "(0[1-9]|1[0-2])/?(([0-9]{4})|[0-9]{2}$)";
        string strCvv = "[0-9]{3}";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["total"] != null)
            {
                
                string price = (string)(Session["total"]);

                txtTotal.Text = "RM " + price.ToString();
            }
            
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            
            string paymentmethod = string.Empty;


            if (rbCC.Checked)
            {
                paymentmethod = "CreditCard";
            }

            else if (rbDC.Checked)
            {
                paymentmethod = "DebitCard";
            }

            else if (rbP.Checked)
            {
                paymentmethod = "Paypal";
            }

            //Validation(object source, ServerValidateEventArgs args);

            SqlConnection paymentConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["Artdist"].ConnectionString);

            paymentConnection.Open();

            SqlCommand insertCommand = new SqlCommand("INSERT INTO PAYMENT(Total_Payment,Receiver_Name,Receiver_Address,Payment_Method,Card_Name,Card_Expiration,Card_Cvv,Card_Number,Customer_Id,Shipping_Status) values (@total,@name,@address,@paymentmethod,@cname,@exp,@cvv,@cnumber,@custId,@status)", paymentConnection);

            insertCommand.Parameters.AddWithValue("@total", Session["total"].ToString());
            insertCommand.Parameters.AddWithValue("@name", txtName.Text);
            insertCommand.Parameters.AddWithValue("@address", txtAddress.Text);
            insertCommand.Parameters.AddWithValue("@paymentmethod", paymentmethod);
            insertCommand.Parameters.AddWithValue("@cname", txtCName.Text);
            insertCommand.Parameters.AddWithValue("@exp", txtExp.Text);
            insertCommand.Parameters.AddWithValue("@cvv", txtCvv.Text);
            insertCommand.Parameters.AddWithValue("@cnumber", txtCNumber.Text);
            insertCommand.Parameters.AddWithValue("@custId", Session["CustomerID"].ToString());
            insertCommand.Parameters.AddWithValue("@status", "Delivering");
            
            insertCommand.Connection = paymentConnection;

            insertCommand.ExecuteNonQuery();

            string strDelete = "Delete from WISH_LIST Where Wish_Cus_Id=@cus_id";
            //string strDelete = "DELETE FROM [WISH_LIST] WHERE ([Wish_Cus_Id], [Wish_Art_Id]) Values (@cus, @remove_id)";


            SqlCommand cmdDelete = new SqlCommand(strDelete, paymentConnection);
            cmdDelete.Parameters.AddWithValue("@cus_id", Session["CustomerID"].ToString());
            //cmdDelete.Parameters.AddWithValue("@remove_id", Session["Pay_Art_Id"].ToString());

            cmdDelete.ExecuteNonQuery();

            //string strSelect = "Select Art_Quantity, Art_Name from ART Where Art_Id = @artId";
           

            //SqlCommand cmdSelect = new SqlCommand(strSelect, paymentConnection);
            //cmdSelect.Parameters.AddWithValue("@artId", Session["Pay_Art_Id"].ToString());           

            //cmdSelect.Connection = paymentConnection;

            //SqlDataReader selectQuantity = cmdSelect.ExecuteReader();

            //if (selectQuantity.Read())
            //{
            //    quantity = (int)selectQuantity["Art_Quantity"];
            //    artName = selectQuantity["Art_Name"].ToString();

            //    if (quantity > 0)
            //    {
            //        quantity = quantity - 1;
            //    }
            //}

            //selectQuantity.Close();            

            //string strUpdate = "UPDATE ART SET Art_Quantity = @quantity WHERE Art_Id = @artId";

            //SqlCommand cmdUpdate = new SqlCommand(strUpdate, paymentConnection);

            //cmdUpdate.Parameters.AddWithValue("@artId", Session["Pay_Art_Id"].ToString());
            //cmdUpdate.Parameters.AddWithValue("@quantity", quantity.ToString());

            //cmdUpdate.ExecuteNonQuery();

            string body = string.Empty;

            MailMessage msg = new MailMessage();
            msg.To.Add("leongjc-wm19@student.tarc.edu.my");
            msg.From = new MailAddress("trytosimple2020@gmail.com");
            msg.Subject = "Payment Receipt";
            msg.IsBodyHtml = true;
            StreamReader reader = new StreamReader(Server.MapPath("~/Receipt.aspx"));
            body = reader.ReadToEnd();

            body = body.Replace("{name}", txtName.Text.ToString());
            body = body.Replace("{total}", Session["total"].ToString());
            body = body.Replace("{date}", System.DateTime.Now.ToString());
            body = body.Replace("{address}", txtAddress.Text.ToString());
            body = body.Replace("{email}", txtEmail.Text.ToString());
            string mailbody = body;
            msg.Body = mailbody;

            SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = new System.Net.NetworkCredential("trytosimple2020@gmail.com", "simple@1001");
            smtp.EnableSsl = true;       
            smtp.Send(msg);

            paymentConnection.Close();

            Response.Write("<script>alert('Payment successful, Thank you!')</script>");

            Server.Transfer("Product.aspx"); 
        
        }

        protected void Validation(object source, ServerValidateEventArgs args)
        {
            Regex name = new Regex(strName);
            Regex email = new Regex(strEmail);
            Regex cname = new Regex(cardName);
            Regex cnum = new Regex(cardNum);
            Regex exp = new Regex(expiration);
            Regex cvv = new Regex(strCvv);

            if (txtName.Text != string.Empty && name.IsMatch(txtName.Text))
            {
                args.IsValid = true;
            }

            else
            {
                args.IsValid = false;
                //validName.Visible = true;
            }

            if (txtEmail.Text != string.Empty && email.IsMatch(txtEmail.Text))
            {
                args.IsValid = true;
            }

            else
            {
                args.IsValid = false;
                //validEmail.Visible = true;
            }

            if (txtCName.Text != string.Empty && cname.IsMatch(txtCName.Text))
            {
                args.IsValid = true;
            }

            else
            {
                args.IsValid = false;
                //validCName.Visible = true;
            }

            if (txtCNumber.Text != string.Empty && cnum.IsMatch(txtCNumber.Text))
            {
                args.IsValid = true;
            }

            else
            {
                args.IsValid = false;
                //validCNumber.Visible = true;
            }

            if (txtExp.Text != string.Empty && exp.IsMatch(txtExp.Text))
            {
                args.IsValid = true;
            }

            else
            {
                args.IsValid = false;
                //validExp.Visible = true;
            }

            if (txtCvv.Text != string.Empty && cvv.IsMatch(txtCvv.Text))
            {
                args.IsValid = true;
            }

            else
            {
                args.IsValid = false;
                //validCvv.Visible = true;
            }
        }
    }
}