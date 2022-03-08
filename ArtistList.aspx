<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/HeaderFooter.Master" CodeBehind="ArtistList.aspx.cs" Inherits="WebAssignment.ArtistList" %>
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
if(Session["CustomerID"] == null || Session["ArtistID"] != null || Session["Pass_Artist_Id"] == null)
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

            <center>

            <div style="float:left;max-width: 500px;">
                <asp:DataList ID="DataList2" runat="server" DataKeyField="Artist_Id" DataSourceID="SqlDataSource1" Width="876px">
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Arial Black" Font-Size="XX-Large" Font-Underline="True" ForeColor="White" Text='Artist Profile' />
                <br />
                <asp:Label ID="lblID" runat="server" Text="Artist ID:" Font-Bold="True" ForeColor="Black" Font-Names="Bahnschrift Condensed"></asp:Label>
                <asp:Label ID="Artist_IdLabel" runat="server" Font-Bold="True" Font-Names="Artifakt Element" Font-Underline="True" Font-Size="Large" ForeColor="#CCCCCC" Font-Italic="True" Text='<%# Eval("Artist_Id") %>' />
                <br />
                <asp:Label ID="Label4" runat="server" Text="Artist Name:" Font-Bold="True" ForeColor="Black" Font-Names="Bahnschrift Condensed"></asp:Label>
                <asp:Label ID="Artist_NameLabel" runat="server" Font-Bold="True" Font-Names="Artifakt Element" Font-Underline="True" Font-Size="Large" ForeColor="#CCCCCC" Font-Italic="True" Text='<%# Eval("Artist_Name") %>' />
                <br />
                <asp:Label ID="Label5" runat="server" Text="Gender :" Font-Bold="True" ForeColor="Black" Font-Names="Bahnschrift Condensed"></asp:Label>
                <asp:Label ID="Artist_GenderLabel" runat="server" Font-Bold="True" Font-Names="Artifakt Element" Font-Size="Large" ForeColor="#CCCCCC" Font-Italic="True" Text='<%# Eval("Artist_Gender") %>' />
                <asp:Label ID="Label6" runat="server" Text="Contact Phone:" Font-Bold="True" ForeColor="Black" Font-Names="Bahnschrift Condensed"></asp:Label>
                <asp:Label ID="Artist_PhoneLabel" runat="server" Font-Bold="True" Font-Names="Artifakt Element" Font-Size="Large" ForeColor="#CCCCCC" Font-Italic="True" Text='<%# Eval("Artist_Phone") %>' />
                <asp:Label ID="Label7" runat="server" Text="Email:" Font-Bold="True" ForeColor="Black" Font-Names="Bahnschrift Condensed"></asp:Label>
                <asp:Label ID="Artist_EmailLabel" runat="server" Font-Bold="True" Font-Names="Artifakt Element" Font-Size="Large" ForeColor="#CCCCCC" Font-Italic="True" Text='<%# Eval("Artist_Email") %>' />

            </ItemTemplate>
        </asp:DataList>
            </div>
                        
            <div style="float:right;">            
                <img width="250" height="150" src="imgs/painting.gif" alt="cd">
            </div>
            </center>
            
        </div>
    </header>
    <div style="position: absolute;left: 1%;top: 187px;display: block;margin-left: auto;margin-right: auto;">
        <img src="imgs/ballonCat.gif" width="120" height="250" name="productimage" alt="">
        <asp:LinkButton ID="LinkButton3" runat="server" PostBackUrl="~/art.aspx" Font-Bold="True" Font-Names="Broadway" Font-Size="XX-Large" Font-Underline="False"><p  style="color: black"><i class="far fa-plus-square" style="color: black"></i> Back to art page</p></asp:LinkButton>
    </div>

    <center>
        <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Italic="False" Font-Names="Bahnschrift Condensed" Font-Overline="False" Font-Size="XX-Large" Font-Strikeout="False" Font-Underline="True" ForeColor="#00CCFF">Artist artwork</asp:Label>
    </center>

<%--    <!-- if empty -->
    <center>
        <asp:Label ID="Label4" runat="server" Visible="False"></asp:Label>
        <asp:Image ID="Image1" runat="server" Visible="False" style="width:200px;height:150px;"  ImageUrl="~/imgs/notFound.gif"/>
        <br />
        <asp:Label ID="Label1" runat="server" Visible="False" Font-Bold="True" Font-Names="Algerian" Font-Size="XX-Large" ForeColor="Black" style="padding-top:50px;padding-bottom:100px;" BorderColor="Aqua" BorderStyle="None" BorderWidth="5px" Height="16px"></asp:Label>
    </center>--%>

    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource2" class="col-md-4 mb-5" RepeatColumns="3" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" RepeatDirection="Horizontal" CssClass="auto-style3">

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
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Artdist %>" SelectCommand="SELECT * FROM [ART] WHERE ([Art_Artist_Id] = @Art_Artist_Id)">
            <SelectParameters>
                <asp:SessionParameter Name="Art_Artist_Id" SessionField="Pass_Artist_Id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Artdist %>" SelectCommand="SELECT [Artist_Id], [Artist_Name], [Artist_Gender], [Artist_Phone], [Artist_Email] FROM [ARTIST] WHERE ([Artist_Id] = @Artist_Id)">
        <SelectParameters>
            <asp:SessionParameter Name="Artist_Id" SessionField="Pass_Artist_Id" Type="Int32" />
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
