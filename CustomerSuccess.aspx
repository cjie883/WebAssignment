<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/HeaderFooter.Master" CodeBehind="CustomerSuccess.aspx.cs" Inherits="WebAssignment.CustomerSuccess" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <link href="css/ViewProfile.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=ABeeZee' rel='stylesheet'>
    
    <label class="registersuccessword">Register Successfully!Welcome to Artdist!</label>
    <center>
    <div class="box">
    <h2>Your Registration Info</h2>
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
    <asp:Label ID="Label7" runat="server" Text="Password" CssClass="viewlabel"></asp:Label>
    <br />
    <asp:Label ID="Label8" runat="server" CssClass="profilelabel"></asp:Label>
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
    <asp:Button ID="Button1" runat="server" OnClick="LinkButton1_Click" Text="Sign In" CssClass="buttondesign" />
        </div>
    </center>
</asp:Content>
