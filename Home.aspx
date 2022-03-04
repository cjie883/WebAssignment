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
          <h2>Never Stop To </h2>
          <h3>Exploring The World</h3>
          <p>We've got a lot of cool art for you right now, </p>
          <p>just waiting for you to bring them home.</p>
          <a href="art.aspx">Explore</a>  
          <a href="About.aspx">About Us</a>
        </div>
    
        <ul class="social">
          <li><a href="https://www.facebook.com/dissy.official"><img src="https://i.ibb.co/x7P24fL/facebook.png" style="margin-right:18px"></a></li>
          <li><a href="#"><img src="https://i.ibb.co/Wnxq2Nq/twitter.png"></a></li>
          <li><a href="https://www.instagram.com/dissy.official/"><img src="https://i.ibb.co/ySwtH4B/instagram.png"></a></li>
        </ul> 
        
         
    </section>

</asp:Content>