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
    public partial class ProductCategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Category_Click(object sender, EventArgs e)
        {
            LinkButton lnkRowSelection = (LinkButton)sender;
            //Get the Recipe id from command argumen tof linkbutton
            string Category = lnkRowSelection.CommandArgument.ToString();

            // pass Recipe idto another page via query string
          

            Session["Category"] = Category;

            if (Category == "all")
            {
                Response.Redirect("Product.aspx");
            }
            else
            {
                Response.Redirect("ProductSub.aspx");
            }

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            // retrieve data from db-Info where ID=@ID
            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["Artdist"].ConnectionString;
            lblDisplay.Text = strCon;

            con = new SqlConnection(strCon);
            con.Open();

            //string strSelect = "Select Art_Category from ART where Art_Category=@bcd";
            string strSelect = "SELECT DISTINCT [Art_Category] FROM[ART] WHERE([Art_Category] LIKE '%' + @bcd + '%')";
            SqlCommand cmdSelect = new SqlCommand(strSelect, con);
            cmdSelect.Parameters.AddWithValue("@bcd", txtID.Text.ToUpper());

            SqlDataReader dtrInfo = cmdSelect.ExecuteReader();

            string msg = "";
            int found = 0;

            if (dtrInfo.HasRows)// has record(s)
            {
                while (dtrInfo.Read())
                {
                    msg = "Category found~";
                    found++;
                    //LinkButton1.Visible = true;
                    Session["Category"] = dtrInfo["Art_Category"].ToString();
                    //LinkButton1.Text = dtrInfo["Art_Category"].ToString();
                    //LinkButton1.CommandArgument = dtrInfo["Art_Category"].ToString();
                    //Session["Pass_Category"] = txtID.Text;
                    //break;
                }
            }
            else
            {
                lblDisplay.Text = "No Category found~";
                lblDisplay2.Visible = true;
            }

            if (found > 0)
            {
                lblDisplay.Text = msg;
                lblDisplay2.Visible = true;
            }
            lblDisplay2.Text = " (" + found + " records)";

            con.Close();
        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}