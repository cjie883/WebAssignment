using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAssignment
{
    public partial class Gallery : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            string category = "cartoon";
            Session["Category"] = category;
            Response.Redirect("ProductSub.aspx");
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            string category = "lisa";
            Session["Category"] = category;
            Response.Redirect("ProductSub.aspx");
        }

        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {
            string category = "abstract";
            Session["Category"] = category;
            Response.Redirect("ProductSub.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            string category = "cartoon";
            Session["Category"] = category;
            Response.Redirect("ProductSub.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            string category = "lisa";
            Session["Category"] = category;
            Response.Redirect("ProductSub.aspx");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            string category = "abstract";
            Session["Category"] = category;
            Response.Redirect("ProductSub.aspx");
        }

        protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
        {
            int Art_Id = 3031;
            Response.Redirect(string.Format("ProductDetails.aspx?Art_Id={0}", Art_Id), false);
        }

        protected void ImageButton5_Click(object sender, ImageClickEventArgs e)
        {
            int Art_Id = 3009;
            Response.Redirect(string.Format("ProductDetails.aspx?Art_Id={0}", Art_Id), false);
        }

        protected void ImageButton6_Click(object sender, ImageClickEventArgs e)
        {
            int Art_Id = 3005;
            Response.Redirect(string.Format("ProductDetails.aspx?Art_Id={0}", Art_Id), false);
        }

        protected void ImageButton7_Click(object sender, ImageClickEventArgs e)
        {
            int Art_Id = 3002;
            Response.Redirect(string.Format("ProductDetails.aspx?Art_Id={0}", Art_Id), false);
        }

        protected void ImageButton8_Click(object sender, ImageClickEventArgs e)
        {
            int Art_Id = 3025;
            Response.Redirect(string.Format("ProductDetails.aspx?Art_Id={0}", Art_Id), false);
        }

        protected void ImageButton9_Click(object sender, ImageClickEventArgs e)
        {
            int Art_Id = 3006;
            Response.Redirect(string.Format("ProductDetails.aspx?Art_Id={0}", Art_Id), false);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Product.aspx");
        }
    }
}