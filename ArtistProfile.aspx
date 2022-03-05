<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/HeaderFooter.Master" CodeBehind="ArtistProfile.aspx.cs" Inherits="WebAssignment.ArtistProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <link href="css/ViewProfile.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=ABeeZee' rel='stylesheet'>
    <%--if no login cant see this page--%>
    <%
if(Session["ArtistID"] == null)
{%>

    <link href="css/animation.css" rel="stylesheet">


    <div class="bg"></div>
    <div class="bg bg2"></div>
    <div class="bg bg3"></div>

    <center>
        <asp:Image ID="Image2" runat="server" style="width:220px;height:320px;"  ImageUrl="~/imgs/artCry.gif"/>
        <br />
        <asp:Label ID="Label17" runat="server" Font-Bold="True" Font-Names="Algerian" Font-Size="XX-Large" ForeColor="Black" style="padding-top:50px;padding-bottom:100px;" BorderColor="Aqua" BorderStyle="None" BorderWidth="5px" Height="16px"> ERROR 404</asp:Label>
        <br />
        <asp:LinkButton ID="LinkButton4" runat="server" PostBackUrl="~/Home.aspx" style="font-family:Arial Rounded MT Bold"><p style="color: black;"> <i class="fas fa-home" style="color: black;"></i> Click me back to Home page</p></asp:LinkButton>
    </center>
<% } 
else 
{
%>
    <center>
    <div class="box">
        <center>
    <h1>My Profile</h1></center>
        <br />
    <asp:Label ID="Label1" runat="server" Text="Your ID" CssClass="viewlabel"></asp:Label>
        <br />
    <asp:Label ID="Label2" runat="server" CssClass="profilelabel"></asp:Label>
    <br />
    <asp:Label ID="Label3" runat="server" Text="Name" CssClass="viewlabel"></asp:Label>
        <br />
    <asp:Label ID="Label4" runat="server" CssClass="profilelabel"></asp:Label>
    <br />
    <asp:Label ID="Label5" runat="server" Text="Username" CssClass="viewlabel"></asp:Label>
        <br />
    <asp:Label ID="Label6" runat="server" CssClass="profilelabel"></asp:Label>
    <br />
    <asp:Label ID="Label9" runat="server" Text="Gender" CssClass="viewlabel"></asp:Label>
        <br />
    <asp:Label ID="Label10" runat="server" CssClass="profilelabel"></asp:Label>
    <br />
    <asp:Label ID="Label11" runat="server" Text="Phone" CssClass="viewlabel"></asp:Label>
        <br />
    <asp:Label ID="Label12" runat="server" CssClass="profilelabel"></asp:Label>
    <br />
    <asp:Label ID="Label13" runat="server" Text="Email" CssClass="viewlabel"></asp:Label>
        <br />
    <asp:Label ID="Label14" runat="server" CssClass="profilelabel"></asp:Label>
    <br />
    <asp:Label ID="Label15" runat="server" Text="Address" CssClass="viewlabel"></asp:Label>
        <br />
    <asp:Label ID="Label16" runat="server" CssClass="profilelabel"></asp:Label>
    <br />
    <asp:Button ID="Button1" runat="server" OnClick="LinkButton1_Click" Text="Edit Profile" CssClass="buttondesign"/>
    <br />
        <asp:Button ID="Button3" runat="server" Text="Edit Password" CssClass="buttondesign" OnClick="Button3_Click"  />
        <br />
    <asp:Button ID="Button2" runat="server" OnClick="LinkButton2_Click" Text="Back" CssClass="buttondesign"/>
        </div>
        </center>
<% } %>
</asp:Content>