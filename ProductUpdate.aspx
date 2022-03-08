<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/HeaderFooter.Master" CodeBehind="ProductUpdate.aspx.cs" Inherits="WebAssignment.ProductUpdate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <style>
        body{
            background-color: #0093E9;
background-image: linear-gradient(160deg, #0093E9 0%, #80D0C7 100%);
        }
        
    </style>
    <link href="css/Editproduct.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=ABeeZee' rel='stylesheet'>

            <%--if no login cant see this page--%>
<%
if(Session["CustomerID"] != null || Session["ArtistID"] == null || Session["Art_Edit_ID"] == null)
{%>

    <link href="css/animation.css" rel="stylesheet">


    <div class="bg"></div>
    <div class="bg bg2"></div>
    <div class="bg bg3"></div>

    <center>
        <asp:Image ID="Image2" runat="server" style="width:220px;height:320px;"  ImageUrl="~/imgs/artCry.gif"/>
        <br />
        <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Names="Algerian" Font-Size="XX-Large" ForeColor="Black" style="padding-top:50px;padding-bottom:100px;" BorderColor="Aqua" BorderStyle="None" BorderWidth="5px" Height="16px"> ERROR 404</asp:Label>
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
    <h1>Edit Product</h1></center>
    <asp:ImageButton ID="Button1" runat="server" class="unciorn mx-auto d-block" width="300" height="300" style="margin-top:25px; border:2px solid #000;"/>
    <br />
  
    <b><asp:Label ID="Label2" runat="server" Text="Art Name" CssClass="editinput"></asp:Label></b>
    <br />
    <asp:TextBox ID="TextBox2" runat="server" CssClass="inputtextbox" style ="text-transform: uppercase;"></asp:TextBox>
 
    <asp:RequiredFieldValidator ID="reqName" runat="server" ControlToValidate="TextBox2" ErrorMessage="Please enter the art name" ForeColor="Red" ></asp:RequiredFieldValidator>
    <br />
    <asp:RegularExpressionValidator ID="regName" runat="server" ControlToValidate="TextBox2" ErrorMessage="Please enter an art name without symblos and numbers" ForeColor="Red" ValidationExpression="^(?![\s.]+$)[a-zA-Z\s.]*$"></asp:RegularExpressionValidator>
    <br />
    <asp:Label ID="Label1" runat="server" Visible ="false" ForeColor="Red" ><%: Session["ValidName"] %></asp:Label>
    <br />
    <b><asp:Label ID="Label3" runat="server" Text="Art Price" CssClass="editinput"></asp:Label></b>
    <br />
    <asp:TextBox ID="TextBox3" runat="server" CssClass="inputtextbox"></asp:TextBox>
    <br />
    <asp:RequiredFieldValidator ID="reqPrice" runat="server" ControlToValidate="TextBox3" ErrorMessage="Please enter the price" ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    <asp:RegularExpressionValidator ID="regPrice" runat="server" ControlToValidate="TextBox3" ErrorMessage="Please enter a proper price with digit" ForeColor="Red" ValidationExpression="\d+((,\d+)+)?(.\d+)?(.\d+)?(,\d+)?"></asp:RegularExpressionValidator>
    <br />
    <b><asp:Label ID="Label4" runat="server" Text="Quantity" CssClass="editinput"></asp:Label></b>
        <br />
    <asp:TextBox ID="TextBox4" runat="server" CssClass="inputtextbox"></asp:TextBox>
    <br />
    <asp:RequiredFieldValidator ID="reqQuant" runat="server" ControlToValidate="TextBox4" ErrorMessage="Please enter the quantity" ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    <asp:RegularExpressionValidator ID="regQuant" runat="server" ControlToValidate="TextBox4" ErrorMessage="Please enter a digit for quantity" ForeColor="Red" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
    <br />
    <b><asp:Label ID="Label5" runat="server" Text="Category" CssClass="editinput"></asp:Label></b>
    <br />
    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="inputtextbox">
        <asp:ListItem Value="Cartoon">Cartoon</asp:ListItem>
        <asp:ListItem Value="Abstract">Abstract</asp:ListItem>
        <asp:ListItem Value="Lisa">Lisa</asp:ListItem>
    </asp:DropDownList>
    <br />
    <br />
    <br />
    <b><asp:Label ID="Label6" runat="server" Text="Description" CssClass="editinput" ></asp:Label></b>
        <br />
    <asp:TextBox ID="TextBox6" runat="server" CssClass="inputtextbox" Rows="5"></asp:TextBox>
    <br />
    <asp:RequiredFieldValidator ID="reqDesc" runat="server" ControlToValidate="TextBox6" ErrorMessage="Please enter the description" ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
        <asp:LinkButton ID="LinkButton3" runat="server" CssClass="buttondesign" PostBackUrl="~/ArtistProduct.aspx">Cancel Edit</asp:LinkButton>
        <asp:Button ID="Button2" runat="server" OnClick="LinkButton1_Click" Text="Confirm Edit" CssClass="buttondesign"/>
        
        <%--<asp:Button ID="Button3" runat="server" Text="Cancel Edit" OnClick="LinkButton3_Click" CssClass="buttondesign"/>
        <br />--%>
        
    <br />
    </div>
    </center>
    <% } %>
</asp:Content>
