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
    public partial class CustomerProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
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

                    Label2.Text = Session["CustomerID"].ToString();
                    Label4.Text = Session["CustomerName"].ToString();
                    Label6.Text = Session["CustomerUsername"].ToString();
                    if (Session["CustomerGender"].ToString() == "M" || Session["CustomerGender"].ToString() == "m")
                    {
                        Label10.Text = "Male";
                    }
                    else if (Session["CustomerGender"].ToString() == "F" || Session["CustomerGender"].ToString() == "f")
                    {
                        Label10.Text = "Female";
                    }
                    Label12.Text = Session["CustomerPhone"].ToString();
                    Label14.Text = Session["CustomerEmail"].ToString();
                    Label16.Text = Session["CustomerAddress"].ToString();
                }
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustomerProfileEdit.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditPassword.aspx");
        }
    }
}