<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/HeaderFooter.Master" CodeBehind="UpdatePassword.aspx.cs" Inherits="WebAssignment.UpdatePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <link href="css/EditProfile.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=ABeeZee' rel='stylesheet'>
    <%--if no login cant see this page--%>
    <%
if(Session["CustomerID"] == null && Session["ArtistID"] == null)
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
        <asp:LinkButton ID="LinkButton4" runat="server" PostBackUrl="~/home.aspx" style="font-family:Arial Rounded MT Bold"><p style="color: black;"> <i class="fas fa-home" style="color: black;"></i> Click me back to Home page</p></asp:LinkButton>
    </center>
<% } 
else 
{
%>
    <center>
    <div class="box">
        <center>
    <h1>Edit Password</h1></center>
    <asp:Label ID="Label1" runat="server" Text="Current Password" CssClass="viewlabel"></asp:Label>
    <br />
    <asp:TextBox ID="TextBox1" runat="server" TextMode="Password" CssClass="profilelabel"></asp:TextBox>
        <asp:Label ID="Label4" runat="server" Text="Label" Visible="false" CssClass="errorlabel" ></asp:Label>
    <br />
    <asp:Label ID="Label2" runat="server" Text="New Password"  CssClass="viewlabel"></asp:Label>
    <br />
    <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" CssClass="profilelabel"></asp:TextBox>
        <asp:Label ID="Label5" runat="server" Text="Label" Visible="false" CssClass="errorlabel"></asp:Label>
        <asp:Label ID="Label7" runat="server" Text="Label" Visible="false" CssClass="errorlabel"></asp:Label>
        <asp:Label ID="Label8" runat="server" Text="Label" Visible="false" CssClass="errorlabel"></asp:Label>
        <asp:Label ID="Label9" runat="server" Text="Label" Visible="false" CssClass="errorlabel"></asp:Label>
        <asp:Label ID="Label10" runat="server" Text="Label" Visible="false" CssClass="errorlabel"></asp:Label>
        <asp:Label ID="Label11" runat="server" Text="Label" Visible="false" CssClass="errorlabel"></asp:Label>
        <asp:Label ID="Label12" runat="server" Text="Label" Visible="false" CssClass="errorlabel"></asp:Label>
        <br />
    <asp:Label ID="Label3" runat="server" Text="Confirm Password" CssClass="viewlabel"></asp:Label>
    <br />
    <asp:TextBox ID="TextBox3" runat="server" TextMode="Password" CssClass="profilelabel"></asp:TextBox>
        <asp:Label ID="Label6" runat="server" Text="Label" Visible="false" CssClass="errorlabel"></asp:Label>
        <br />
    <asp:Button ID="Button1" runat="server" Text="Confirm Edit" CssClass="buttondesign" OnClick="Button1_Click" />
    <br />
    <asp:Button ID="Button2" runat="server" Text="Edit Profile" CssClass="buttondesign" OnClick="Button2_Click"/>
    <br />
    <asp:Button ID="Button3" runat="server" Text="Cancel" CssClass="buttondesign" OnClick="Button3_Click"/>
        </div>
        </center>
    <% } %>
</asp:Content>
