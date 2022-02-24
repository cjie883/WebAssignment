using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAssignment
{
    public partial class HeaderFooter : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CustomerUsername"] != null && Session["CustomerID"] != null || Session["ArtistUsername"] != null && Session["ArtistID"] != null)
            {

                LinkButton4.Visible = true;
                LinkButton1.Visible = false;
                LinkButton5.Text = "View Profile";
                LinkButton7.Text = "Edit Profile";
                LinkButton9.Text = "Logout";
                LinkButton2.Visible = false;

                if (Session["CustomerID"] != null)
                {
                    LinkButton10.Visible = true;
                    LinkButton13.Visible = true;
                    //LinkButton14.Visible = true;
                    LinkButton15.Visible = true;
                }
                else
                {
                    LinkButton3.Visible = true;
                }
            }
        }
        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            if (Session["CustomerUsername"] != null && Session["CustomerID"] != null)
            {
                Response.Redirect("CustomerViewProfile.aspx");
            }
            else
            {
                Response.Redirect("ArtistViewProfile.aspx");
            }

        }

        protected void LinkButton7_Click(object sender, EventArgs e)
        {
            if (Session["CustomerUsername"] != null && Session["CustomerID"] != null)
            {
                Response.Redirect("CustomerEditProfile.aspx");
            }
            else
            {
                Response.Redirect("ArtistEditProfile.aspx");
            }
        }

        protected void LinkButton9_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("home.aspx");

        }

        protected void LinkButton10_Click(object sender, EventArgs e)
        {
            Response.Redirect("wish_list.aspx");
        }

        protected void LinkButton14_Click(object sender, EventArgs e)
        {
            Response.Redirect("art.aspx");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("maintain_product.aspx");
        }

        protected void LinkButton13_Click(object sender, EventArgs e)
        {
            Response.Redirect("PaymentHistory.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("SelectRegister.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("SelectLogin.aspx");
        }

        protected void LinkButton15_Click(object sender, EventArgs e)
        {
            Response.Redirect("category.aspx");
        }
    }
}