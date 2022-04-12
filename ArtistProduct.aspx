<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/HeaderFooter.Master" CodeBehind="ArtistProduct.aspx.cs" Inherits="WebAssignment.ArtistProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
    <link href="css/category.css" rel="stylesheet">
    <style>
        table {
            border-collapse: separate !important;
            border-spacing: 60px 0 !important;
        }

        #myBtn {
            display: none;
            position: fixed;
            bottom: 20px;
            right: 30px;
            z-index: 99;
            font-size: 18px;
            border: none;
            outline: none;
            background-color: red;
            color: white;
            cursor: pointer;
            padding: 15px;
            border-radius: 30px;
            width: 55px;
        }

            #myBtn:hover {
                background-color: #555;
            }

        .auto-style2 {
            display: flex;
            -ms-flex-wrap: wrap;
            flex-wrap: wrap;
            width: 1645px;
            margin-left: -15px;
            margin-right: -15px;
        }

        .column {
            float: left;
            width: 50%;
            padding: 10px;
            height: 300px; /* Should be removed. Only for demonstration */
        }

        #myBtn {
            display: none;
            position: fixed;
            bottom: 20px;
            right: 30px;
            z-index: 99;
            font-size: 18px;
            border: none;
            outline: none;
            background-color: #C45AEC;
            color: white;
            cursor: pointer;
            border-radius: 30px;
            width: 55px;
        }

            #myBtn:hover {
                background-color: red;
            }

        .auto-style2 {
            display: flex;
            -ms-flex-wrap: wrap;
            flex-wrap: wrap;
            width: 1645px;
            margin-left: -15px;
            margin-right: -15px;
        }
    </style>
   
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
        <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Names="'Montserrat', sans-serif" Font-Size="XX-Large" ForeColor="Black" Style="padding-top: 50px; padding-bottom: 100px;" BorderColor="Aqua" BorderStyle="None" BorderWidth="5px" Height="16px"> ERROR 404</asp:Label>
        <br />
        <asp:LinkButton ID="LinkButton4" runat="server" PostBackUrl="~/Home.aspx" Style="font-family: 'Montserrat', sans-serif"><p style="color: black;"> <i class="fas fa-home" style="color: black;"></i> Click me back to Home page</p></asp:LinkButton>
    </center>
    <% }
        else
        {
    %>
    <header>
        <div class="hero-image">
            <div class="hero-text">
                <asp:Label ID="Label1" runat="server" class="toptitle">My Artwork</asp:Label><br />
                <div style="height: 50px;"></div>
        <asp:LinkButton ID="LinkButton3" runat="server" class="buttondesign-add" CommandArgument='<%# Eval("Art_Id") %>' OnClick="BtnSubmit_Add"><i class="far fa-plus-square" style="color: white"></i> Add Art</asp:LinkButton>
            </div>
        </div>

    </header>


    <asp:DataList ID="DataList1" runat="server" DataKeyField="Art_Id" DataSourceID="SqlDataSource1" class="col-md-4 mb-5" RepeatColumns="3" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" RepeatDirection="Horizontal">
        <ItemTemplate>
            <table>
                <div class="productContainer">

                    <asp:ImageButton ID="Button1" runat="server" ImageUrl='<%# Eval("Art_Image") %>' CommandArgument='<%# Eval("Art_Id") %>' OnClick="Button1_Click"
                        class="unciorn mx-auto d-block" Width="200" Height="200" />


                    <div class="text-center pt-4">
                        <h5 name="productName"><%# Eval("Art_Name") %></h5>
                        <p><span class="mr-1" name="productPrice">RM <%# Eval("Art_Price") %></span></p>
                        <p><span class="mr-1" name="productQuantity">Quantity: <%# Eval("Art_Quantity") %></span></p>
                    </div>


                    <asp:LinkButton ID="LinkButton1" runat="server" class="buttondesign" CommandArgument='<%# Eval("Art_Id") %>' OnClick="BtnSubmit_Edit"><i class="fas fa-edit" style="color: white"></i> Edit art</asp:LinkButton><br />
                    <div style="height:30px;"> </div>
                    <asp:LinkButton ID="LinkButton2" runat="server" class="buttondesign" CommandArgument='<%# Eval("Art_Id") %>' OnClick="BtnSubmit_Delete"><i class="fas fa-trash-alt" style="color: white"></i> Delete art</asp:LinkButton>


                </div>
            </table>
        </ItemTemplate>
    </asp:DataList>



    <button onclick="topFunction()" id="myBtn" title="Go to top"><i class="fas fa-angle-up" style="color: white"></i></button>
    <script>
        //Get the button
        var mybutton = document.getElementById("myBtn");

        // When the user scrolls down 20px from the top of the document, show the button
        window.onscroll = function () { scrollFunction() };

        function scrollFunction() {
            if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
                mybutton.style.display = "block";
            } else {
                mybutton.style.display = "none";
            }
        }

        // When the user clicks on the button, scroll to the top of the document
        function topFunction() {
            document.body.scrollTop = 0;
            document.documentElement.scrollTop = 0;
        }
    </script>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Artdist %>" SelectCommand="SELECT * FROM [ART] WHERE ([Art_Artist_Id] = @Art_Artist_Id)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="Art_Artist_Id" SessionField="ArtistId" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <% } %>
</asp:Content>
