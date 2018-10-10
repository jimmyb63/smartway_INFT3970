﻿<%@ Page Title="SmartWay - View Advertisements" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="ViewAdvertisementList.aspx.cs" Inherits="SmartWay.UL.Views.ViewAdvertisementList" %>

<%@ Import Namespace="SmartWay.BL.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="col-lg-9 mt-2">
        <% string value = ""; %>
        <% if (Request.QueryString["category"] != null)
            {%>
        <% value = Request.QueryString["category"];
            }%>
        <% else if (Request.QueryString["subCategory"] != null)
            {%>
        <% value = Request.QueryString["subCategory"];
            }%>
        <% else if (Request.QueryString["search"] != null)
            { %>
        <% value = Request.QueryString["search"];
            }%>
        <div class="p-2 mb-2 bg-primary text-white">Search results for <%= value %></div>
        <div class="p-2 mb-2 bg-info text-white">Refine Search</div>
        <div class="row">
            <asp:HiddenField ID="ID" runat="server" />
            <asp:ListView ID="adList" runat="server"
                DataKeyNames="advertisementID" GroupItemCount="4"
                ItemType="SmartWay.BL.Models.Advertisement" SelectMethod="GetAds">
                <EmptyDataTemplate>
                    <div class="col-12 my-2" runat="server">
                        <div class="card h-100">
                            <div class="row">
                                <div class="col-1 my-2"></div>
                                <div class="col-10 my-2">
                                    <p class="card-text">
                                        <h4 class="text-center">Be the first to list an item in this section!</h4>
                                    </p>
                                </div>
                                <div class="col-1 my-2"></div>
                            </div>
                            <div class="row">
                                <div class="col-3 my-2"></div>
                                <div class="col-6 my-2">
                                    <div class="list-group my-2">
                                        <a href="PostAdvertisement.aspx" class="btn btn-success">Post New Ad</a>
                                    </div>
                                </div>
                                <div class="col-3 my-2"></div>
                            </div>
                        </div>
                    </div>
                </EmptyDataTemplate>
                <EmptyItemTemplate>
                    <td />
                </EmptyItemTemplate>
                <GroupTemplate>
                    <tr id="itemPlaceholderContainer" runat="server">
                        <td id="itemPlaceholder" runat="server"></td>
                    </tr>
                </GroupTemplate>

                <ItemTemplate>
                    <div class="col-lg-12">
                        <div class="card mt-2 grey lighten-5">
                            <div class="row">
                                <!-- Card image -->
                                <div class="col-5">
                                    <div class="view overlay">
                                        <a href="ViewAdvertisement.aspx?advertisementID=<%#:Item.advertisementID%>">
                                            <img class="card-img" src="<%#:getAdThumbnail(Item.advertisementID, Item.advertisementSellerID)%>"
                                                style="border: solid; width: 100%" />
                                        </a>
                                    </div>
                                </div>



                                <!-- Card content -->
                                <div class="col-7">
                                    <div class="card-body">
                                        <!-- Title -->
                                        <h4 class="card-title"><a href="ViewAdvertisement.aspx?advertisementID=<%#:Item.advertisementID%>"><%#:Item.advertisementTitle%></a></h4>
                                        <h5 class="card-title"><%#:String.Format("{0:c}", Item.advertisementPrice)%></h5>
                                        <p>
                                            <div class="card-text align-items-center"><%#: Item.advertisementDescription %></div>
                                        </p>
                                        <ul class="list-unstyled list-inline font-small">
                                            <li class="list-inline-item pr-2 black-text"><i class="far fa-calendar-alt mr-2"></i>05/10/2015</li>
                                            <li class="list-inline-item pr-2 black-text"><i class="fas fa-eye mr-2"></i>12</li>
                                            <li class="list-inline-item pr-2 black-text"><i class="fas fa-hand-holding-usd mr-2"></i>2</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>






















                <%--                <ItemTemplate>
                    <div class="col-12 my-2" runat="server">
                        <div class="card h-80">
                            <div class="row">
                                <div class="col-5">
                                    <a href="ViewAdvertisement.aspx?advertisementID=<%#:Item.advertisementID%>">
                                        <img class="card-img" src="<%#:getAdThumbnail(Item.advertisementID, Item.advertisementSellerID)%>"
                                            style="border: solid; width: 100%" />
                                    </a>
                                </div>
                                <div class="col-7">
                                    <div class="card-body  align-items-center" style="height: 100%">
                                        <div class="row">
<<<<<<< HEAD
                                            <h5 class="card-title">
                                                <a href="ViewAdvertisement.aspx?advertisementID=<%#:Item.advertisementID%>"><%#:Item.advertisementTitle%></a>
                                            </h5>
                                        </div>
                                        <div class="row">
                                            <p class="card-text">
                                                <%#:String.Format("{0:c}", Item.advertisementPrice)%>
                                            </p>
                                        </div>
                                        <div class="row">
                                            <div class="card-text align-items-center"><%#: Item.advertisementDescription %></div>
=======
                                            <div class="col-lg-6 col-md-12">
                                                <div class="row">
                                                    <div class="col-12">
                                                        <div class="row">
                                                            <h5 class="card-title">
                                                                <a href="ViewAdvertisement.aspx?advertisementID=<%#:Item.advertisementID%>"><%#:Item.advertisementTitle%></a>
                                                            </h5>
                                                        </div>
                                                        <div class="row">
                                                            <p class="card-text">
                                                                <%#:String.Format("{0:c}", Item.advertisementPrice)%>
                                                            </p>
                                                            <p>
                                                                Views: <%#:getViewCount(Item.advertisementID) %>
                                                            </p>
                                                            <p>
                                                                Date Posted: <%#:Item.advertisementDatePosted%>
                                                            </p>
                                                            <p>
                                                                Offers: <%#:getOfferCount(Item.advertisementID)%>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-6 d-none d-lg-block">
                                                <div class="card-text align-items-center"><%#: Item.advertisementDescription %></div>
                                            </div>
>>>>>>> 5200d781301e17dce934a3e5323ed0e5314b877a
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="blue lighten-4 text-center">
                                <ul class="list-unstyled list-inline font-small">
                                    <li class="list-inline-item pr-2 black-text"><i class="far fa-calendar-alt mr-2"></i>05/10/2015</li>
                                    <li class="list-inline-item pr-2 black-text"><i class="fas fa-eye mr-2"></i>12</li>
                                    <li class="list-inline-item pr-2 black-text"><i class="fas fa-hand-holding-usd mr-2"></i>2</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>--%>
                <LayoutTemplate>
                    <%--<table>
                        <tbody>
                            <tr>
                                <td>--%>
                    <table id="groupPlaceholderContainer" runat="server" style="width: 100%">
                        <tr id="groupPlaceholder"></tr>
                    </table>
                    <%--</td>
                            </tr>
                        </tbody>
                    </table>--%>
                </LayoutTemplate>
            </asp:ListView>
        </div>
    </div>
</asp:Content>
