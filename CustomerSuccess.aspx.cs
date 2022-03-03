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
    public partial class CustomerSuccess : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CustomerRegisterName"] != null)
            {
                SqlConnection con;
                string strCon = ConfigurationManager.ConnectionStrings["Artdist"].ConnectionString;

                con = new SqlConnection(strCon);
                con.Open();
                String query = "SELECT TOP 1 * FROM CUSTOMER ORDER BY Customer_Id DESC";
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataReader dtrInfo = cmd.ExecuteReader();

                if (dtrInfo.Read())
                {
                    Label2.Text = (dtrInfo.GetInt32(dtrInfo.GetOrdinal("Customer_Id"))).ToString();
                    Label4.Text = (dtrInfo.GetString(dtrInfo.GetOrdinal("Customer_Name"))).ToString();
                    Label6.Text = (dtrInfo.GetString(dtrInfo.GetOrdinal("Customer_Username"))).ToString();
                    String gender = (dtrInfo.GetString(dtrInfo.GetOrdinal("Customer_Gender"))).ToString();
                    if (gender == "M" || gender == "m")
                    {
                        Label8.Text = "Male";
                    }
                    else if (gender == "F" || gender == "f")
                    {
                        Label8.Text = "Female";
                    }
                    Label10.Text = (dtrInfo.GetString(dtrInfo.GetOrdinal("Customer_Phone"))).ToString();
                    Label12.Text = (dtrInfo.GetString(dtrInfo.GetOrdinal("Customer_Email"))).ToString();
                    Label14.Text = (dtrInfo.GetString(dtrInfo.GetOrdinal("Customer_Address"))).ToString();
                }
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustomerLogin.aspx");
        }
    }

}