<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/HeaderFooter.Master" CodeBehind="ProductAdd.aspx.cs" Inherits="WebAssignment.ProductAdd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    
    <link rel="stylesheet" type="text/css" href="css/add.css">
    
    <%--<div class="addContainer">--%>
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
        <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Names="Algerian" Font-Size="XX-Large" ForeColor="Black" style="padding-top:50px;padding-bottom:100px;" BorderColor="Aqua" BorderStyle="None" BorderWidth="5px" Height="16px"> ERROR 404</asp:Label>
        <br />
        <asp:LinkButton ID="LinkButton4" runat="server" PostBackUrl="~/Home.aspx" style="font-family:Arial Rounded MT Bold"><p style="color: black;"> <i class="fas fa-home" style="color: black;"></i> Click me back to Home page</p></asp:LinkButton>
    </center>
<% } 
else 
{
%>
    
        <div><h2 style="text-align: center;color: white;">Add new products</h2><br><br></div>
        <hr><br>
        <div >
    <center><asp:Panel ID="pan" runat="server" BorderStyle="solid" BorderWidth="0px" Width="600px" style ="background-color: rgba(255,255,255,.8);box-shadow: 0 0 0.25em rgba(0,0,0,.25);">
    <div style="margin-left: auto; margin-right: auto; text-align: left;">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label8" runat="server" Text="Artist ID" Font-Bold="True" Font-Names="Arial Black" Font-Size="Larger"></asp:Label>
            <br />
            <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="TextBox8" runat="server" Enabled="false"></asp:TextBox>
    <br /><br /><br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Arial Black" Font-Size="Larger" Text="Art Image"></asp:Label>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:FileUpload ID="FileUpload1" runat="server" />
    <asp:RequiredFieldValidator ID="reqImage" runat="server" ControlToValidate="FileUpload1" ErrorMessage="Please Insert the art" ForeColor="Red"></asp:RequiredFieldValidator>
    <br /><br /><br />
    <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="Label3" runat="server" Text="Art Name" Font-Bold="True" Font-Names="Arial Black" Font-Size="Larger"></asp:Label></strong><br><br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="TextBox3" runat="server" style ="text-transform: uppercase;"></asp:TextBox>
    <asp:Label ID="Label1" runat="server" Visible ="false" ForeColor="Red" ><%: Session["ValidName"] %></asp:Label>
    <asp:RequiredFieldValidator ID="reqName" runat="server" ControlToValidate="TextBox3" ErrorMessage="Please enter the art name" ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    <asp:RegularExpressionValidator ID="regName" runat="server" ControlToValidate="TextBox3" ErrorMessage="Please enter an art name without symblos and numbers" ForeColor="Red" ValidationExpression="^(?![\s.]+$)[a-zA-Z\s.]*$"></asp:RegularExpressionValidator>
    <br /><br />
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label4" runat="server" Text="Art Price" Font-Bold="True" Font-Names="Arial Black" Font-Size="Larger"></asp:Label>
            <br />
            <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="reqPrice" runat="server" ControlToValidate="TextBox4" ErrorMessage="Please enter the price" ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    <asp:RegularExpressionValidator ID="regPrice" runat="server" ControlToValidate="TextBox4" ErrorMessage="Please enter a proper price with digit" ForeColor="Red" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
    <br /><br /><br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label5" runat="server" Text="Art Quantity" Font-Bold="True" Font-Names="Arial Black" Font-Size="Larger"></asp:Label>
            <br />
            <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="reqQuant" runat="server" ControlToValidate="TextBox5" ErrorMessage="Please enter the quantity" ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    <asp:RegularExpressionValidator ID="regQuant" runat="server" ControlToValidate="TextBox5" ErrorMessage="Please enter a digit for quantity" ForeColor="Red" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
    <br /><br /><br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label6" runat="server" Text="Art Category" Font-Bold="True" Font-Names="Arial Black" Font-Size="Larger"></asp:Label>
            <br />
            <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:DropDownList ID="DropDownList" runat="server">
        <asp:ListItem Value="cartoon">CARTOON</asp:ListItem>
        <asp:ListItem Value="abstract">ABSTRACT</asp:ListItem>
        <asp:ListItem Value="lisa">LISA</asp:ListItem>
    </asp:DropDownList>
    <br /><br /><br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label7" runat="server" Text="Art Description" Font-Bold="True" Font-Names="Arial Black" Font-Size="Larger"></asp:Label>
            <br />
            <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="reqDesc" runat="server" ControlToValidate="TextBox7" ErrorMessage="Please enter the description" ForeColor="Red"></asp:RequiredFieldValidator>
    <br /><br /><br />
        

        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="BtnSubmit_Add" Font-Bold="True" Font-Names="Arial Black" Font-Size="Larger" Font-Underline="True">Add Art</asp:LinkButton>
            <br />
            <br />
    </div>
    </asp:Panel>
        <br />
        <br />
    <br />
    </center>
</div>
 
    <center>
<a href="ArtistProduct.aspx"><p style="color: white; font-weight: bold; font-size: 20px;"><i class="fa fa-arrow-left" style="color: white"></i>Back to My ArtWork </p></a>
</center>


    <% } %>
    <%--</div>--%>
</asp:Content>