<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/HeaderFooter.Master" CodeBehind="Login.aspx.cs" Inherits="WebAssignment.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <style>
        body {
    background-color: #FFE53B;
background-image: linear-gradient(147deg, #FFE53B 0%, #FF2525 74%);
}

        .center {
    padding: 150px 0px 280px 0px;
}
        .buttondesign {
    font-style: italic;
    height: 50px;
    width: 200px;
    border: 2px solid #fff;
    border-radius: 5px;
    border: none;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 20px;
    margin: 8px 6px;
    cursor: pointer;
    font-family: Helvetica, sans-serif;
    font-weight: bold;
    color: #06FDCC;
    background-color: whitesmoke;
    overflow: hidden;
    box-shadow: 0 4px 12px 0 rgba(152, 160, 180, 10);
}
    </style>
    <div class="center">
    <center>
    <asp:Button ID="Button1" runat="server" Text="Customer Login" class="buttondesign" OnClick="Button1_Click"/>
    <br />
    <asp:Button ID="Button2" runat="server" Text="Artist Login" class="buttondesign" OnClick="Button2_Click"/>
        </center>
        </div>
</asp:Content>
