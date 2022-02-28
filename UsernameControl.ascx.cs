using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAssignment
{
    public partial class UsernameControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CustomerID"] != null)
            {
                usernametext.Text = Session["CustomerUsername"].ToString();
            }
            else if (Session["ArtistID"] != null)
            {
                usernametext.Text = Session["ArtistUsername"].ToString();
            }
            else
            {
                usernametext.Visible = false;
            }
        }

    }
}