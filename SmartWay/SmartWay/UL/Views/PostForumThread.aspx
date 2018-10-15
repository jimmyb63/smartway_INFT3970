﻿<%@ Page Title="SmartWay - Post a Forum Thread" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="PostForumThread.aspx.cs" Inherits="SmartWay.UL.Views.PostForumThread" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     
    <!------- Page Content -------->
        <div class="col-lg-9 mt-2">
            <div class="p-2 mb-2 bg-primary text-white">Post a Forum Thread</div>
            <div class="card">
            <!------- Main Page Content Goes Here-------->
            <div class="card-body">
                <h5>Forum Thread Title</h5>
                <asp:TextBox CssClass="form-control" ID="txtTitle" placeholder="Eg. Resuse items as Plant Pots" runat="server" />
                <hr />
                <h5>Select Tags that Best Apply</h5>
                <asp:CheckBoxList ID="cblForumTags" CssClass="form-group" RepeatLayout="Table" RepeatColumns = "3" RepeatDirection="Horizontal" runat="server"></asp:CheckBoxList>
                <asp:Button ID="btnAddforumTag" CssClass="btn btn-block btn-info" Text="Add a Forum Tag To The List" runat="server" OnClick="btnAddforumTag_Click" />
                <hr />
                <hr />
           
                <div class="form-group">
                <h5>Forum Thread Description</h5>
                <asp:TextBox CssClass="form-control" TextMode="MultiLine" ID="txtDescription" rows="8" runat="server"/>
                </div>
                <hr />
                <h5>Upload photos</h5>
                        <div class="row">
                              <div class="col-lg-6">
                                <div class="imgUp">
                                    <div class="imagePreview"></div>
                                    <label class="btn btn-primary btn-block">
                                        Select Image 1<asp:FileUpload
                                            CssClass="uploadFile img"
                                            ID="FileUpload1"
                                            runat="server"
                                            Style="width: 0px;height: 0px;overflow: hidden" />
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="imgUp">
                                    <div class="imagePreview"></div>
                                    <label class="btn btn-primary btn-block">
                                        Select Image 2<asp:FileUpload
                                            CssClass="uploadFile img"
                                            ID="FileUpload2"
                                            runat="server"
                                            Style="width: 0px;height: 0px;overflow: hidden" />
                                    </label>
                                </div>
                            </div>
                        </div>
           
                
                <br />
                <hr />
                <asp:Button CssClass="btn btn-block btn-success" Text="Submit" runat="server" OnClick="postAd" />
                <hr />
            </div>
        </div>
            
    <div class="warning"><asp:Label Text="" ID="errorMessage" runat="server" /></div>
    </div>

</asp:Content>
