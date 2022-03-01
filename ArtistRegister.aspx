<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/HeaderFooter.Master" CodeBehind="ArtistRegister.aspx.cs" Inherits="WebAssignment.ArtistRegister" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <link href="css/Register.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=ABeeZee' rel='stylesheet'>
    <center>
    <div class="box">
        <center>
    <h1>Artist Registration</h1></center>
    <br />
    <asp:Label ID="Label2" runat="server" Text="Name" CssClass="viewlabel"></asp:Label>
    <br />
    <asp:TextBox ID="TextBox2" runat="server" CssClass="profilelabel" placeholder="Enter Your Name"></asp:TextBox>
        <br />
        <asp:Label ID="Label9" runat="server" Text="Label" Visible="false" CssClass="errorlabel"></asp:Label>
    <br />
    <asp:Label ID="Label3" runat="server" Text="Username" CssClass="viewlabel"></asp:Label>
    <br />
    <asp:TextBox ID="TextBox3" runat="server" CssClass="profilelabel" placeholder="Enter Your Username"></asp:TextBox>
        <br />
        <asp:Label ID="Label10" runat="server" Text="Label" Visible="false" CssClass="errorlabel"></asp:Label>
        <asp:Label ID="Label16" runat="server" Text="Label" Visible="false" CssClass="errorlabel"></asp:Label>
        <asp:Label ID="Label17" runat="server" Text="Label" Visible="false" CssClass="errorlabel"></asp:Label>
        <asp:Label ID="Label18" runat="server" Text="Label" Visible="false" CssClass="errorlabel"></asp:Label>
        <asp:Label ID="Label19" runat="server" Text="Label" Visible="false" CssClass="errorlabel"></asp:Label>
        <asp:Label ID="Label20" runat="server" Text="Label" Visible="false" CssClass="errorlabel"></asp:Label>
        <asp:Label ID="Label21" runat="server" Text="Label" Visible="false" CssClass="errorlabel"></asp:Label>
        <asp:Label ID="Label22" runat="server" Text="Label" Visible="false" CssClass="errorlabel"></asp:Label>
    <br />
    <asp:Label ID="Label4" runat="server" Text="Password" CssClass="viewlabel"></asp:Label>
    <br />
    <asp:TextBox ID="TextBox4" runat="server" TextMode="Password" CssClass="profilelabel" placeholder="Enter Your Password"></asp:TextBox>
        <br />
        <asp:Label ID="Label11" runat="server" Text="Label" Visible="false" CssClass="errorlabel"></asp:Label>
        <asp:Label ID="Label23" runat="server" Text="Label" Visible="false" CssClass="errorlabel"></asp:Label>
        <asp:Label ID="Label24" runat="server" Text="Label" Visible="false" CssClass="errorlabel"></asp:Label>
        <asp:Label ID="Label25" runat="server" Text="Label" Visible="false" CssClass="errorlabel"></asp:Label>
        <asp:Label ID="Label26" runat="server" Text="Label" Visible="false" CssClass="errorlabel"></asp:Label>
        <asp:Label ID="Label27" runat="server" Text="Label" Visible="false" CssClass="errorlabel"></asp:Label>
        <asp:Label ID="Label28" runat="server" Text="Label" Visible="false" CssClass="errorlabel"></asp:Label>
    <br />
    <asp:Label ID="Label1" runat="server" Text="Confirm Password" CssClass="viewlabel"></asp:Label>
    <br />
    <asp:TextBox ID="TextBox1" runat="server" TextMode="Password" CssClass="profilelabel" placeholder="Enter Your Password again"></asp:TextBox>
        <br />
        <asp:Label ID="Label12" runat="server" Text="Label" Visible="false" CssClass="errorlabel"></asp:Label>
    <br />
    <asp:Label ID="Label5" runat="server" Text="Gender" CssClass="viewlabel"></asp:Label>
    <br />
    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="profilelabel">
        <asp:ListItem Value="M">Male</asp:ListItem>
        <asp:ListItem Value="F">Female</asp:ListItem>
    </asp:DropDownList>
    <br /><br />
    <asp:Label ID="Label6" runat="server" Text="Phone" CssClass="viewlabel"></asp:Label>
    <br />
    <asp:TextBox ID="TextBox6" runat="server" CssClass="profilelabel" placeholder="Enter Your Phone Number"></asp:TextBox>
        <br />
        <asp:Label ID="Label13" runat="server" Text="Label" Visible="false" CssClass="errorlabel"></asp:Label>
    <br />
    <asp:Label ID="Label7" runat="server" Text="Email" CssClass="viewlabel"></asp:Label>
    <br />
    <asp:TextBox ID="TextBox7" runat="server" CssClass="profilelabel" placeholder="Enter Your Email Address"></asp:TextBox>
        <br />
        <asp:Label ID="Label14" runat="server" Text="Label" Visible="false" CssClass="errorlabel"></asp:Label>
    <br />
    <asp:Label ID="Label8" runat="server" Text="Address" CssClass="viewlabel"></asp:Label>
    <br />
    <asp:TextBox ID="TextBox8" runat="server" CssClass="profilelabel" placeholder="Enter Your Home Address"></asp:TextBox>
        <br />
        <asp:Label ID="Label15" runat="server" Text="Label" Visible="false" CssClass="errorlabel"></asp:Label>
    <br />
        <asp:Button ID="Button2" runat="server" OnClick="LinkButton2_Click" Cssclass="buttondesign" Text="Cancel" />
        <asp:Button ID="Button1" runat="server" OnClick="LinkButton1_Click" Cssclass="buttondesign" Text="Register" />
        
        </div>
    </center>
</asp:Content>