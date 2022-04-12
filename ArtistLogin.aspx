<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/HeaderFooter.Master" CodeBehind="ArtistLogin.aspx.cs" Inherits="WebAssignment.ArtistLogin" %>
<%@ Register TagPrefix="Login" TagName="Templete" Src="~/LoginControl.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <style>
        body {
    background-color: #4158D0;
background-image: linear-gradient(43deg, #4158D0 0%, #C850C0 46%, #FFCC70 100%);

}
    </style>
    <link href="css/login.css" rel="stylesheet">
        <%--if no login cant see this page--%>
    <%
if(Session["CustomerID"] != null || Session["ArtistID"] != null)
{%>

    <link href="css/animation.css" rel="stylesheet">
    <div class="bg"></div>
    <div class="bg bg2"></div>
    <div class="bg bg3"></div>

    <center>
        <asp:Image ID="Image2" runat="server" style="width:220px;height:320px;"  ImageUrl="~/imgs/artCry.gif"/>
        <br />
        <asp:Label ID="Label17" runat="server" Font-Bold="True" Font-Names="'Montserrat', sans-serif" Font-Size="XX-Large" ForeColor="Black" style="padding-top:50px;padding-bottom:100px;" BorderColor="Aqua" BorderStyle="None" BorderWidth="5px" Height="16px"> ERROR 404</asp:Label>
        <br />
        <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Names="'Montserrat', sans-serif" Font-Size="XX-Large" ForeColor="White" style="padding-bottom:100px;" BorderColor="Aqua" BorderStyle="None" BorderWidth="5px" Height="16px"> User, you already login</asp:Label>
        <br />
        <asp:LinkButton ID="LinkButton4" runat="server" PostBackUrl="~/Home.aspx" style="font-family:'Montserrat', sans-serif"><p style="color: black;"> <i class="fas fa-home" style="color: black;"></i> Click me back to Home page</p></asp:LinkButton>
    </center>
<% } 
else 
{
%>
    
        <Login:Templete ID="logintemplete" runat="server"/>
         
        
    <% } %>
</asp:Content>
