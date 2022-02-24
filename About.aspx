<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/HeaderFooter.Master" CodeBehind="About.aspx.cs" Inherits="WebAssignment.About" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
        
         <h1 class="p-5 text-center">Our Team</h1>
         
        <div class="m-5 pb-5" data-aos="fade-right">
        <img src="imgs/team1.jpg" class="rounded-circle float-left">
        <h2 class="text-left">GY</h2>
        <hr>
        <p class="ml-2"> WSP e magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
      
      </div>
        
         <div class="bg-light m-5 pb-5" data-aos="fade-left">
             <img src="imgs/team2.jpg" class="rounded-circle float-right">
             <h2 class="text-right">ZY & ZQ</h2>
             <hr>
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
      </div>
       
         <div data-aos="fade-up">
             <div>
                <h1 class="text-center p-5">Our History</h1>
                <p class="text-left">
                    Founded in 1995 by Uncle Loong, XL-Shop.com is the premier importer of Japanese collectibles and the sole distributor of Hot Toys in Malaysia. With four outlets in Ampang, Times Square, Mid Valley, and Empire Shopping Gallery, XL-Shop aims to serve the needs and passion of collectors by offering the very best and latest in imported collectibles, all at a fair price point.<br><br>
                    Ever the pioneer, XL-Shop was the first collectible store in Malaysia to offer online shopping. For those who are too busy to visit our outlets, you can now do your shopping and purchasing anytime and anywhere through our online store and have your purchases delivered right to your doorstep. As an added benefit, we also offer free shipping (only applicable in West Malaysia) on most of our items.<br><br>
                    Not contend with just being a collectibles store, XL-Shop has also partnered with various companies to create our own line of limited edition Uncle Loong polo T-shirt, caps, lanyard, and a series of vinyl collectibles (which makes its debut in a Hong Kong toy fair), featuring characters from Uncle Loong Story (a series of weekly webcomic about collectors and their quirks, featuring artwork by renowned local artist Michael Chuah and stories by Uncle Loong himself; can be viewed on our website).<br><br>
                    As a statement to XL-Shop commitment to becoming an environment friendly company, an exclusive XL-Shop tote bag was launched. Instead of asking for plastic bags, consumers are encouraged to utilize the tote bag whenever they shop. With designs by Michael Chuah, you will look chic and smart and at the same time, play a part in the important role of preserving the environment.<br><br>
                    The year 2010 marks a milestone for XL-Shop with the publication of Uncle Loong Comics (a compilation of Uncle Loong Story) in three major languages. With exclusive never seen before artwork and content, Uncle Loong Comics is a worthy addition to your collection. Uncle Loong Comics is now available in all major bookstores and newsvendor.<br><br>
                    With the launch of the comic, XL-Shop.com is now more than just a collectible store. XL-Shop.com has become a brand and a symbol of passion for collectors in Malaysia. As they always say, the best is yet to come and XL-Shop.com is ever committed to bringing the best and the latest collectibles to all collectors out there. Your happiness is our pride and we count of your support for years to come.<br><br>
                </p>
            </div>
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
