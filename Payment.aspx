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
            <link href="css/payment.css" rel="stylesheet">
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

            input[type=checkbox], input[type=radio] {
                margin-right: 20px;
                margin-top: -1px;
                vertical-align: middle;
            }
            .left{
                text-align:left;
                width: 200px;
                font-family: 'Montserrat', sans-serif;
            }

            .right {
                text-align: right;
                width: 220px;
            }

            label {
                margin-bottom: 0px !important;
            }

            .totalPayment{
                display: -webkit-inline-box;
                
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
        <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Names="'Montserrat', sans-serif" Font-Size="XX-Large" ForeColor="Black" style="padding-top:50px;padding-bottom:100px;" BorderColor="Aqua" BorderStyle="None" BorderWidth="5px" Height="16px"> ERROR 404</asp:Label>
        <br />
        <asp:LinkButton ID="LinkButton4" runat="server" PostBackUrl="~/Home.aspx" style="font-family:'Montserrat', sans-serif"><p style="color: black;"> <i class="fas fa-home" style="color: black;"></i> Click me back to Home page</p></asp:LinkButton>
    </center>
<% } 
else 
{
%>

<center>
<!-- cart -->
        <div class="box">    
            <h3 class="texttitle"> Checkout</h3> 
                    <div style="height:30px;"></div>
                    <h5 class="inputlabel" style="width: 205px;">Shipping Details</h5>
            
                    <label for="FirstName" id="lblName" class="inputlabel">Receiver Name</label><br />                 
                    <asp:TextBox ID="txtName" runat="server" CssClass="inputtextbox"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="reqName" runat="server" ControlToValidate="txtName" ErrorMessage="Please enter a name" class="errorlabel"></asp:RequiredFieldValidator><br />
                    <asp:RegularExpressionValidator ID="regName" runat="server" ControlToValidate="txtName" ErrorMessage="Please enter a name without symbols and number" class="errorlabel" ValidationExpression="^[A-Za-z]+"></asp:RegularExpressionValidator>
                   
           
                    <label for="Email" id="lblEmail" class="inputlabel">Email</label><br />
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="inputtextbox"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="reqEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Please enter an email" class="errorlabel"></asp:RequiredFieldValidator><br />
                    <asp:RegularExpressionValidator ID="regEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Please enter an valid email xxx@xxx.com" class="errorlabel" ValidationExpression="^(.+)@(.+)$"></asp:RegularExpressionValidator>
                    
                                 
                    <label for="address" id="lblAddress" class="inputlabel">Receiver Address</label><br />                 
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="inputtextbox"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="reqAddress" runat="server" ControlToValidate="txtAddress" ErrorMessage="Please enter an address" class="errorlabel"></asp:RequiredFieldValidator>  
                    <br />
                
<%--                <hr class="mb-4">
                <div class="custom-control custom-checkbox">
                    <input type="checkbox" class="custom-control-input" id="same-address">
                    <label class="custom-control-label" for="same-address" id="lblShip">Shipping address is the same as my billing address</label>
                </div>--%>
           
               
                <h5 id="lblPayment" class="inputlabel" style="width: 205px;">Payment Method</h5>
                
                <div class="form__radios">
                    <div class="form__radio">
                        <div class="left"><asp:RadioButton ID="rbCC" Text='Visa Payment' runat="server" GroupName="PaymentMethod" /></div>
                          <div class="right"><img src="imgs/Visa_Logo.png" style="width: 20%; margin-bottom: 0.3em;" /></div>  
                    </div>

                    <div class="form__radio">
                        <div class="left"><asp:RadioButton ID="rbDC" Text="Master Card" runat="server" GroupName="PaymentMethod" /></div>
                         <div class="right"><img src="imgs/Master_Logo.png" style="width: 20%; margin-bottom: 0.2em;" /></div>  
                    </div>
                    <div class="form__radio">
                        <div class="left"><asp:RadioButton ID="rbP" Text="PayPal" runat="server" GroupName="PaymentMethod" /></div>
                        <div class="right"><img src="imgs/paypal.png" style="width: 20%; margin-bottom: 0.3em;" /></div>  
                    </div>  
                    
                </div>
             <br />
            <h5 id="lblPaymentInfo" class="inputlabel" style="width: 205px;">Payment Information</h5>
                <div class="row1">
                    
                        <label for="cc-name" id="lblCName" class="inputlabel">Cardholder Name</label>
                        <asp:TextBox ID="txtCName" CssClass="inputtextbox" placeholder="Cardholder Name" runat="server"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="reqCName" runat="server" ControlToValidate="txtCName" ErrorMessage="Please enter a Card Name" class="errorlabel"></asp:RequiredFieldValidator><br />
                        <asp:RegularExpressionValidator ID="regCName" runat="server" ControlToValidate="txtCName" ErrorMessage="Please enter a Card Name without symbols and number" class="errorlabel" ValidationExpression="^[A-Za-z]+"></asp:RegularExpressionValidator>
                        <br />

                    
                   
                        <label for="cc-number" id="lblCNumber" class="inputlabel">Credit Card Number</label>        
                        <asp:TextBox ID="txtCNumber" CssClass="inputtextbox" placeholder="0000 0000 0000 0000" runat="server"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="reqCNumber" runat="server" ControlToValidate="txtCNumber" ErrorMessage="Please enter a Card Number" class="errorlabel"></asp:RequiredFieldValidator><br />
                        <asp:RegularExpressionValidator ID="regCNumber" runat="server" ControlToValidate="txtCNumber" ErrorMessage="Please enter a 16 digit Card Number" class="errorlabel" ValidationExpression="[0-9]{16}"></asp:RegularExpressionValidator>
                        <br />
                    </div>
               
            
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="cc-expiration" id="lblExp" class="inputlabelcard">Expiration</label>     
                        <asp:TextBox ID="txtExp"  CssClass="inputtextboxcard" placeholder="MM/YY" runat="server"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="reqExp" runat="server" ControlToValidate="txtExp" ErrorMessage="Please enter expiration date" class="errorlabel"></asp:RequiredFieldValidator><br />
                        <asp:RegularExpressionValidator ID="regExp" runat="server" ControlToValidate="txtExp" ErrorMessage="Please enter as the format DD/MM" class="errorlabel" ValidationExpression="(0[1-9]|1[0-2])\/?(([0-9]{4})|[0-9]{2}$)"></asp:RegularExpressionValidator>
                        <br />
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="cc-cvv" id="lblCvv" class="inputlabelcard-right">CVV</label>
                        <asp:TextBox ID="txtCvv"  CssClass="inputtextboxcard-right" placeholder="123" runat="server"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="reqCvv" runat="server" ControlToValidate="txtCvv" ErrorMessage="Please enter cvv" class="errorlabel"></asp:RequiredFieldValidator><br />
                        <asp:RegularExpressionValidator ID="regCvv" runat="server" ControlToValidate="txtCvv" ErrorMessage="Please enter 3 digit for Cvv" class="errorlabel" ValidationExpression="[0-9]{3}"></asp:RegularExpressionValidator>
                        <br />
                   </div>
                </div>   
            <div class="totalPayment">
                <p class="inputlabeltotal">TOTAL PAYMENT</p> <asp:Label Id="lblTotal" runat="server" Enabled="False" style="font-family:'Montserrat', sans-serif;"></asp:Label>
            </div>
                
                    <br />
                <br />
                <a href="Product.aspx" class="buttondesign-aa">Cancel Payment</a>
                <asp:Button ID="btnCheckout" runat="server" Text="Confirm and Pay" OnClick="btnCheckout_Click" class="buttondesign" />
                
               
                <br />
                <br />
                <br />
          
            
     </div>
</center>
    <% } %>
</asp:Content>
