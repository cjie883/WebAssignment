<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/HeaderFooter.Master" CodeBehind="Home.aspx.cs" Inherits="WebAssignment.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    
    <meta charset="UTF-8">
    <meta name="viewport" content="width-device-width, initial-scale=1.0">
    <link href="css/home.css" rel="stylesheet" type="text/css">

    <section class="showcase">
        <header>
          <h2 class="logo">ARTDIST</h2>
        </header>

        
        <div class="overlay"></div>
        <video src="video/home.mp4" muted loop autoplay></video>
        <div class="text">
          <h2>Never Stop To </h2>
          <h3>Exploring The World</h3>
          <p>We have got plenty of cool stuff in store for you right now,</p>
          <p>and plenty more coming your way.</p>
          <a href="art.aspx">Explore</a>    
          <a href="art.aspx" style="background: white;text-align: center;padding-left: 85px;"><img style="text-align: center;width:15%;" src="imgs/Artdist.png"></a>
        </div>
    
        <ul class="social">
          <li><a href="#"><img src="https://i.ibb.co/x7P24fL/facebook.png"></a></li>
          <li><a href="#"><img src="https://i.ibb.co/Wnxq2Nq/twitter.png"></a></li>
          <li><a href="https://www.instagram.com/yugi_0516/"><img src="https://i.ibb.co/ySwtH4B/instagram.png"></a></li>
        </ul>    
    </section>

</asp:Content>