﻿<%@ Page Title="SmartWay - Registration Confirmation" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="RegistrationConfirmation.aspx.cs" Inherits="SmartWay.UL.Views.RegistrationConfirmation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="col-lg-9 mt-2">
        <div class="p-2 mb-2 bg-success text-white">Account Verified</div>
        <%--------Main Page Content Goes Here--------%>
        <div class="jumbotron text-center">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <h1>Thank you - Your account has been verified</h1>
                        <p>Click <a href="index.aspx">here</a> to go to home.</p>
                        <p>Your browser will automatically take you there in <span id="countdown">10</span> seconds.
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- JavaScript part -->
    <script type="text/javascript">
        var seconds = 10;
        function countdown() {
            seconds = seconds - 1;
            if (seconds < 0) {
                window.location = "index.aspx";
            } else {
                document.getElementById("countdown").innerHTML = seconds;
                window.setTimeout("countdown()", 1000);
            }
        }
        countdown();
    </script>
</asp:Content>
