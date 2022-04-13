<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/HeaderFooter.Master" CodeBehind="ProductDetails.aspx.cs" Inherits="WebAssignment.ProductDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 118px;
        }
        .auto-style2 {
            width: 5px;
        }
        .auto-style3 {
            width: 262px;
        }
    </style>
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
        <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Names="'Montserrat', sans-serif" Font-Size="XX-Large" ForeColor="Black" style="padding-top:50px;padding-bottom:100px;" BorderColor="Aqua" BorderStyle="None" BorderWidth="5px" Height="16px"> ERROR 404</asp:Label>
        <br />
        <asp:LinkButton ID="LinkButton5" runat="server" PostBackUrl="~/Home.aspx" style="font-family:'Montserrat', sans-serif"><p style="color: black;"> <i class="fas fa-home" style="color: black;"></i> Click me back to Home page</p></asp:LinkButton>
    </center>
<% } 
else 
{
%>
    <asp:Label ID="Label1" runat="server" Visible="False" ></asp:Label>
    <asp:Label ID="Label2" runat="server" Visible="False" ></asp:Label>
  <center class="bigCon">
            <div class="card">
                <div class="container-fliud">
                    <div class="wrapper">
                        <div class="preview">
                            <img src="<%: Session["Art_Image_Show"] %>" width="425" height="500" name="productimage" alt="">
                        </div>
                        <div class="details">
                            <h3 class="product-title" name="productname"><asp:Label runat="server" ID="Art_Name_Show"></asp:Label></h3>
                            <p class="product-description" name="productDes"><asp:Label runat="server" ID="Art_Description_Show"></asp:Label></p>
                            <div class="details-con">
                                    <table class="price text-dark">
                                        <tr>
                                            <td class="auto-style1">Current price </td>
                                            <td class="auto-style2">></td>
                                            <td class="auto-style3"><span class="output">&nbsp;RM
                                    <asp:Label runat="server" ID="Art_Price_Show" class="output"></asp:Label></span></td>      
                                        </tr>
                                        <tr>
                                            <td class="auto-style1">Quantity left&nbsp; </td>
                                            <td class="auto-style2">></td>
                                            <td class="auto-style3"> <span class="output">
                                                &nbsp;<asp:Label runat="server" ID="Art_Quantity_Show" class="output"></asp:Label></span></td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style1">Artist</td>
                                            <td class="auto-style2">></td>
                                            <td class="auto-style3"> <span class="output">
                                                &nbsp;<asp:Label runat="server" ID="Artist_Name_Show" class="output"></asp:Label></span></td>   
                                        </tr>
                                    </table>
                            </div>
                        </div>

                    </div>
                </div>

            </div>
                       <div class="button-con">
        <asp:LinkButton ID="LinkButton4" runat="server" class="buttondesign" CommandArgument='<%# Eval("Art_Id") %>' OnClick="BtnSubmit_Artist"><i class="fas fa-address-card"></i> View artist</asp:LinkButton>
        <asp:LinkButton ID="LinkButton6" runat="server" class="buttondesign" CommandArgument='<%# Eval("Art_Id") %>' OnClick="BtnSubmit_Cart"><i class="fa fa-shopping-cart"></i> Add to Cart</asp:LinkButton>
        <asp:LinkButton ID="LinkButton2" runat="server" class="buttondesign" CommandArgument='<%# Eval("Art_Id") %>' OnClick="BtnSubmit_Wish"><i class="fas fa-heart mr-1"></i>Wish list</asp:LinkButton>
        <asp:LinkButton ID="LinkButton3" runat="server" class="buttondesign-back" PostBackUrl="~/Product.aspx"><i class="fa fa-arrow-left"></i>      Back to Art page</asp:LinkButton>
            </div>
      </center>
   

	
    <% } %>
</asp:Content>

