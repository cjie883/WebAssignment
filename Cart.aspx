<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/HeaderFooter.Master" CodeBehind="Cart.aspx.cs" Inherits="WebAssignment.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <link href="css/animation.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
        <link href="css/category.css" rel="stylesheet">
    <style>
        

        table {
            border-collapse: separate !important;
            border-spacing: 60px 0 !important;
        }

        .glow {
            font-size: 38px;
            font-weight: bold;
            font-family: 'Montserrat', sans-serif;
            text-transform: uppercase;
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
            background-color: #C45AEC;
            color: white;
            cursor: pointer;
            padding: 15px;
            border-radius: 30px;
            width: 55px;
        }

            #myBtn:hover {
                background-color: red;
            }

        body, html {
            height: 100%;
        }

        * {
            box-sizing: border-box;
        }

        .bg-image {
            background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url("../imgs/artistbg.jpg");
            height: 500px;
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
            position: relative;
            margin-bottom: 50px;
        }

        /* Position text in the middle of the page/image */
        .bg-text {
            text-align: center;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            color: white;
            width: 800px;
        }

        .unciorn {
            margin: 30px 0px 0px 80px;
        }

        .page {
            margin: 0px;
        }




        .buttondesign {
    border-radius: 20px;
    border: 1px solid #C45AEC;
    background-color: #C45AEC;
    color: #FFFFFF !important;
    font-size: 12px;
    font-weight: bold;
    padding: 12px 45px;
    letter-spacing: 1px;
    text-transform: uppercase;
    margin: 20px;
    text-decoration: none !important;
}

    .buttondesign:hover {
        background-color: red;
        border: 1px solid red;
    }

    .label1{
        font-size: 18px;
        font-weight: bold;
        font-family: 'Montserrat', sans-serif;
            
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
    
    <header>
        <div class="bg-image">
        <div class="bg-text">      
          
            <h1 class="glow">My Cart</h1>
        </div>
            </div>
    </header>

    <!-- if empty -->
    <center>
        <asp:Label ID="Label4" runat="server" Visible="False"></asp:Label>
        <asp:Image ID="Image1" runat="server" Visible="False" style="width:200px;height:150px;"  ImageUrl="~/imgs/notFound.gif"/>
        <br />
        <asp:Label ID="Label2" runat="server" Visible="False" Font-Bold="True" Font-Names="'Montserrat', sans-serif" Font-Size="XX-Large" ForeColor="Black" style="padding-top:50px;padding-bottom:100px;" BorderColor="Aqua" BorderStyle="None" BorderWidth="5px" Height="16px"></asp:Label>
    </center>

    <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource2" DataKeyField="Cart_Number" class="col-md-4 mb-5" CssClass="auto-style2" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" RepeatDirection="Horizontal" OnSelectedIndexChanged="DataList2_SelectedIndexChanged">
    <ItemTemplate>
            <div class="Wishlist">
               
            <img src="<%# Eval("Cart_Art_Image") %>"  name="productimage" alt=""  class="unciorn mx-auto d-block" width="200" height="200">
            <br />
            <div class="text-center pt-4">
                <h5 class="product-title" name="productname"><asp:Label ID="Label1" runat="server" Text='<%# Eval("Art_Name") %>'/></h5>
                <strong><p class="price text-black" name="productprice">Current price: <span>RM <asp:Label ID="Label3" runat="server" Text='<%# Eval("Art_Price") %>'/></span></p></strong>
                </div>
            <div>
            <asp:LinkButton ID="LinkButton1" class="buttondesign" runat="server" CommandArgument='<%# Eval("Cart_Art_Id") %>' OnClick="BtnSubmit_Remove"><i class="fas fa-trash-alt" style="color: white"></i> Remove from Cart</asp:LinkButton>
                <div style="height:30px;"> </div>
            </div>
             
            <br />
            
                </div>
        </ItemTemplate>

    </asp:DataList>

    <p class="auto-style1">
       <br />
        <center><asp:Label ID="lbltext" runat="server" CssClass="label1" Text=""></asp:Label>
        <asp:Label ID="labelTotal" runat="server" CssClass="label1" Text=""></asp:Label><br />
        <asp:Button ID="lblbutton" class="buttondesign" runat="server" Text="Proceed to Payment" OnClick="lblbutton_Click1" /></center>
        <br />
    </p>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Artdist %>" SelectCommand="SELECT ART.Art_Name, ART.Art_Price, NCART.Cart_Number, NCART.Cart_Cus_Id, NCART.Cart_Art_Id, NCART.Cart_Art_Image, ART.Art_Quantity FROM NCART INNER JOIN ART ON NCART.Cart_Art_Id = ART.Art_Id WHERE (NCART.Cart_Cus_Id = @Cart_Cus_Id) AND (ART.Art_Quantity &lt;&gt; 0)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="Cart_Cus_Id" SessionField="CustomerID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <button onclick="topFunction()" id="myBtn" title="Go to top"><i class="fas fa-angle-up" style="color: white"></i></button>
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