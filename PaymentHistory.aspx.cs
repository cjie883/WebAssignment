using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAssignment
{
    public partial class PaymentHistory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
             if (GridView1.Rows.Count == 0)
            {
                Image1.Visible = true;
                Label2.Visible = true;
                Label4.Visible = true;
                Label4.Text = "  <br /><br />";
                Label2.Text = "  Payment history is empty now  <br /><br /><br />";
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}