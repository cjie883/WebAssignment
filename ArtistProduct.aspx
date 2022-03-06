<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/HeaderFooter.Master" CodeBehind="ArtistProduct.aspx.cs" Inherits="WebAssignment.ArtistProduct" %>
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
            .auto-style2 {
                display: flex;
                -ms-flex-wrap: wrap;
                flex-wrap: wrap;
                width: 1645px;
                margin-left: -15px;
                margin-right: -15px;
            }

            .column {
  float: left;
  width: 50%;
  padding: 10px;
  height: 300px; /* Should be removed. Only for demonstration */
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
        </style>
        <%--if no login cant see this page--%>
<%
if(Session["CustomerID"] != null || Session["ArtistID"] == null)
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
            <p>My ArtWork</p>
        </div>
    </header>
    <div style="position: absolute;left: 10px;top: 280px;display: block;margin-left: auto;margin-right: auto;">
        <img src="imgs/painting.gif" width="200" height="150" name="productimage" alt="">
        <asp:LinkButton ID="LinkButton3" runat="server" CommandArgument='<%# Eval("Art_Id") %>' OnClick="BtnSubmit_Add" Font-Bold="True" Font-Names="Broadway" Font-Size="XX-Large" Font-Underline="False"><p  style="color: black"><i class="far fa-plus-square" style="color: black"></i> Add art</p></asp:LinkButton>
    </div>

    <asp:DataList ID="DataList1" runat="server" DataKeyField="Art_Id" DataSourceID="SqlDataSource1"  class="col-md-4 mb-5" RepeatColumns="3" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" RepeatDirection="Horizontal">
        <ItemTemplate>

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

                <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("Art_Id") %>' OnClick="BtnSubmit_Edit"><i class="fas fa-edit" style="color: blue"></i> Edit art</asp:LinkButton>
                <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("Art_Id") %>' OnClick="BtnSubmit_Delete"><i class="fas fa-trash-alt" style="color: blue"></i> Delete art</asp:LinkButton>
<%--                <asp:LinkButton ID="LinkButton3" runat="server" PostBackUrl="~/maintain_product.aspx"><i class="fa fa-arrow-left" style="color: blue"></i> Back to My Art</asp:LinkButton>--%>


            <!-- --> 
                </div>

        </ItemTemplate>
    </asp:DataList>

<%--    <div class="row">
  <div class="column" style="background-color:#aaa;">
    <h2>Column 1</h2>
    <p>Some text..</p>
  </div>
  <div class="column" style="background-color:#bbb;">
    <h2>Column 2</h2>
    <p>Some text..</p>
  </div>
</div>--%>
    
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

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Artdist %>" SelectCommand="SELECT * FROM [ART] WHERE ([Art_Artist_Id] = @Art_Artist_Id)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="Art_Artist_Id" SessionField="ArtistId" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <% } %>
</asp:Content>
