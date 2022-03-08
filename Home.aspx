<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/HeaderFooter.Master" CodeBehind="Home.aspx.cs" Inherits="WebAssignment.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    
    <meta charset="UTF-8">
    <meta name="viewport" content="width-device-width, initial-scale=1.0">
    <link href="css/home.css" rel="stylesheet" type="text/css">

    <section class="showcase">
        <header>
          <h2 class="logo">WSP Art Gallery</h2>
        </header>

        
        <div class="overlay"></div>
        <video src="video/Comp.mp4" muted loop autoplay></video>
        <div class="text">
          <h3>keep Explore World</h3>
          <h4>With Beautiful Art</h4>
          <p>A lots of Cool and Beautiful Art Available Here </p>
          <p>Please take a look and Bring it Back Home Now</p>
          <a href="Product.aspx">Explore</a>  
          <a href="About.aspx">About Us</a>
        </div>
    
        <ul class="social">
          <li><a href="https://www.facebook.com/dissy.official"><img src="https://i.ibb.co/x7P24fL/facebook.png" style="margin-right:18px"></a></li>
          <li><a href="#"><img src="https://i.ibb.co/Wnxq2Nq/twitter.png"></a></li>
          <li><a href="https://www.instagram.com/dissy.official/"><img src="https://i.ibb.co/ySwtH4B/instagram.png"></a></li>
        </ul> 
        
         
    </section>

</asp:Content>