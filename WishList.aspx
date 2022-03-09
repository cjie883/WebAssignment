<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/HeaderFooter.Master" CodeBehind="WishList.aspx.cs" Inherits="WebAssignment.WishList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <link href="css/animation.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
    <style>
                .auto-style1 {
            height: 356px;
        }
        .auto-style2 {
            margin-right: 115px;
        }
        .glow {
  font-size: 50px;
  color: #fff;
  text-align: center;
  -webkit-animation: glow 1s ease-in-out infinite alternate;
  -moz-animation: glow 1s ease-in-out infinite alternate;
  animation: glow 1s ease-in-out infinite alternate;
}
@-webkit-keyframes glow {
  from {
    text-shadow: 0 0 10px #fff, 0 0 20px #fff, 0 0 30px #e60073, 0 0 40px #e60073, 0 0 50px #e60073, 0 0 60px #e60073, 0 0 70px #e60073;
  }

  to {
    text-shadow: 0 0 20px #fff, 0 0 30px #ff4da6, 0 0 40px #ff4da6, 0 0 50px #ff4da6, 0 0 60px #ff4da6, 0 0 70px #ff4da6, 0 0 80px #ff4da6;
  }
}
 #myBtn {
          display: none;
          position: fixed;
          bottom: 20px;
          right: 30px;
          z-index: 99;
          font-size: 18px;
          border: none;
          outline: none;
          background-color: red;
          color: white;
          cursor: pointer;
          padding: 15px;
          border-radius: 4px;
        }

        #myBtn:hover {
          background-color: #555;
        }
            .auto-style2 {
                display: flex;
                -ms-flex-wrap: wrap;
                flex-wrap: wrap;
                width: 1645px;
                margin-left: -15px;
                margin-right: -15px;
            }
            body, html {
  height: 100%;
}

* {
  box-sizing: border-box;
}

.bg-image {
  /* The image used */
  background-image: url("imgs/category_background.jpg");

  /* Full height */
  height: 280px;

  /* Center and scale the image nicely */
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
}

/* Position text in the middle of the page/image */
.bg-text {
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0, 0.4); /* Black w/opacity/see-through */
  color: white;
  font-weight: bold;
  font-size: 25px;
  border: 6px solid #f1f1f1;
  position: absolute;
  top: 200px;
  left: 50%;
  transform: translate(-50%, -50%);
  z-index: 2;
  width: 80%;
  padding: 20px;
  text-align: center;
}

.unciorn{
    margin: 30px 0px 0px 80px;
}

.page{
    margin:0px;
}
    </style>
    <%--if no login cant see this page--%>
<%
if(Session["CustomerID"] == null || Session["ArtistID"] != null)
{%>

    <link href="css/animation.css" rel="stylesheet">


    <div class="bg"></div>
    <div class="bg bg2"></div>
    <div class="bg bg3"></div>

    <center>
        <asp:Image ID="Image2" runat="server" style="width:220px;height:320px;"  ImageUrl="~/imgs/artCry.gif"/>
        <br />
        <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Names="Algerian" Font-Size="XX-Large" ForeColor="Black" style="padding-top:50px;padding-bottom:100px;" BorderColor="Aqua" BorderStyle="None" BorderWidth="5px" Height="16px"> ERROR 404</asp:Label>
        <br />
        <asp:LinkButton ID="LinkButton4" runat="server" PostBackUrl="~/Home.aspx" style="font-family:Arial Rounded MT Bold"><p style="color: black;"> <i class="fas fa-home" style="color: black;"></i> Click me back to Home page</p></asp:LinkButton>
    </center>
<% } 
else 
{
%>
    <div class="bg"></div>
    <div class="bg bg2"></div>
    <div class="bg bg3"></div>
    <header>
        <div class="bg-image"></div>
        <div class="bg-text">      
            <img style="width:20%" src="imgs/WSP_New1.png" alt="cd">
            <h1 class="glow">My Wish List</h1>
        </div>
    </header>

    <!-- if empty -->
    <center>
        <asp:Label ID="Label4" runat="server" Visible="False"></asp:Label>
        <asp:Image ID="Image1" runat="server" Visible="False" style="width:200px;height:150px;"  ImageUrl="~/imgs/notFound.gif"/>
        <br />
        <asp:Label ID="Label2" runat="server" Visible="False" Font-Bold="True" Font-Names="Algerian" Font-Size="XX-Large" ForeColor="Black" style="padding-top:50px;padding-bottom:100px;" BorderColor="Aqua" BorderStyle="None" BorderWidth="5px" Height="16px"></asp:Label>
    </center>

    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" DataKeyField="Wish_Number" CssClass="auto-style2" RepeatColumns="2" RepeatDirection="Horizontal" >
        <ItemTemplate>
            <div style="padding:30px;padding-left:120px;text-align:center;">
            <img src="<%# Eval("Wish_Art_Image") %>" width="500" style="border: 10px solid lightcyan;" name="productimage" alt="" class="auto-style1">
<%--            <asp:Image ID="Image1" runat="server" Height="177px" ImageUrl='<%: Session["Art_Image_Show"] %>>' Width="303px" />--%>
            <br />
            <div style="background-color:lightcyan">
                <h3 class="product-title" name="productname" style="font-family:fantasy;text-align:center;"><asp:Label ID="Label1" runat="server" Text='<%# Eval("Art_Name") %>'/></h3>
                <h4 class="price text-black" name="productprice" style="font-family:fantasy;text-align:center;">Current price: <span style="font-family:'Adobe Devanagari';color: gray;">RM <asp:Label ID="Label3" runat="server" Text='<%# Eval("Art_Price") %>'/></span></h4>

            <%--Wish_Number:
            <asp:Label ID="Wish_Number" runat="server" Text='<%# Eval("Wish_Number") %>' />
            <br />
            Wish_Cus_Id:
            <asp:Label ID="Wish_Cus_Id" runat="server" Text='<%# Eval("Wish_Cus_Id") %>' />
            <br />
            Wish_Art_id:
            <asp:Label ID="Wish_Art_Id" runat="server" Text='<%# Eval("Wish_Art_Id") %>' />
            <br />
            <asp:Label ID="Wish_Art_Price" runat="server" Text='<%# Eval("Art_Price") %>'/>--%>
            <br />
            <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("Wish_Art_Id") %>' OnClick="BtnSubmit_Remove" style="font-family:Comic Sans;display:inline-block;text-align:center;"><p style="color: deepskyblue;padding-left:30px;padding-right:50px"><i class="fas fa-trash-alt" style="color: cornflowerblue"></i> Remove from wish list</p></asp:LinkButton>
            <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("Wish_Art_Id") %>' OnClick="BtnSubmit_Purchase" style="font-family:Comic Sans;display:inline-block;text-align:center;"><p style="color: deepskyblue;padding-left:30px;padding-right:50px"> <i class="fa fa-shopping-cart" style="color: cornflowerblue"></i>    Add to purchase</p></asp:LinkButton>
            </div>
            </div>
<br />
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Artdist %>" SelectCommand="SELECT ART.Art_Name, ART.Art_Price, WISH_LIST.Wish_Number, WISH_LIST.Wish_Cus_Id, WISH_LIST.Wish_Art_Id, WISH_LIST.Wish_Art_Image, ART.Art_Quantity FROM WISH_LIST INNER JOIN ART ON WISH_LIST.Wish_Art_Id = ART.Art_Id WHERE (WISH_LIST.Wish_Cus_Id = @Wish_Cus_Id) AND (ART.Art_Quantity &lt;&gt; 0)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="Wish_Cus_Id" SessionField="CustomerID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>
        <script>
            //Get the button
            var mybutton = document.getElementById("myBtn");

            // When the user scrolls down 20px from the top of the document, show the button
            window.onscroll = function () { scrollFunction() };

            function scrollFunction() {
                if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
                    mybutton.style.display = "block";
                } else {
                    mybutton.style.display = "none";
                }
            }

            // When the user clicks on the button, scroll to the top of the document
            function topFunction() {
                document.body.scrollTop = 0;
                document.documentElement.scrollTop = 0;
            }
        </script>
    <% } %>
</asp:Content>
