<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/HeaderFooter.Master" CodeBehind="ProductCategory.aspx.cs" Inherits="WebAssignment.ProductCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
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
            margin-right: 0px;
        }
.buttondesign {
    font-style: italic;
    height: 50px;
    width: 200px;
    border: 2px solid #fff;
    border-radius: 5px;
    border: none;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 20px;
    margin: 8px 6px;
    cursor: pointer;
    font-family: Helvetica, sans-serif;
    font-weight: bold;
    color: #06FDCC;
    background-color: whitesmoke;
    overflow: hidden;
    box-shadow: 0 4px 12px 0 rgba(152, 160, 180, 10);
}

html, body {
    max-width: 100%;
    overflow-x: hidden;
}
#background-video {
  height: 100vh;
  width: 100vw;
  object-fit: cover;
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;

  overflow-x: hidden;
  position: fixed;
  z-index: -1;
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
    text-shadow: 0 0 10px #4dd8ff, 0 0 20px #fff, 0 0 30px #0095e6, 0 0 40px #0095e6, 0 0 50px #0095e6, 0 0 60px #0095e6, 0 0 70px #0095e6;
  }

  to {
    text-shadow: 0 0 20px #4dd8ff, 0 0 30px #4dd8ff, 0 0 40px #4dd8ff, 0 0 50px #4dd8ff, 0 0 60px #4dd8ff, 0 0 70px #4dd8ff, 0 0 80px #4dd8ff;
  }
}
.bg-image {
  /* The image used */
  background-image: url("imgs/category4.jpg");

  /* Full height */

  /* Center and scale the image nicely */
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
}
    </style>
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
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
<center>
<%--        <hr style="background-color:whitesmoke;border:none;height:5px;margin-bottom: 0rem;"/>--%>
    <div class="bg-image"">
    <h3 class="glow"><img src="imgs/categoryHeader.gif" width="200" height="150" name="productimage" alt=""><asp:Label ID="Label2" runat="server" Text="Category   " Font-Bold="True" Font-Names="Arial Black" ForeColor="White" Font-Size="XX-Large"></asp:Label></h3>
    <br />
    <asp:Label ID="lblID" runat="server" Text="Search Category:" Font-Bold="True" ForeColor="White" Font-Names="Bahnschrift Light SemiCondensed"></asp:Label>
    &nbsp;
    <asp:TextBox ID="txtID" runat="server"></asp:TextBox>
    <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search" Font-Names="Bahnschrift SemiBold SemiConden" />
    <br />
    <br />
    <br />
    <asp:Label ID="lblDisplay" runat="server" Font-Bold="True" Font-Names="Algerian" ForeColor="Black" BackColor="White"></asp:Label><asp:Label ID="lblDisplay2" runat="server" Font-Bold="True" Font-Italic="False" Font-Names="Algerian" ForeColor="Black" BackColor="White"></asp:Label>
                
        <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource2" RepeatColumns="4">
            <ItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" class="buttondesign" CommandArgument='<%# Eval("Art_Category") %>' OnClick="Category_Click" style="color: black;" Visible="true"><%# Eval("Art_Category") %></asp:LinkButton>
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Artdist %>" SelectCommand="SELECT DISTINCT [Art_Category] FROM[ART] WHERE([Art_Category] LIKE '%' + @bcd + '%')">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtID" Name="bcd" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
         </div>
    <hr style="background-color:whitesmoke;border:none;height:5px;margin-top: 0rem;"/>

        <video id="background-video" autoplay loop muted poster="https://assets.codepen.io/6093409/river.jpg">
          <source src="video/home4.mp4" type="video/mp4">
        </video>

<div style="padding-top:70px;padding-bottom:100px">
    <asp:LinkButton ID="LinkButton15" runat="server" class="buttondesign" CommandArgument='all' OnClick="Category_Click" style="background-color: black;color: whitesmoke;">ALL ART</asp:LinkButton>
    <asp:DataList ID="DataList1" runat="server" CssClass="auto-style1" DataSourceID="SqlDataSource1" Width="356px" CellPadding="10" CellSpacing="30" RepeatColumns="3" OnSelectedIndexChanged="DataList1_SelectedIndexChanged">
    <ItemTemplate>
        
        <asp:LinkButton ID="LinkButton15" runat="server" class="buttondesign" CommandArgument='<%# Eval("Art_Category") %>' OnClick="Category_Click" ><%# Eval("Art_Category") %></asp:LinkButton>
        <br />
       
    </ItemTemplate>
</asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Artdist %>" SelectCommand="SELECT DISTINCT Art_Category FROM ART ORDER BY Art_Category"></asp:SqlDataSource>
 </div>

</center>

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

