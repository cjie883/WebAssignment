<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/HeaderFooter.Master" CodeBehind="PaymentHistory.aspx.cs" Inherits="WebAssignment.PaymentHistory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    
    <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
    <style>
        .title {
            font-family: 'Montserrat', sans-serif;
            font-size: 40px;
            font-weight: bold;
            color: #000;
        }

         .buttondesign-back{
            border-radius: 20px;
            border: 1px solid red;
            background-color: red;
            color: #FFFFFF;
            font-size: 12px;
            font-weight: bold;
            padding: 12px 45px;
            letter-spacing: 1px;
            text-transform: uppercase;
        }

                 .buttondesign-back:hover {
                background-color: #C45AEC;
                border: 1px solid #C45AEC;
                text-decoration: none;
                color: white;
            }

        
    </style>
    <%--if no login cant see this page--%>
<%
if(Session["CustomerID"] == null)
{%>

    <link href="css/animation.css" rel="stylesheet">


    <div class="bg"></div>
    <div class="bg bg2"></div>
    <div class="bg bg3"></div>

    <center>
        <asp:Image ID="Image2" runat="server" style="width:220px;height:320px;"  ImageUrl="~/imgs/artCry.gif"/>
        <br />
        <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Names="'Montserrat', sans-serif" Font-Size="XX-Large" ForeColor="Black" style="padding-top:50px;padding-bottom:100px;" BorderColor="Aqua" BorderStyle="None" BorderWidth="5px" Height="16px"> ERROR 404</asp:Label>
        <br />
        <asp:LinkButton ID="LinkButton4" runat="server" PostBackUrl="~/home.aspx" style="font-family:'Montserrat', sans-serif"><p style="color: black;"> <i class="fas fa-home" style="color: black;"></i> Click me back to Home page</p></asp:LinkButton>
    </center>
<% } 
else 
{
%>
    <div style="margin-top:40px; text-align: center;">
    <asp:Label ID="txtPurchaseHistory" runat="server" Text="My Purchase History" class="title"></asp:Label>
        <br />
    <br />
    </div>
    <!-- if empty -->
    <center>
        <asp:Label ID="Label4" runat="server" Visible="False"></asp:Label>
        <asp:Image ID="Image1" runat="server" Visible="False" style="width:200px;height:150px;"  ImageUrl="~/imgs/notFound.gif"/>
        <br />
        <asp:Label ID="Label2" runat="server" Visible="False" Font-Bold="True" Font-Names="'Montserrat', sans-serif" Font-Size="XX-Large" ForeColor="Black" style="padding-top:50px;padding-bottom:100px;" BorderColor="Aqua" BorderStyle="None" BorderWidth="5px" Height="16px"></asp:Label>
    </center>
    <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#E7E7FF" BorderWidth="1px" CellPadding="10" GridLines="Horizontal" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AutoGenerateColumns="False" DataKeyNames="Payment_Id" DataSourceID="SqlDataSource1" Height="300px" Width="900px" HorizontalAlign="Center" BorderStyle="None" Font-Bold="False">
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <Columns>
            <asp:BoundField DataField="Payment_Id" HeaderText="Payment Id" InsertVisible="False" ReadOnly="True" SortExpression="Payment_Id" />
            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
            <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
        </Columns>
        <EditRowStyle BorderWidth="0px" />
        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
        <HeaderStyle BackColor="#C45AEC" Font-Bold="True" BorderWidth="1px" Font-Size="Medium" ForeColor="#F7F7F7" />
        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
        <SelectedRowStyle BackColor="#738A9C" ForeColor="#F7F7F7" Font-Bold="True" />
        <SortedAscendingCellStyle BackColor="#F4F4FD" />
        <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
        <SortedDescendingCellStyle BackColor="#D8D8F0" />
        <SortedDescendingHeaderStyle BackColor="#3E3277" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Artdist %>" SelectCommand="SELECT PAYMENT.Payment_Id, PAYMENT.Total_Payment as Amount, PAYMENT.Shipping_Status as Status FROM PAYMENT WHERE [Customer_Id] = @Customer_ID">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="Customer_Id" SessionField="CustomerID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <div style="margin-left: auto; margin-right: auto; text-align: center;">
        <br />
    <asp:LinkButton ID="LinkButton1" CssClass="buttondesign-back" runat="server" PostBackUrl="~/Home.aspx"><i class="fa fa-arrow-left" style="color: white"></i>  Back to Home</asp:LinkButton>
    </div>
    <br />
    <br />
    <br />

    <% } %>
</asp:Content>