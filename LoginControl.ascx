<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LoginControl.ascx.cs" Inherits="WebAssignment.LoginControl" %>
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
        <asp:Label ID="Label17" runat="server" Font-Bold="True" Font-Names="Algerian" Font-Size="XX-Large" ForeColor="Black" style="padding-top:50px;padding-bottom:100px;" BorderColor="Aqua" BorderStyle="None" BorderWidth="5px" Height="16px"> ERROR 404</asp:Label>
        <br />
        <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Names="Algerian" Font-Size="XX-Large" ForeColor="White" style="padding-bottom:100px;" BorderColor="Aqua" BorderStyle="None" BorderWidth="5px" Height="16px">User, you already login</asp:Label>
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
            <asp:Label ID="Title" Cssclass="texttitle" runat="server"></asp:Label></center>
        <br />
<b><asp:Label ID="Label1" runat="server" Text="Username" CssClass="inputlabel"></asp:Label></b>
        <br />
    <asp:TextBox ID="loginusername" runat="server" CssClass="inputtextbox" placeholder="Enter Your Username"></asp:TextBox>
        <br />
        <asp:Label ID="Label3" runat="server" Visible="false" CssClass="errorlabel"></asp:Label>
        <br />
    <b><asp:Label ID="Label2" runat="server" Text="Password" CssClass="inputlabel"></asp:Label></b>
        <br />
    <asp:TextBox ID="loginpassword" runat="server" CssClass="inputtextbox" placeholder="Enter Your Password" TextMode="Password"></asp:TextBox>
        <br />
        <asp:Label ID="Label4" runat="server" Visible="false" CssClass="errorlabel"></asp:Label>
        <br />
        <div class="forgot"><a href="Forgotpassword.aspx"> Forgot Your Password? </a></div>
        <asp:Label ID="Label5" runat="server" Visible="false" CssClass="accounterrorlabel"></asp:Label>
        <br />
    <asp:Button ID="Login" runat="server" Text="Login" OnClick="Login_Click" class="buttondesign"/>
        <br /><br />
        <asp:Label ID="registerlabel" runat="server" CssClass="registerlbl" Text="Don't have an account? Sign Up now"></asp:Label>
        <br /><br />
        <asp:Button ID="Register" runat="server" Text="Sign Up" OnClick="Register_Click" class="buttondesign"/>
        </div>
        </center>
<% } %>