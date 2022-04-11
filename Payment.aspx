<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderFooter.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="WebAssignment.Payment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
            <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
            <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
            <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>


        <style>        
            
            .ordersuccess{
                font-size: 20px;
                color: blue;
            }
            .cartsuccess{
                font-size: 20px;
                color: pink;
                padding-left: 380px;
            }
            .auto-style1 {
                left: 0px;
                top: 0px;
                width: 1300px;
            }
        </style>
   
    <%--if no login cant see this page--%>
<%
if(Session["CustomerID"] == null || Session["total"] == null)
{%>

    <link href="css/animation.css" rel="stylesheet">


    <div class="bg"></div>
    <div class="bg bg2"></div>
    <div class="bg bg3"></div>

    <center>
        <asp:Image ID="Image2" runat="server" style="width:220px;height:320px;"  ImageUrl="~/imgs/artCry.gif"/>
        <br />
        <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Names="Algerian" Font-Size="XX-Large" ForeColor="Black" style="padding-top:50px;padding-bottom:100px;" BorderColor="Aqua" BorderStyle="None" BorderWidth="5px" Height="16px"> ERROR 404</asp:Label>
        <br />
        <asp:LinkButton ID="LinkButton4" runat="server" PostBackUrl="~/Home.aspx" style="font-family:Arial Rounded MT Bold"><p style="color: black;"> <i class="fas fa-home" style="color: black;"></i> Click me back to Home page</p></asp:LinkButton>
    </center>
<% } 
else 
{
%>

<div class="container">
<!-- cart -->
        <div class="row">
            <div class="auto-style1" id="lblTotal">
            <h4 class="d-flex justify-content-between align-items-center mb-3">
                <span class="text-muted" >Your Cart</span>
                
            </h4>                                   
<!-- name -->                
                <div class="mb-3">
                    <label for="FirstName" id="lblName">Receiver Name </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                   
                    <asp:TextBox ID="txtName" runat="server" Width="363px"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="reqName" runat="server" ControlToValidate="txtName" ErrorMessage="Please enter a name" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="regName" runat="server" ControlToValidate="txtName" ErrorMessage="Please enter a name without symbols and number" ForeColor="Red" ValidationExpression="^[A-Za-z]+"></asp:RegularExpressionValidator>
                    <br />
                 </div>
<!-- email -->
                <div class="mb-3">
                    <label for="Email" id="lblEmail">Email <span class="text-muted">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtEmail" runat="server" Width="362px"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="reqEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Please enter an email" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="regEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Please enter an email xxx@xxx.com" ForeColor="Red" ValidationExpression="^(.+)@(.+)$"></asp:RegularExpressionValidator>
                    <br />
                    </span></label>
                </div>
<!-- address -->
                <div class="mb-3">
                    <label for="address" id="lblAddress">Receiver Address&nbsp;</label>                   
                    <asp:TextBox ID="txtAddress" runat="server" Width="362px"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="reqAddress" runat="server" ControlToValidate="txtAddress" ErrorMessage="Please enter an address" ForeColor="Red"></asp:RequiredFieldValidator>  
                    <br />
                </div>
                <hr class="mb-4">
                <div class="custom-control custom-checkbox">
                    <input type="checkbox" class="custom-control-input" id="same-address">
                    <label class="custom-control-label" for="same-address" id="lblShip">Shipping address is the same as my billing address</label>
                </div>
<!-- payment method -->              
                <hr class="mb-4">
                <h4 class="mb-3" id="lblPayment">Payment Method</h4>
                
                <div class="d-block my-3">
                    <div class="custom-control custom-radio">
                        <asp:RadioButton ID="rbCC" Text="CreditCard" runat="server" GroupName="PaymentMethod" />
                    </div>
                    <div class="custom-control custom-radio">
                        <asp:RadioButton ID="rbDC" Text="DebitCard" runat="server" GroupName="PaymentMethod" />
                    </div>
                    <div class="custom-control custom-radio">
                        <asp:RadioButton ID="rbP" Text="PayPal" runat="server" GroupName="PaymentMethod" />
                    </div>                    
                </div>
<!-- card name -->
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="cc-name" id="lblCName">Card Name</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="txtCName" runat="server"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="reqCName" runat="server" ControlToValidate="txtCName" ErrorMessage="Please enter a Card Name" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="regCName" runat="server" ControlToValidate="txtCName" ErrorMessage="Please enter a Card Name without symbols and number" ForeColor="Red" ValidationExpression="^[A-Za-z]+"></asp:RegularExpressionValidator>
                        <br />

                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="cc-number" id="lblCNumber">Credit card number</label>        
                        <asp:TextBox ID="txtCNumber" runat="server"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="reqCNumber" runat="server" ControlToValidate="txtCNumber" ErrorMessage="Please enter a Card Number" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="regCNumber" runat="server" ControlToValidate="txtCNumber" ErrorMessage="Please enter a 16 digit Card Number" ForeColor="Red" ValidationExpression="[0-9]{16}"></asp:RegularExpressionValidator>
                        <br />
                    </div>
                </div>
<!-- expiration & cvv -->              
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="cc-expiration" id="lblExp">Expiration&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;       
                        <asp:TextBox ID="txtExp" runat="server"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="reqExp" runat="server" ControlToValidate="txtExp" ErrorMessage="Please enter expiration date" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="regExp" runat="server" ControlToValidate="txtExp" ErrorMessage="Please enter as the format DD/MM" ForeColor="Red" ValidationExpression="(0[1-9]|1[0-2])\/?(([0-9]{4})|[0-9]{2}$)"></asp:RegularExpressionValidator>
                        <br />
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="cc-cvv" id="lblCvv">CVV</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  &nbsp;<asp:TextBox ID="txtCvv" runat="server" Width="59px"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="reqCvv" runat="server" ControlToValidate="txtCvv" ErrorMessage="Please enter cvv" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="regCvv" runat="server" ControlToValidate="txtCvv" ErrorMessage="Please enter 3 digit for Cvv" ForeColor="Red" ValidationExpression="[0-9]{3}"></asp:RegularExpressionValidator>
                        <br />
                   </div>
                </div>                
                TOTAL PAYMENT <asp:TextBox ID="txtTotal" runat="server" Enabled="False"></asp:TextBox>
                    <br />
                <br />
                <asp:Button ID="btnCheckout" runat="server" Text="Continue To Checkout" OnClick="btnCheckout_Click" Font-Size="Large" Height="50px" Width="273px" />
                
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="art.aspx" style ="" >Cancel Payment</a>
                <br />
                <br />
                <br />
           </div>
     </div>
</div>
    <% } %>
</asp:Content>
