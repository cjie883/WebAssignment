<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/HeaderFooter.Master" CodeBehind="Help.aspx.cs" Inherits="WebAssignment.Help" %>
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
            <link href="css/help.css" rel="stylesheet">

    <div class="m-5">
            
        </div>
           
            
            <div class="container-fluid text-center">    
  <div class="row content">
    <div class="col-sm-2 sidenav ">
        
    </div>
      
    <div class="col-sm-8 text-left shadow p-3 mb-5 bg-white rounded"> 
         <h1 class="text-center m-5">How to Purchase</h1>
         
         <div class="m-5 pb-5">
                <h2 class="text-center" data-aos="fade-down">STEP: 1</h2>
               <hr>
               <img style="height: 250px;" src="imgs/howto-01.jpg" class="mx-auto d-block mb-3" data-aos="flip-left">
               <p class="text-center" data-aos="fade-up">Browse our website and choose the items you like by clicking the "Add to<br>cart" button. You can add as many items as you want into the shopping<br>cart. After that, you can checkout by filling your information in a simple<br>form. During checkout, you DO NOT have to make any payment.<br><br></p>
               <hr>
        </div>
         
         <div class="m-5 pb-5">
                <h2 class="text-center" data-aos="fade-down">STEP: 2</h2>
               <hr>
               <img style="height: 250px;" src="imgs/howto-02.jpg" class="mx-auto d-block mb-3" data-aos="flip-right">
               <p class="text-center" data-aos="fade-up">After receiving your order, we will calculate the shipping cost for your<br>order, we will email you the total shipping cost in less than 48 hours.<br><br></p>
               <hr>
        </div>
        
          <div class="m-5 pb-5">
                <h2 class="text-center" data-aos="fade-down">STEP: 3</h2>
               <hr>
               <img style="height: 250px;" src="imgs/howto-03.jpg" class="mx-auto d-block mb-3" data-aos="flip-left">
               <p class="text-center" data-aos="fade-up">Once you have received shipping cost from us, you can make payment<br>now. We offer different payment methods for you to choose from, please<br>refer to<strong>Buyers Guide</strong> below to learn more.<br><br></p>
               <hr>
        </div>
         
         <div class="m-5 pb-5">
                <h2 class="text-center" data-aos="fade-down">STEP: 4</h2>
               <hr>
               <img style="height: 250px;" src="imgs/howto-04.jpg" class="mx-auto d-block mb-3" data-aos="flip-right">
               <p class="text-center" data-aos="fade-up">After your payment has been received, your items will be delivered by<br>Express Mail Service(EMS). The items should be arrived within 3 - 5 days<br>depends on your location.<br><br></p>
               <hr>
        </div>
           
    </div>
    <div class="col-sm-2 sidenav ">
        
      </div>
    </div>
  </div>
            
     
        
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