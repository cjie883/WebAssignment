<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/HeaderFooter.Master" CodeBehind="ProductDetails.aspx.cs" Inherits="WebAssignment.ProductDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
        <link href="css/product_detail.css" rel="stylesheet">
    <%--if no login cant see this page--%>
<%
if(Session["CustomerID"] == null && Session["ArtistID"] == null || Request.QueryString["Art_Id"] == null)
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
        <asp:LinkButton ID="LinkButton5" runat="server" PostBackUrl="~/Home.aspx" style="font-family:Arial Rounded MT Bold"><p style="color: black;"> <i class="fas fa-home" style="color: black;"></i> Click me back to Home page</p></asp:LinkButton>
    </center>
<% } 
else 
{
%>
    <asp:Label ID="Label1" runat="server" Visible="False" ></asp:Label>
    <asp:Label ID="Label2" runat="server" Visible="False" ></asp:Label>
    <div class="container">
            <div class="card">
                <div class="container-fliud">
                    <div class="wrapper row">
                        <div class="preview col-md-6">
                            <img src="<%: Session["Art_Image_Show"] %>" width="500" height="500" name="productimage" alt="">
                        </div>
                        <div class="details col-md-6">
                            <h3 class="product-title" name="productname" style="font-family:fantasy"><asp:Label runat="server" ID="Art_Name_Show"></asp:Label></h3>
                            <p class="product-description" name="productDes" style="font-family:Comic Sans"><asp:Label runat="server" ID="Art_Description_Show" style="font-family:Comic Sans"></asp:Label></p>
                            <h4 class="price text-dark" name="productprice" style="font-family:fantasy;">Current price: <span style="font-family:'Adobe Devanagari'; color:grey;">RM <asp:Label runat="server" ID="Art_Price_Show" style="color:grey;"></asp:Label></span></h4>
<!-- update quantity and add cart button -->

                            <h4 class="price text-dark" name="productprice" style="font-family:fantasy;">Current Quantity left: <span style="font-family:'Adobe Devanagari'; color:grey;"><asp:Label runat="server" ID="Art_Quantity_Show" style="color:grey;"></asp:Label></span></h4>
                            <h4 class="price text-dark" name="productprice" style="font-family:fantasy;">Artist: <span style="font-family:'Adobe Devanagari'; color:grey;"><asp:Label runat="server" ID="Artist_Name_Show" style="color:grey;"></asp:Label></span></h4>

<%--                        <a href="#!" type="button" class="card-link-secondary small text-uppercase mr-3"><i class="fas fa-trash-alt mr-1"></i> Remove item </a>--%>
<%--                        <a href="#!" type="button" class="card-link-secondary small text-uppercase"><i class="fas fa-heart mr-1"></i> Move to wish list </a>--%> 
                            <asp:LinkButton ID="LinkButton4" runat="server" CommandArgument='<%# Eval("Art_Id") %>' Onclick="BtnSubmit_Artist" style="font-family:Comic Sans"><p style="color: darkviolet;"> <i class="fas fa-address-card" style="color: plum"></i> View artist</p></asp:LinkButton>
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("Art_Id") %>' OnClick="BtnSubmit_Purchase" style="font-family:Comic Sans"><p style="color: darkviolet;"> <i class="fa fa-shopping-cart" style="color: plum"></i>    Add to purchase</p></asp:LinkButton>
                            <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("Art_Id") %>' OnClick="BtnSubmit_Wish" style="font-family:Comic Sans"><p style="color: darkviolet;"><i class="fas fa-heart mr-1" style="color: plum"></i>Move to wish list</p> </asp:LinkButton>
                            <%--<asp:Button ID="btnSubmit1" runat="server" name="Add_Cart" Text="Add to purchase" CommandArgument='<%# Eval("Art_Id") %>' OnClick="BtnSubmit_Purchase" />
                            <asp:Button ID="btnSubmit2" runat="server" name="Add_Cart" Text="Add to wish list" CommandArgument='<%# Eval("Art_Id") %>' OnClick="BtnSubmit_Wish" />--%>
                            <%--pass art name,quantity--%>
<!-- back to category -->                            
<%--                            <button style="margin-top: 20px;" type="submit" name="Back"><a href="WebForm1.aspx">Back</a></button>--%>
                            <asp:LinkButton ID="LinkButton3" runat="server" PostBackUrl="~/Product.aspx"><p style="color: darkviolet;"><i class="fa fa-arrow-left" style="color: plum"></i>    Back to Art page</p></asp:LinkButton>

                        </div>
                    </div>
                </div>
            </div>
	</div>
    <% } %>
</asp:Content>

