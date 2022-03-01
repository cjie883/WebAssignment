<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/HeaderFooter.Master" CodeBehind="About.aspx.cs" Inherits="WebAssignment.About" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
            <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
            <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
            <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
            <link href="css/aboutUs.css" rel="stylesheet">

    <div class="hero-image">
  <div class="hero-text">
    <h1>About Us</h1>
   
  </div>
</div>


    <div class="container-fluid text-center">
        <div class="row content">
            <div class="col-sm-2 sidenav bg-light text-dark">
            </div>
      
    <div class="col-sm-8 text-left shadow-sm p-3 mb-5 bg-white rounded">

        <div data-aos="fade-down">
            <h3 class="text-center p-5">Our History</h3>
            <p class="auto-style1">
                <img src="imgs/WSP_New1.png" width="350" height="160" /><br />
                Established in 2022, WSP Art Gallery is the brain child of art philanthropist and avid art collector Wong Soon Peng, Leong Jia Cheng and Lee Jin Shiun. Although initially started off by selling Chinese ink brush paintings from China, the gallery quickly made a name in the Malaysian art community to become a prominent art gallery holding between 12 to 15 exhibitions a year by local well-known artists.  
                <br /><br />
                WSP Art Gallery aims to appeal to a diverse audience and serve as a resource for those who are engaged in the arts and those for whom art is a new experience.

Through our exhibitions and public programmes, we seek to bring people into closer contact with the art, the artists and their ideas.

                <br /><br />
                <img src="imgs/artgallery1.jpg" width="700" height="400" />
                <br /><br />

                WSP Art Gallery, is a place to explore paintings from the past and present. Here, you can discover our current and past exhibitions, makes enquiries, view and perhaps own one of our collection of artworks or purchase our art books.

We stock mostly funny art, both contemporary and old masters and pioneers works by Genius Pioneer Artists such as Wong Soon Peng, Soen Peng Wong and Peng Soon Wong. We are here specially for art collectors, lovers, students, and educators who wish to discover, learn and collect art. Art is our philosophy
                <br/><br />
                
                <strong>**The above descriptions are not true and are only used within the scope of Web Application assignment.** <br />**Any similarity is purely coincidental.**</strong>
            </p>
        </div>
        <br /><br />
         <h3 class="p-5 text-center">Our Team</h3>
         
        <div class="m-5 pb-5" data-aos="fade-right">
        <img src="imgs/cat1.jpg" class="rounded-circle float-left">
        <h3 class="text-left">Leong Jia Cheng</h3>
        <hr>
        <p class="ml-2"> Leong Jia Cheng blablabla magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
      
      </div>
        
         <div class="bg-light m-5 pb-5" data-aos="fade-left">
             <img src="imgs/cat2.jpg" class="rounded-circle float-right">
             <h3 class="text-right">Wong Soon Peng</h3>
             <hr>
      <p>Wong Soen Peng sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
      </div>

        <div class="m-5 pb-5" data-aos="fade-right">
        <img src="imgs/cat3.jpg" class="rounded-circle float-left">
        <h3 class="text-left">Lee Jin Shiun</h3>
        <hr>
        <p class="ml-2"> Lee Jin Shiun Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
      
      </div>
    </div>
    <div class="col-sm-2 sidenav bg-light text-dark">
      </div>
    </div>
  </div>
        
        <div>
            <h1 class="partner text-center" data-aos="fade-up">Our Products</h1>
         <div class="wrapper" data-aos="fade-up" data-aos-duration="3000">
          <div class="slider">
            <div class="slide">
                <img src="imgs/m1.jpg" />
                <img src="imgs/l1.jpg" />
                <img src="imgs/c1.jpg" />
                <img src="imgs/c2.jpg" />
                <img src="imgs/m2.jpg" />
                <img src="imgs/l4.jpg" />
                <img src="imgs/l3.jpg" />
            </div>
            <div class="slide">
              <img src="imgs/c3.jpg" />
              <img src="imgs/l4.jpg" />
              <img src="imgs/m2.jpg" />
              <img src="imgs/m3.jpg" />
              <img src="imgs/c3.jpg" />
              <img src="imgs/l2.jpg" />
              <img src="imgs/c2.jpg" />
            </div>
          </div>
      </div>
        </div> 
        <footer>

    </footer>
  <jsp:include page="headerfooter/UserFooter.jsp" />
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <script type="text/javascript">
	AOS.init({
		duration : 1200,
	})
</script>
</asp:Content>
