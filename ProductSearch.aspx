<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/HeaderFooter.Master" CodeBehind="ProductSearch.aspx.cs" Inherits="WebAssignment.ProductSearch" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">

        html, body {
    max-width: 100%;
    overflow-x : hidden;
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
            .auto-style3 {
        left: 0px;
        top: 0px;
    }
        .auto-style1 {
            margin-left: 14px;
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
.bg-image {
  /* The image used */
  background-image: url("imgs/category_background.jpg");

  /* Full height */
  height: 340px;

  /* Center and scale the image nicely */
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
}
.bg-text {
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0, 0.4); /* Black w/opacity/see-through */
  color: white;
  font-weight: bold;
  font-size: 25px;
  border: 6px solid #f1f1f1;
  position: absolute;
  top: 250px;
  left: 50%;
  transform: translate(-50%, -50%);
  z-index: 2;
  width: 80%;
  padding: 20px;
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
    <div>
        <center>
            <div class="bg-image"></div>
            <div class="bg-text">
                <h1 class="glow">Search ART</h1>
                <img src="imgs/rainbow.gif" width="200" height="60" name="productimage" alt="">
                <br />
                <%--<asp:Label ID="lblID" runat="server" Text="Search ART:"></asp:Label>--%>            
    <%--            <img src="imgs/rainbow.gif" width="200" height="60" name="productimage" alt=""><img src="imgs/rainbow.gif" width="200" height="60" name="productimage" alt="">    --%>
                <asp:TextBox ID="txtID" runat="server" Width="232px"></asp:TextBox>
    <%--            <img src="imgs/rainbow.gif" width="200" height="60" name="productimage" alt=""><img src="imgs/rainbow.gif" width="200" height="60" name="productimage" alt="">    --%>
                <br />
                <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search" CssClass="auto-style1" Width="232px" />
                <br />
                <asp:Label ID="Label1" runat="server" Text="Label" Visible="false"></asp:Label>
            </div>

         </center>
            <div style="position: absolute;left: 1%;top: 70%;display: block;margin-left: auto;margin-right: auto;">
                <asp:LinkButton ID="LinkButton3" runat="server" PostBackUrl="~/Product.aspx" Font-Size="X-Large" ><p style="color: black;"><i class="fa fa-arrow-left" style="color: black;"></i>    Back to Art page</p></asp:LinkButton>
            </div>
            <br />
            <br />
            <center>
        <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Italic="False" Font-Names="Bahnschrift Condensed" Font-Overline="False" Font-Size="XX-Large" Font-Strikeout="False" Font-Underline="True" ForeColor="#00CCFF"></asp:Label>
    </center>

            <%--<asp:Label ID="lblDisplay" runat="server"></asp:Label>--%>
            <asp:DataList ID="DataList1" runat="server" DataKeyField="Art_Id" DataSourceID="SqlDataSource1" class="col-md-4 mb-5" RepeatColumns="3" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" RepeatDirection="Horizontal" CssClass="auto-style3">
                <ItemTemplate>
                    
                 <div class="shadow p-3 mb-5 bg-white rounded">
                    <div class="Gundam"> 
                        <asp:ImageButton ID="Button1" runat="server" ImageUrl='<%# Eval("Art_Image") %>' CommandArgument='<%# Eval("Art_Id") %>' OnClick="Button1_Click" 
                            class="unciorn mx-auto d-block" width="200" height="200"/>
                    </div>
                    <div class="text-center pt-4">
                      <h5 name="productName"><%# Eval("Art_Name") %></h5>
                      <p><span class="mr-1" name="productPrice"><strong>RM <%# Eval("Art_Price") %></strong></span></p>
                    </div>
                </div>

                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Artdist %>" SelectCommand="SELECT [Art_Id], [Art_Image], [Art_Name], [Art_Price] FROM [ART] WHERE ([Art_Name] LIKE '%' + @Art_Name + '%')">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtID" DefaultValue="0" Name="Art_Name" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
        </div>

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
    <% } %>
</asp:Content>
