<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/HeaderFooter.Master" CodeBehind="Gallery.aspx.cs" Inherits="WebAssignment.Gallery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <style>
        .item-1 {
            background-image: url("imgs/artist3.jpg");
        }

        .item-2 {
            background-image: url("imgs/artist2.jpg");
        }

        .item-3 {
            background-image: url("imgs/artist1.jpg");
        }

        .item-4 {
            background-image: url("imgs/artist4.jpg");
        }

        .item-5 {
            background-image: url("imgs/artist5.jfif");
        }
        .auto-style1 {
            margin-left: 70px;
        }
    </style>
    <link href="css/gallery.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Bangers' rel='stylesheet'>
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
            <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    
    <div class="bg-image1">
        <center><h1 data-aos="fade-down">Categories Of Galleries</h1>
            <p style="font-size: 18px; margin-bottom:35px;" data-aos="fade-down">You can choose your preferred artwork category below.</p><br />
            <div class="buttondesign" data-aos="flip-right">
            <div class="imageborder"><asp:ImageButton ID="ImageButton1" class="categoryimage" runat="server" ImageUrl="/imgs/scenery1.jpg" data-aos="flip-right" AlternateText="Cartoon" OnClick="ImageButton1_Click"/></div> 
                <b><asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click"  class="designtitle" Font-underline="False">Scenary</asp:LinkButton></b>
            </div>
           
            <div class="buttondesign" data-aos="flip-right">
            <div class="imageborder"><asp:ImageButton ID="ImageButton2" class="categoryimage" runat="server" ImageUrl="/imgs/portrait1.jpg" data-aos="flip-right" OnClick="ImageButton2_Click" /></div>
                <b><asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click" class="designtitle" Font-underline="false">Portrait</asp:LinkButton></b>
            </div>
              
            <div class="buttondesign" data-aos="flip-right">
            <div class="imageborder"><asp:ImageButton ID="ImageButton3" class="categoryimage" runat="server" ImageUrl="/imgs/abstract1.jpg" data-aos="flip-right" OnClick="ImageButton3_Click"/></div>
                <b><asp:LinkButton ID="LinkButton3" runat="server" Font-underline="false"  class="designtitle" OnClick="LinkButton3_Click">Abstract</asp:LinkButton></b></div>
            </center>
                <center>
                    <br />
                    <h3 style="margin: 40px;" data-aos="fade-down">- - - - - - - - - - Or - - - - - - - - - -</h3>
            <asp:Button ID="Button1" runat="server" class="viewallartbtn" Text="View All Artwork" data-aos="fade-down" OnClick="Button1_Click" />
                    </center>
    </div>

<div class="accodionbg">
    <center><h1 data-aos="fade-in"" class="auto-style1">Current Potential Artists</h1>
    <p style="font-size: 18px; margin-bottom:35px;" data-aos="fade-in">Most popular young female artist on instagram.</p><br /></center>
    <div class="containerbar">


        <div class="gallery-wrap" data-aos="fade-in">
            <a href="https://www.instagram.com/redhongyi/" target="_blank" class="item item-1"></a>
            <a href="https://www.instagram.com/miwakomatsu_official/?hl=en" target="_blank" class="item item-2"></a>
            <a href="https://www.instagram.com/lemon_zhaoxiaoli/" target="_blank" class="item item-3"></a>
            <a href="https://www.instagram.com/akianeart/?hl=en" target="_blank" class="item item-4"></a>
            <a href="https://www.instagram.com/dimitramilan/?hl=en " target="_blank" class="item item-5"></a>

        </div>
    </div>
</div>





    <h1 class="partner text-center" data-aos="fade-up">Our Products</h1>
         <div class="wrapper" data-aos="fade-up" data-aos-duration="3000">
          <div class="slider">
            <div class="slide">
                <img src="imgs/Mona_Lisa.jpg" />
                <img src="imgs/Improvisation._Dreamy.jpg" />
                <img src="imgs/Improvisation._Deluge.jpg" />
                <img src="imgs/Ribbon_with_Square.jpg" />
                <img src="imgs/Composition_VII.jpg" />
                <img src="imgs/p2.jpg" />
                <img src="imgs/p1.jpg" />
            </div>
            <div class="slide">
              <img src="imgs/Mona_Lisa.jpg" />
                <img src="imgs/Improvisation._Dreamy.jpg" />
                <img src="imgs/Improvisation._Deluge.jpg" />
                <img src="imgs/Ribbon_with_Square.jpg" />
                <img src="imgs/Composition_VII.jpg" />
                <img src="imgs/p2.jpg" />
                <img src="imgs/p1.jpg" />
            </div>
          </div>
      </div>
    



    <script>
var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
    slides[slideIndex - 1].style.display = "block";
    slides[slideIndex - 1].style.opacity = 1;
  dots[slideIndex-1].className += " active";
}
    </script>
    <script type="text/javascript">
        AOS.init({
            duration: 1200,
        })
</script>
</asp:Content>