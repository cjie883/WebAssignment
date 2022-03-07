<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/HeaderFooter.Master" CodeBehind="ProductSub.aspx.cs" Inherits="WebAssignment.ProductSub" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
        <link href="css/category.css" rel="stylesheet">
            <style>

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
            .auto-style3 {
        left: 0px;
        top: 0px;
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
        <div class="bg-image"></div>
        <div class="bg-text">      
            <img style="width:20%" src="imgs/WSP_New1.png" alt="cd">
            <p>Come and explore more interesting ART</p>
        </div>
    </header>
    <div style="position: absolute;left: 1%;top: 287px;display: block;margin-left: auto;margin-right: auto;">
        <img src="imgs/painting.gif" width="200" height="150" name="productimage" alt="">
        <asp:LinkButton ID="LinkButton3" runat="server" PostBackUrl="~/ProductCategory.aspx" Font-Bold="True" Font-Names="Broadway" Font-Size="XX-Large" Font-Underline="False"><p  style="color: black"><i class="far fa-plus-square" style="color: black"></i> Category</p></asp:LinkButton>
    </div>

    <div style="position: absolute;left: 20%;top: 297px;display: block;margin-left: auto;margin-right: auto;">
        <img src="imgs/paintPlate.gif" width="180" height="140" name="productimage" alt="">
        <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="~/Product.aspx"  Font-Bold="True" Font-Names="Broadway" Font-Size="XX-Large" Font-Underline="False"><p style="color: black;"> <i class="fas fa-paint-brush" style="color: black"></i>    All Art</p></asp:LinkButton>
    </div>

    <div style="position: absolute;left: 37%;top: 287px;display: block;margin-left: auto;margin-right: auto;">
        <img src="imgs/searchHeader.gif" width="200" height="150" name="productimage" alt="">
        <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/ProductSearch.aspx"  Font-Bold="True" Font-Names="Broadway" Font-Size="XX-Large" Font-Underline="False"><p style="color: black;"> <i class="fa fa-search" style="color: black"></i>    Search Art</p></asp:LinkButton>
    </div>
    <center>
        <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Italic="False" Font-Names="Bahnschrift Condensed" Font-Overline="False" Font-Size="XX-Large" Font-Strikeout="False" Font-Underline="True" ForeColor="#00CCFF"><%: Session["Category"] %></asp:Label>
    </center>

<%--    <!-- if empty -->
    <center>
        <asp:Label ID="Label4" runat="server" Visible="False"></asp:Label>
        <asp:Image ID="Image1" runat="server" Visible="False" style="width:200px;height:150px;"  ImageUrl="~/imgs/notFound.gif"/>
        <br />
        <asp:Label ID="Label1" runat="server" Visible="False" Font-Bold="True" Font-Names="Algerian" Font-Size="XX-Large" ForeColor="Black" style="padding-top:50px;padding-bottom:100px;" BorderColor="Aqua" BorderStyle="None" BorderWidth="5px" Height="16px"></asp:Label>
    </center>--%>
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" class="col-md-4 mb-5" RepeatColumns="3" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" RepeatDirection="Horizontal" CssClass="auto-style3">

        <ItemTemplate >
            <!-- show product -->          

                <div class="shadow p-3 mb-5 bg-white rounded">
            <!-- --> 
                    <div class="Gundam"> 

                        <asp:ImageButton ID="Button1" runat="server" ImageUrl='<%# Eval("Art_Image") %>' CommandArgument='<%# Eval("Art_Id") %>' OnClick="Button1_Click" 
                            class="unciorn mx-auto d-block" width="200" height="200"/>
                        
                    </div>
                    <div class="text-center pt-4">
                      <h5 name="productName"><%# Eval("Art_Name") %></h5>
                      <p><span class="mr-1" name="productPrice"><strong>RM <%# Eval("Art_Price") %></strong></span></p>
                    </div>
            <!-- --> 
                </div>
        </ItemTemplate>

    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Artdist %>" SelectCommand="SELECT [Art_Image], [Art_Name], [Art_Price], [Art_Id] FROM [ART] WHERE ([Art_Category] = @Art_Category)">
        <SelectParameters>
            <asp:SessionParameter Name="Art_Category" SessionField="Category" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

    
        
        <button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>
        <jsp:include page="headerfooter/UserFooter.jsp" />
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
    <%--END--%>
    <% } %>

 </asp:Content>
