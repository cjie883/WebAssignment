<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/HeaderFooter.Master" CodeBehind="Gallery.aspx.cs" Inherits="WebAssignment.Gallery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <style>
        @import url('https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800,900&display=swap');
        *{
           font-family: 'Poppins', sans-serif;
        }

        html, body {
    max-width: 100%;
    overflow-x : hidden;
}

        .bg-image1 {
  background-image: linear-gradient(rgba(0, 0, 0, 0.527),rgba(0, 0, 0, 0.5)), url("imgs/category_background.jpg");

  height: 450px;
  position:relative;
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
    background-color:black;
}

        .bg-image2 {
            background-image: linear-gradient(rgba(0, 0, 0, 0.527),rgba(0, 0, 0, 0.5)),url("imgs/galerybackground3.jpg");
  
  height: 500px;

    background-position: bottom;
    background-repeat: no-repeat;
    background-size: cover;
    border-bottom: 1px solid whitesmoke;
}

  .bg-image3 {
  background-image: linear-gradient(rgba(0, 0, 0, 0.527),rgba(0, 0, 0, 0.5)),url("imgs/gallerybackground4.jpg");

  height: 1000px;

    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;

    color:lightgrey;
}

  .imageborder{
      border : 4px solid white;
      width : 258px;
      height : 257px;
      display:inline-block;
      margin-left : 75px;
      margin-right : 75px;
      z-index : -1;
  }

        .categoryimage {
            filter:brightness(50%);
            width: 250px;
            height: 250px;
            transition : all 0.5s;
        }

        .categoryimage:hover{
            filter:brightness(70%);
        }

        .viewallartbtn{
             
            border-radius : 10px 10px 10px 10px;
            background-color: black;
            border-color:white;
  color: #FFFFFF;
  text-align: center;
  font-size: 20px;
  padding: 15px 30px 15px 30px;
  transition: all 0.5s;
  cursor: pointer;
        font-weight: 400;
 text-transform:uppercase;
 margin-top:20px;
        }

        .viewallartbtn:hover{
            background-color:white;
            color: black;
        }

        h1{
            color:white;
            letter-spacing:2px;
            font-size :60px;
        }

        .artistimage{
            border: 3px solid white;
            border-radius : 50%;
        }

        .text{
            color : white;
        }

        .prev, .next {
  cursor: pointer;
  position: absolute;
  top:726px;
  font-weight: bold;
  font-size: 60px;
  border-radius: 0 3px 3px 0;
  user-select: none;
}

        .next {
  right: 12.5%;
  border-radius: 3px 0 0 3px;
}

.dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin-left: 1%;
  background-color: #717171;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.dot:hover {
  background-color: #bbb;
}

.dot.active{
  background-color: #bbb;
}

.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 60s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: 0} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: 0} 
  to {opacity: 1}
}
    </style>
    <link href="css/gallery.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Bangers' rel='stylesheet'>
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
            <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    
    <div class="bg-image1">
        <center><h1>Gallery</h1>
            <div class="imageborder"><asp:ImageButton ID="ImageButton1" class="categoryimage" runat="server" ImageUrl="/imgs/c1.jpg" AlternateText="Cartoon" OnClick="ImageButton1_Click"/></div>
                <b><asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" Font-underline="False" style="position:absolute; margin-top:93px; margin-left:-300px; color:azure; font-size:270%; z-index:3;">Cartoon</asp:LinkButton></b>
                
            <div class="imageborder"><asp:ImageButton ID="ImageButton2" class="categoryimage" runat="server" ImageUrl="/imgs/l1.jpg" OnClick="ImageButton2_Click" /></div>
                <b><asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click" Font-underline="false"  style="position:absolute; margin-top:93px; margin-left:-250px; color:azure; font-size:270%; z-index:3;">Lisa</asp:LinkButton></b>
              
            <div class="imageborder"><asp:ImageButton ID="ImageButton3" class="categoryimage" runat="server" ImageUrl="/imgs/m1.jpg" OnClick="ImageButton3_Click"/></div>
                <b><asp:LinkButton ID="LinkButton3" runat="server" Font-underline="false" style="position:absolute; color:azure; font-size:270%; margin-top:93px; margin-left:-300px; z-index:3;" OnClick="LinkButton3_Click">Abstract</asp:LinkButton></b>
            </center>
                <center>
            <asp:Button ID="Button1" runat="server" class="viewallartbtn" Text="View All Artwork" OnClick="Button1_Click" />
                    </center>
    </div>
    
    <hr style="background-color:whitesmoke;border:none;height:1px;margin-top: -1%;"/>
    <div class="bg-image2">
        <br />
        <div class="slideshow-container" style="background-color:rgba(0,0,0,0.5); width:75%; height: 90%;margin:auto;">

            <div class="mySlides fade">
                <br />
            <div style="width:90%; margin-left:8%; height:90%;">
                <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="/imgs/c10.jpg" class="slideimage" width="350" height="350" style="margin-top:2%; border:5px solid white;" OnClick="ImageButton4_Click"/>
            <b style="color:white; font-size:40px; position:absolute; margin-top:16px; margin-left:59px;">Yogi-Oh</b>
            <label style="position:absolute; color:white; margin-top:75px; margin-left:65px">by Justin Barber</label>
                <hr style="background-color:whitesmoke;border:none; width:45%; height:2px;margin-top:-270px; margin-left:415px;"/>
                <p style="position:absolute; color:white; margin-top:-5px; margin-left:415px;">
                    Yogi-oh art is draw by yogi from year 2021. It is a Japanese for<br />
                    ("Game King" or "King of Games") is a popular Japanese anime<br />
                    and manga franchise from Kazuki that mainly involves characters<br />
                     who play a card game called Duel Monsters (originally called<br />
                    Magic & Wizards in the manga. See the section "Card game" below<br /> 
                    for different names of  the game) where in each player purchases<br />
                    and assembles a Deck of Monster, Spell, and Trap Cards in order<br />
                    to defeat one another and gain victory.<br />
                </p>
            </div>
            </div>

            <div class="mySlides fade">
            <br />
            <div style="width:90%; margin-left:8%; height:90%;">
                <asp:ImageButton ID="ImageButton5" runat="server" ImageUrl="/imgs/l3.jpg" class="slideimage" width="350" height="350" style="margin-top:2%; border:5px solid white;" OnClick="ImageButton5_Click"/>
            <b style="color:white; font-size:40px; position:absolute; margin-top:16px; margin-left:59px">Bean Lisa</b>
            <label style="position:absolute; color:white; margin-top:75px; margin-left:65px">by John Beana</label>
                <hr style="background-color:whitesmoke;border:none; width:45%; height:2px;margin-top:-270px; margin-left:415px;"/>
                <p style="position:absolute; color:white; margin-top:-5px; margin-left:415px;">
                    Bean lisa art is draw by mr bean from year 2021. It is a half-length <br />
                    portrait painting by Italian artist Leonardo da Vinci. Considered<br />
                    an archetypal masterpiece of the Italian Renaissance, it has been<br />
                    described as "the best known, the most visited, the most written<br />
                    about, the most sung about, the most parodied work of art in the<br />
                    world".
                </p>
            </div>
            </div>


            <div class="mySlides fade">
            <br />
            <div style="width:90%; margin-left:8%; height:90%;">
                <asp:ImageButton ID="ImageButton6" runat="server" ImageUrl="/imgs/m2.jpg" class="slideimage" width="350" height="350" style="margin-top:2%; border:5px solid white;" OnClick="ImageButton6_Click"/>
            <b style="color:white; font-size:40px; position:absolute; margin-top:16px; margin-left:59px">Castle</b>
            <label style="position:absolute; color:white; margin-top:75px; margin-left:65px">by Bean Trump</label>
                <hr style="background-color:whitesmoke;border:none; width:45%; height:2px;margin-top:-270px; margin-left:415px;"/>
                <p style="position:absolute; color:white; margin-top:-5px; margin-left:415px;">
                    Castle art is draw by dog from year 2021. It is a former capital<br />
                    of the Imperial province of Sylvania during the reign of its last<br />
                    Imperial noble, Count Otto von Drak. Nearly all the rulers of <br />
                    Sylvania, living and Undead alike, have made the castle their <br />
                    seat of power.
                </p>
            </div>
            </div>

            <div class="mySlides fade">
            <br />
            <div style="width:90%; margin-left:8%; height:90%;">
                <asp:ImageButton ID="ImageButton7" runat="server" ImageUrl="/imgs/c2.jpg" class="slideimage" width="350" height="350" style="margin-top:2%; border:5px solid white;" OnClick="ImageButton7_Click"/>
            <b style="color:white; font-size:40px; position:absolute; margin-top:16px; margin-left:59px">Pokemon</b>
            <label style="position:absolute; color:white; margin-top:75px; margin-left:65px">by Justin Barber</label>
                <hr style="background-color:whitesmoke;border:none; width:45%; height:2px;margin-top:-270px; margin-left:415px;"/>
                <p style="position:absolute; color:white; margin-top:-5px; margin-left:415px;">
                    Pokemon art is art is draw by dokemon from year 2001. It is a is<br />
                    a Japanese media franchise managed by The Pokémon Company, a <br />
                    company founded by Nintendo, Game Freak, and Creatures. The <br />
                    franchise was created by Satoshi Tajiri in 1995,and is centered<br />
                    on fictional creatures called "Pokémon". In Pokémon, humans, <br />
                    known as Pokémon Trainers, catch and train Pokémon to battle <br />
                    other Pokémon for sport. 
                </p>
            </div>
            </div>

            <div class="mySlides fade">
            <br />
            <div style="width:90%; margin-left:8%; height:90%;">
                <asp:ImageButton ID="ImageButton8" runat="server" ImageUrl="/imgs/l8.jpg" class="slideimage" width="350" height="350" style="margin-top:2%; border:5px solid white;" OnClick="ImageButton8_Click"/>
            <b style="color:white; font-size:40px; position:absolute; margin-top:16px; margin-left:59px;">Superman Lisa</b>
            <label style="position:absolute; color:white; margin-top:75px; margin-left:65px;">by John Beana</label>
                <hr style="background-color:whitesmoke;border:none; width:45%; height:2px;margin-top:-270px; margin-left:415px;"/>
                <p style="position:absolute; color:white; margin-top:-5px; margin-left:415px;">
                    Superman lisa art is draw by Superman from year 1999. It is a <br />
                    half-length portrait painting by Italian artist Leonardo da Vinci.<br />
                    Considered an archetypal masterpiece of the Italian Renaissance,<br />
                    it has been described as "the best known, the most visited, the <br />
                    most written about, the most sung about, the most parodied work <br />
                    of art in the world".
                </p>
            </div>
            </div>

            <div class="mySlides fade">
            <br />
            <div style="width:90%; margin-left:8%; height:90%;">
                <asp:ImageButton ID="ImageButton9" runat="server" ImageUrl="/imgs/m3.jpg" class="slideimage" width="350" height="350" style="margin-top:2%; border:5px solid white;" OnClick="ImageButton9_Click"/>
            <b style="color:white; font-size:40px; position:absolute; margin-top:16px; margin-left:59px;">Colorful Eye</b>
            <label style="position:absolute; color:white; margin-top:75px; margin-left:65px;">by Bean Trump</label>
                <hr style="background-color:whitesmoke;border:none; width:45%; height:2px;margin-top:-270px; margin-left:415px;"/>
                <p style="position:absolute; color:white; margin-top:-5px; margin-left:415px;">
                    Colorful eye art is draw by dog from year 2021. It is a series of <br />
                    books published by N.E. Thing Enterprises (renamed in 1996 to Magic<br />
                    Eye Inc.). The books feature autostereograms, which allow some people<br />
                    to see 3D images by focusing on 2D patterns. The viewer must diverge<br />
                    their eyes in order to see a hidden three-dimensional image within the<br />
                    pattern. The term "Magic Eye" has become something of a genericized<br />
                    trademark, often used to refer to autostereograms of any origin.
                </p>
            </div>
            </div>


            <a class="prev" onclick="plusSlides(-1)" style="color:white; margin-left:1%;">&#10094;</a>
            <a class="next" onclick="plusSlides(1)" style="color:white; margin-right:1%;">&#10095;</a>

            <div style="text-align:center; margin-top:280px;">
  <span class="dot" onclick="currentSlide(1)"></span> 
  <span class="dot" onclick="currentSlide(2)"></span> 
  <span class="dot" onclick="currentSlide(3)"></span> 
<span class="dot" onclick="currentSlide(4)"></span> 
                <span class="dot" onclick="currentSlide(5)"></span> 
                <span class="dot" onclick="currentSlide(6)"></span> 
</div>

        </div>
    </div>



    <div class="bg-image3">
    <center>
        <br />

        <h1> Popular Artist </h1>
        <div style=" height:300px;" data-aos="fade-right">
        <img src="/imgs/a1.jpg" class="artistimage" width="230" height="230" style="margin-top:3%; margin-right:70%"/>
            <h2 class="text" style="margin-top:-13%; margin-right:32%;">Justin Barber</h2>
        <p class="text" style="margin-left:27.5%; text-align:left;">
            Justin Barber, born in 2070 at Cyberpunk, an artist who is popular in drawing cartoon.<br />
            His father, Justin Beanberbake, a person who inspired him in drawing cartoon when he is<br />
            6 years old. His most popular drawing is the "Yogi-Oh" which already sales for 10000000<br /> 
            quantity all around the world. He is also known as the "Art Genius" in his hometown <br />
            Cyperpunk 2077.
        </p>
        </div>
        <br />
        <div style=" height:300px; margin-top:-1.5%;" data-aos="fade-left">
        <img src="/imgs/bean cena.jpg" class="artistimage" width="230" height="230" style="margin-top:3%; margin-left:70%"/>
            <h2 class="text" style="margin-top:-13%; margin-left:32%;">John Beana</h2>
        <p class="text" style="margin-right:28%; text-align:right;">
            John Beana, born in 2021 at USA, an artist who is popular in drawing lisa. His mother,<br />
            Samantha Beana, a person who inspired him in drawing lisa when he is 7 years old.<br />
            His most popular drawing is the "Bean Lisa" which already sales 12345678 all around<br />
            world. He is also known as the "The Bean Genius" in his hometown, Beanmerica.<br />
        </p>
        <br />
            </div>
        <div style=" height:300px;" data-aos="fade-right">
        <img src="/imgs/beanTrump.jpg" class="artistimage" width="230" height="230" style="margin-top:3%; margin-right:70%"/>
            <h2 class="text" style="margin-top:-13%; margin-right:33.5%;">Bean Trump</h2>
        <p class="text" style="margin-left:27.1%; text-align:left;">
            Bean Trump, born in 2021 at Russia, an artist who is popular in drawing abstract.<br />
            His grandfather, Duck Trump, a person who inspired him in drawing abstract when he is<br />
            5 years old. His most popular drawing is the "Castle" which already sales for 98765421<br /> 
            quantity all around the world. He is also known as the "King of Vaccine" in his hometown <br />
            Trumpetrica.

        </p>
            </div>
    </center>
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