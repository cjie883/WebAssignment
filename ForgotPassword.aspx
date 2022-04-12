<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/HeaderFooter.Master" CodeBehind="ForgotPassword.aspx.cs" Inherits="WebAssignment.ForgotPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <link href="css/EditProfile.css" rel="stylesheet">
    
    <link href='https://fonts.googleapis.com/css?family=ABeeZee' rel='stylesheet'>
    <center>
    <div class="box">
        <center>
    <h1> Forgot Password </h1></center>
    <br />
        <asp:Label ID="Label12" runat="server" Text="Email" CssClass="viewlabel"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox1" runat="server" placeholder="Enter your registered email" Cssclass="inputtextbox" ></asp:TextBox><br />
        <asp:Label ID="Label2" runat="server" Text="No Email Found, Please Check Again" Visible="false" CssClass="errorlabel"></asp:Label>
        <br />
        <asp:Button ID="Button3" runat="server" Text="Send Verification Code" OnClick="Button3_Click" CssClass="buttondesign"/>
        <br />
        <asp:Button ID="Button4" runat="server" Text="Cancel" OnClick="Button4_Click" CssClass="buttondesign" />
        <br />
        <asp:Label ID="Label1" runat="server" Text="Verification Code" Visible="false" CssClass="viewlabel"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox2" runat="server" placeholder="Enter verification code" Visible="false" Cssclass="inputtextbox"></asp:TextBox>
        <br />
        <asp:Label ID="wrongcode" runat="server" Text="Wrong Verification Code" Visible="false" CssClass="errorlabel"></asp:Label>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" Visible="false" CssClass="buttondesign"/>
        <br />
        <asp:Button ID="Button5" runat="server" Text="Cancel" Visible="false" CssClass="buttondesign" OnClick="Button5_Click" />
        <br />
        <asp:Label ID="passwordtext" runat="server" Text="New Password" Visible="false" CssClass="viewlabel"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox3" runat="server" Visible="false" TextMode="Password" class="profilelabel"></asp:TextBox>
        <asp:Label ID="Label4" runat="server" Text="Label" Visible ="false" CssClass="errorlabel"></asp:Label>
        <asp:Label ID="Label5" runat="server" Text="Label" Visible ="false" CssClass="errorlabel"></asp:Label>
        <asp:Label ID="Label6" runat="server" Text="Label" Visible ="false" CssClass="errorlabel"></asp:Label>
        <asp:Label ID="Label7" runat="server" Text="Label" Visible ="false" CssClass="errorlabel"></asp:Label>
        <asp:Label ID="Label8" runat="server" Text="Label" Visible ="false" CssClass="errorlabel"></asp:Label>
        <asp:Label ID="Label9" runat="server" Text="Label" Visible ="false" CssClass="errorlabel"></asp:Label>
        <asp:Label ID="Label10" runat="server" Text="Label" Visible ="false" CssClass="errorlabel"></asp:Label>
        <br />
        <asp:Label ID="Label3" runat="server" Text="Confirm Password" Visible="false" CssClass="viewlabel"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox4" runat="server" Visible="false" TextMode="Password" class="profilelabel"></asp:TextBox>
        <asp:Label ID="Label11" runat="server" Text="Label" Visible ="false" CssClass="errorlabel"></asp:Label>
        <br />
        <asp:Button ID="Button2" runat="server" Text="Update" OnClick="Button2_Click" Visible="false" CssClass="buttondesign"/>
        <br />
        <asp:Button ID="Button6" runat="server" Text="Cancel" Visible="false" CssClass="buttondesign" OnClick="Button6_Click"/>
        <%--<asp:RequiredFieldValidator ID="reqPass" runat="server" ControlToValidate="TextBox3" ErrorMessage="Please enter a new password"></asp:RequiredFieldValidator>--%>
    
        </div>
    </center>
</asp:Content>
