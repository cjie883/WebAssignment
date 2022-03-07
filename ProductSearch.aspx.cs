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
    public partial class ProductSearch : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, ImageClickEventArgs e)
        {

            ImageButton lnkRowSelection = (ImageButton)sender;
            //Get the Recipe id from command argumen tof linkbutton
            string Art_Id = lnkRowSelection.CommandArgument.ToString();

            // pass Recipe idto another page via query string
            Response.Redirect(string.Format("ProductDetails.aspx?Art_Id={0}", Art_Id), false);
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            // retrieve data from db-Info where ID=@ID
            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["Artdist"].ConnectionString;
            //lblDisplay.Text = strCon;

            con = new SqlConnection(strCon);
            con.Open();

            string strSelect = "SELECT[Art_Id], [Art_Image], [Art_Name], [Art_Price] FROM[ART] WHERE([Art_Name] LIKE '%' + @Art_Name + '%')";
            //SELECT[Art_Id], [Art_Image], [Art_Name], [Art_Price] FROM[ART] WHERE([Art_Name] LIKE '%' + @Art_Name + '%')



            SqlCommand cmdSelect = new SqlCommand(strSelect, con);
            cmdSelect.Parameters.AddWithValue("@Art_Name", txtID.Text.ToUpper());


            SqlDataReader dtrInfo = cmdSelect.ExecuteReader();

            string msg = "";
            int found = 0;

            if (dtrInfo.HasRows)// has record(s)
            {
                while (dtrInfo.Read())
                {
                    msg = "Art Found";
                    found++;
                }
            }
            else
            {
                Label1.Visible = true;
                Label2.Text = "No Art found.";
            }

            if (found > 0)
            {
                Label2.Text = msg;
                Label1.Visible = true;
            }
            Label1.Text = found + " records";

            con.Close();
        }

    }
}