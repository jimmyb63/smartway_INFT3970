﻿<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="PostAdvertisementConfirmation.aspx.cs" Inherits="SmartWay.UL.Views.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- Redirects to homepage in 5 seconds --%>
    <meta http-equiv="refresh" content="5;url=index.aspx" />
        <div class="col-lg-9 mt-2">
        <div class="p-2 mb-2 bg-primary text-white">Ad Confirmed!</div>
                <%--------Main Page Content Goes Here--------%>
                <div class="jumbotron text-center">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <h1>Your Advertisement Has Been Posted</h1>
                                <%-- After successful verification, user is redirected to homepage --%>
                                <p>Click <a href="index.aspx">here</a> to go to homepage</p>
                                <p>You will be automatically redirected in 5 seconds. Please wait</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
</asp:Content>
