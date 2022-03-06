<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/HeaderFooter.Master" CodeBehind="ProductAdd.aspx.cs" Inherits="WebAssignment.ProductAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <link rel="stylesheet" type="text/css" href="css/add.css">

    <%--<div class="addContainer">--%>
    <%--if no login cant see this page--%>
    <%
        if (Session["CustomerID"] != null || Session["ArtistID"] == null)
        {%>

    <link href="css/animation.css" rel="stylesheet">


    <div class="bg"></div>
    <div class="bg bg2"></div>
    <div class="bg bg3"></div>

    <center>
        <asp:Image ID="Image2" runat="server" Style="width: 220px; height: 320px;" ImageUrl="~/imgs/artCry.gif" />
        <br />
        <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Names="Algerian" Font-Size="XX-Large" ForeColor="Black" Style="padding-top: 50px; padding-bottom: 100px;" BorderColor="Aqua" BorderStyle="None" BorderWidth="5px" Height="16px"> ERROR 404</asp:Label>
        <br />
        <asp:LinkButton ID="LinkButton4" runat="server" PostBackUrl="~/Home.aspx" Style="font-family: Arial Rounded MT Bold"><p style="color: black;"> <i class="fas fa-home" style="color: black;"></i> Click me back to Home page</p></asp:LinkButton>
    </center>
    <% }
        else
        {
    %>
    <center>
        <div class="box">
            <center>
                <h1>Add new product</h1>
            </center>
            <center>
                <asp:Panel ID="pan" runat="server">
                    <asp:Label ID="Label8" runat="server" Text="Artist ID" CssClass="editinput"></asp:Label>
                    <br />


                    <asp:TextBox ID="TextBox8" runat="server" CssClass="inputtextbox" Enabled="false"></asp:TextBox>
                    <br />
                    <br />


                    <asp:Label ID="Label2" runat="server" Text="Art Image" CssClass="editinput"></asp:Label>
                    <br />


                    <asp:FileUpload ID="FileUpload1" runat="server" />
                    <asp:RequiredFieldValidator ID="reqImage" runat="server" ControlToValidate="FileUpload1" ErrorMessage="<br/>Please Insert the art" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <br />


                    <asp:Label ID="Label3" runat="server" Text="Art Name" CssClass="editinput"></asp:Label><br />


                    <asp:TextBox ID="TextBox3" runat="server" CssClass="inputtextbox" Style="text-transform: uppercase;"></asp:TextBox>
                    <asp:Label ID="Label1" runat="server" Visible="false" ForeColor="Red"><%: Session["ValidName"] %></asp:Label>
                    <asp:RequiredFieldValidator ID="reqName" runat="server" ControlToValidate="TextBox3" ErrorMessage="Please enter the art name" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="regName" runat="server" ControlToValidate="TextBox3" ErrorMessage="Please enter an art name without symblos and numbers" ForeColor="Red" ValidationExpression="^(?![\s.]+$)[a-zA-Z\s.]*$"></asp:RegularExpressionValidator>
                    <br />



                    <asp:Label ID="Label4" runat="server" Text="Art Price" CssClass="editinput"></asp:Label>
                    <br />

                    <asp:TextBox ID="TextBox4" runat="server" CssClass="inputtextbox"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqPrice" runat="server" ControlToValidate="TextBox4" ErrorMessage="Please enter the price" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="regPrice" runat="server" ControlToValidate="TextBox4" ErrorMessage="Please enter a proper price with digit" ForeColor="Red" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
                    <br />


                    <asp:Label ID="Label5" runat="server" Text="Art Quantity" CssClass="editinput"></asp:Label>
                    <br />


                    <asp:TextBox ID="TextBox5" runat="server" CssClass="inputtextbox"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqQuant" runat="server" ControlToValidate="TextBox5" ErrorMessage="Please enter the quantity" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="regQuant" runat="server" ControlToValidate="TextBox5" ErrorMessage="Please enter a digit for quantity" ForeColor="Red" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
                    <br />


                    <asp:Label ID="Label6" runat="server" Text="Art Category" CssClass="editinput"></asp:Label>
                    <br />


                    <asp:DropDownList ID="DropDownList" runat="server" CssClass="inputtextbox">
                        <asp:ListItem Value="cartoon">CARTOON</asp:ListItem>
                        <asp:ListItem Value="abstract">ABSTRACT</asp:ListItem>
                        <asp:ListItem Value="lisa">LISA</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <br />

                    <asp:Label ID="Label7" runat="server" Text="Art Description" CssClass="editinput"></asp:Label>
                    <br />


                    <asp:TextBox ID="TextBox7" runat="server" CssClass="inputtextbox"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqDesc" runat="server" ControlToValidate="TextBox7" ErrorMessage="Please enter the description" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <br />
                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="BtnSubmit_Add" CssClass="buttondesign">Add Art</asp:LinkButton>
                    <br /><br />
                    <button Class="buttondesign"><a href="ArtistProduct.aspx" style="color:white; text-decoration:none;">Back</a></button>
                    <br />
                </asp:Panel>

            </center>
        </div>
    </center>


    <% } %>
    <%--</div>--%>
</asp:Content>
