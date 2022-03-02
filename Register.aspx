<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/HeaderFooter.Master" CodeBehind="Register.aspx.cs" Inherits="WebAssignment.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <style>
        body {
            
        }

        .buttondesign {
            background-color: transparent;
            border: none;
            border-radius: 75px;
            margin: 60px 100px;
            text-align: center;
            width: 450px;
            height: 450px;
            position: relative;
            display: inline-block;
            transition: 1s box-shadow;
            box-shadow: 0 14px 28px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22);
        }

        .buttondesign1 {
            font-family: 'Montserrat', sans-serif;
            color: white;
            opacity: 0.85;
            background: linear-gradient(rgba(0, 0, 0, 0.527),rgba(0, 0, 0, 0.5)) , url("imgs/customer.jpeg");
            background-repeat: no-repeat;
            background-size: cover;
            border: none;
            border-radius: 75px;
            text-align: center;
            text-decoration: none;
            font-size: 25px;
            cursor: pointer;
            font-weight: bold;
            width: 450px;
            height: 450px;
            position: relative;
            display: inline-block;
            transition: 1s box-shadow;
            transition: 1.5s ease;
        }

        .buttondesign2 {
            font-family: 'Montserrat', sans-serif;
            color: white;
            opacity: 0.85;
            background: linear-gradient(rgba(0, 0, 0, 0.527),rgba(0, 0, 0, 0.5)) , url("imgs/artist.jpg");
            background-repeat: no-repeat;
            background-size: cover;
            border: none;
            border-radius: 75px;
            text-align: center;
            text-decoration: none;
            font-size: 25px;
            cursor: pointer;
            font-weight: bold;
            width: 450px;
            height: 450px;
            position: relative;
            display: inline-block;
            transition: 1s box-shadow;
            transition: 1.5s ease;
        }

        .buttondesign1:hover{
            color: black;
            transition: 2s ease;
            background: white;
            
        }

        .buttondesign2:hover{
            color: black;
            transition: 2s ease;
            background: white;
            
        }

        .buttondesign:hover{
            box-shadow: 0 5px 35px 0px rgba(0,0,0,.1);
        }

        .buttondesign:hover::before, 
        .buttondesign:hover::after {
            display: block;
            content: '';
            position: absolute;
            width: 450px;
            height: 450px;
            background: #FDA8CF;
            border-radius: 75px;
            z-index: -1;
            animation: 1s clockwise infinite;
        }

        .buttondesign:hover:after {
            background: #F3CE5E;
            animation: 2s counterclockwise infinite;
        }

        @keyframes clockwise {
            0% {
                top: -5px;
                left: 0;
            }

            12% {
                top: -2px;
                left: 2px;
            }

            25% {
                top: 0;
                left: 5px;
            }

            37% {
                top: 2px;
                left: 2px;
            }

            50% {
                top: 5px;
                left: 0;
            }

            62% {
                top: 2px;
                left: -2px;
            }

            75% {
                top: 0;
                left: -5px;
            }

            87% {
                top: -2px;
                left: -2px;
            }

            100% {
                top: -5px;
                left: 0;
            }
        }

        @keyframes counterclockwise {
            0% {
                top: -5px;
                right: 0;
            }

            12% {
                top: -2px;
                right: 2px;
            }

            25% {
                top: 0;
                right: 5px;
            }

            37% {
                top: 2px;
                right: 2px;
            }

            50% {
                top: 5px;
                right: 0;
            }

            62% {
                top: 2px;
                right: -2px;
            }

            75% {
                top: 0;
                right: -5px;
            }

            87% {
                top: -2px;
                right: -2px;
            }

            100% {
                top: -5px;
                right: 0;
            }
        }

    </style>
    <div class="center">
        <center>
           
            <div class="buttondesign">

            <asp:Button ID="Button1" runat="server" Text="Customer Registration" class="buttondesign1" OnClick="Button1_Click" />
            </div>

            <div class="buttondesign">
            <asp:Button ID="Button2" runat="server" Text="Artist Registration" class="buttondesign2" OnClick="Button2_Click" />
            </div>
        </center>
    </div>

</asp:Content>

