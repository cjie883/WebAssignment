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
                LinkButton1.Visible = false;
                LinkButton5.Text = "View Profile"; 
                LinkButton9.Text = "Logout";
                LinkButton2.Visible = false;

                if (Session["CustomerID"] != null)
                {
                    LinkButton10.Visible = true;
                    LinkButton13.Visible = true;
                    //LinkButton14.Visible = true;
                    
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
                Response.Redirect("CustomerProfile.aspx");
            }
            else
            {
                Response.Redirect("ArtistProfile.aspx");
            }

        }

        protected void LinkButton9_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Home.aspx");

        }

        protected void LinkButton10_Click(object sender, EventArgs e)
        {
            Response.Redirect("wish_list.aspx");
        }

        protected void LinkButton14_Click(object sender, EventArgs e)
        {
            Response.Redirect("Product.aspx");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("ArtistProduct.aspx");
        }

        protected void LinkButton13_Click(object sender, EventArgs e)
        {
            Response.Redirect("PaymentHistory.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        //protected void LinkButton15_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("ProductCategory.aspx");
        //}
    }
}