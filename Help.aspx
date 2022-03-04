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
    <h1 data-aos="fade-down">Frequently-asked Questions</h1>
    <div class="accordion-wrapper"  data-aos="fade-up">
        <div class="accordion">
            <input type="radio" name="radio-a" id="check1" checked>
            <label class="accordion-label" for="check1">How to find our web application?</label>
            <div class="accordion-content">
                <img style="height: 250px;" src="imgs/s1.jpg" class="mx-auto d-block mb-3">
                <p>
                    Open any browser from any electronic device and search for the keyword "WSP Art Gallery" to discover us! Or you can find us through major social media including facebook, youtube and istagram!
                </p>
            </div>
        </div>
        <div class="accordion">
            <input type="radio" name="radio-a" id="check2">
            <label class="accordion-label" for="check2">How to make an order?</label>
            <div class="accordion-content">
                <img style="height: 250px;" src="imgs/s2.jpg" class="mx-auto d-block mb-3">
                    <p>
                        After opening our web application, you can reach the art sales interface by single-clicking the gallery in the upper menu bar. In this interface, you can view all works of art including information and the prices of works. Also, there will be an add to cart button below each item, in order to make a purchase
                    </p>
            </div>
        </div>
        <div class="accordion">
            <input type="radio" name="radio-a" id="check3">
            <label class="accordion-label" for="check3">How to make payment?</label>
            <div class="accordion-content">
                <img style="height: 250px;" src="imgs/s3.jpg" class="mx-auto d-block mb-3">
                    <p>
                        After the item is successfully added to the shopping cart, you can press the following button, which is check out button to proceed to the payment step, and you can make the transaction through online transfer or credit card.
                    </p>
            </div>
        </div>
        <div class="accordion">
            <input type="radio" name="radio-a" id="check4">
            <label class="accordion-label" for="check4">How long will it take to deliver?</label>
            <div class="accordion-content">
                <img style="height: 250px;" src="imgs/s4.jpg" class="mx-auto d-block mb-3">
                    <p>
                        After successful payment, we will ship the goods within 1-3 working days, and entrust professional deliverymen to help us deliver the items to your doorstep.
                    </p>
            </div>
        </div>
         <div class="accordion">
            <input type="radio" name="radio-a" id="check5">
            <label class="accordion-label" for="check5">How to receive parcel items?</label>
            <div class="accordion-content">
                <img style="height: 250px;" src="imgs/s5.jpg" class="mx-auto d-block mb-3">
                    <p>
                        A professional delivery man will deliver to the correct address, and you need to verify your identity with the delivery man in order to receive your parcel.
                    </p>
            </div>
        </div>
    </div>



    <jsp:include page="headerfooter/UserFooter.jsp" />
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        AOS.init({
            duration: 1200,
        })
    </script>
</asp:Content>
