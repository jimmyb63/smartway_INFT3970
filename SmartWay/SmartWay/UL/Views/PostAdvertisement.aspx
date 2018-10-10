﻿<%@ Page Title="SmartWay - Post an Advertisement" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="PostAdvertisement.aspx.cs" Inherits="SmartWay.UL.Views.PostAdvertisement" %>

<%@ Import Namespace="SmartWay.BL.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <% if (Session["currentUser"] != null)
        {
            Person currentUser = new Person();
            currentUser = (Person)Session["currentUser"];
            int userID = currentUser.userID;%>

    <!------- Page Content -------->

    <div class="col-lg-9 mt-2">
        <div class="p-2 mb-2 bg-primary text-white">Post an Ad</div>
        <div class="card">
            <!------- Main Page Content Goes Here-------->
            <div class="card-body">

                <%--  CHECKING ERROR SUMMARIES --%>
                <asp:ValidationSummary
                    ID="ValidationSummary1"
                    runat="server"
                    ForeColor="Red"
                    ShowMessageBox="false"
                    HeaderText="Please fix these entries:" />
                <%-- TITLE for the ad --%>
                <h5>Ad title*</h5>
                <asp:TextBox 
                    CssClass="form-control" 
                    ID="txtTitle" 
                    placeholder="Eg. Weber Family 2 burner BBQ in great condition" 
                    runat="server" />
                <asp:RequiredFieldValidator
                    ErrorMessage="Title Required"
                    ForeColor="Red"
                    ControlToValidate="txtTitle"
                    runat="server">
                </asp:RequiredFieldValidator>
                <hr />

                <%-- TYPE of ad --%>
                <h5>Type of ad</h5>
              
                <asp:RadioButtonList 
                    CssClass="form-group" 
                    ID="rbAdType" 
                    runat="server">
                    <asp:ListItem Text=" Offer" Value="offer" />
                    <asp:ListItem Text=" Request" Value="request" />
                </asp:RadioButtonList>
                <hr />       

                <%-- CATEGORY for the ad --%>
                <h5>Select a category</h5>
                <asp:RadioButtonList 
                    CssClass="form-group" 
                    ID="rbAdCategory" 
                    OnSelectedIndexChanged="rbAdCategory_SelectedIndexChanged" 
                    AutoPostBack="true" 
                    runat="server">
                    <asp:ListItem Text="Goods" Value="goods" />
                    <asp:ListItem Text="Services" Value="services" />
                </asp:RadioButtonList>
                <hr />

                <%-- SUB-CATEGORY for the ad --%>
                <h5>Select a sub-category*</h5>
                <asp:DropDownList 
                    CssClass="form-control" 
                    ID="ddSubCategory" 
                    runat="server">
                </asp:DropDownList>                
                <br />
                <%-- Required to pick a subcategory --%>
                <asp:RequiredFieldValidator
                    ErrorMessage="Sub-category Required"
                    ForeColor="Red"
                    ControlToValidate="ddSubCategory"
                    runat="server"
                    InitialValue="0"
                    Display="Dynamic"
                    CssClass="error"                    
                    ></asp:RequiredFieldValidator>
                <hr />

                <%-- PRICE for the ad --%>
                
                <h5>Price*</h5>
                <div class="row">
                    <div class="col-lg-4">      
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">$</span>
                        </div>
                    <asp:Textbox 
                        CssClass="form-control" 
                        ID="txtPrice" 
                        runat="server"
                        placeholder="eg. 25"/>                       
                    </div>
                        
                        <%-- PRICE required --%>
                        <asp:RequiredFieldValidator
                            ErrorMessage="Price Required"
                            Display="Dynamic"
                            ForeColor="Red"
                            ControlToValidate="txtPrice"
                            runat="server"></asp:RequiredFieldValidator>


                    </div>
                    <%--Might not need this code - radio buttons next to price --%>
                    <%--<div class="col-lg-8 mt-2">
                    <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
                    <label class="form-check-label" for="inlineRadio1">Amount</label>
                    </div>
                    <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
                    <label class="form-check-label" for="inlineRadio1">Negotiable</label>
                    </div>
                    <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
                    <label class="form-check-label" for="inlineRadio2">Free</label>
                    </div>
                    <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3">
                    <label class="form-check-label" for="inlineRadio3">Swap / Trade</label>
                    </div>
                </div>--%>
                </div>
                <br />
                <hr />

                <%-- DESCRIPTION for the ad --%>
                <div class="form-group">
                    <h5>Description</h5>
                    <asp:TextBox 
                        CssClass="form-control" 
                        TextMode="MultiLine" 
                        ID="txtDescription" 
                        Rows="6" 
                        runat="server" />
                </div>
                <hr />
                <%-- PHOTOS for the ad --%>
                <h6>Upload Images - Image 1 will be displayed on the results page.</h6><br />
                <div class="row">
                    <div class="container">
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
                        <div class="row">
                              <div class="col-lg-6">
                                <div class="imgUp">
                                    <div class="imagePreview"></div>
                                    <label class="btn btn-primary btn-block">
                                        Select Image 3<asp:FileUpload
                                            CssClass="uploadFile img"
                                            ID="FileUpload3"
                                            runat="server"
                                            Style="width: 0px;height: 0px;overflow: hidden" />
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="imgUp">
                                    <div class="imagePreview"></div>
                                    <label class="btn btn-primary btn-block">
                                        Select Image 4<asp:FileUpload
                                            CssClass="uploadFile img"
                                            ID="FileUpload4"
                                            runat="server"
                                            Style="width: 0px;height: 0px;overflow: hidden" />
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                              <div class="col-lg-6">
                                <div class="imgUp">
                                    <div class="imagePreview"></div>
                                    <label class="btn btn-primary btn-block">
                                        Select Image 5<asp:FileUpload
                                            CssClass="uploadFile img"
                                            ID="FileUpload5"
                                            runat="server"
                                            Style="width: 0px;height: 0px;overflow: hidden" />
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="imgUp">
                                    <div class="imagePreview"></div>
                                    <label class="btn btn-primary btn-block">
                                        Select Image 6<asp:FileUpload
                                            CssClass="uploadFile img"
                                            ID="FileUpload6"
                                            runat="server"
                                            Style="width: 0px;height: 0px;overflow: hidden" />
                                    </label>
                                </div>
                            </div>
                        </div>
                        <hr />
                    <%-- SUBMIT AD BUTTON --%>
                        <asp:Button 
                            CssClass="btn btn-block btn-success"
                            Text="Submit" 
                            runat="server" 
                            OnClick="postAd" />
                        </div>
                    </div>
                </>
            </div>
            <div class="warning">
                <asp:Label Text="" ID="errorMessage" runat="server" /></div>
            <% }
                else
                {%>
            <div class="col-lg-9 order-lg-2">
                <div class="p-2 my-2 bg-danger text-white">Error - Please Login</div>
                <div class="jumbotron text-center mt-2">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <h2>Please Login to Post a New Ad</h2><br />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-2">
                            </div>
                            <div class="col-lg-8">
                                <a href="login.aspx" class="btn btn-block btn-info">Login</a><br />
                            </div>
                            <div class="col-lg-2">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <p>Don't have an account? <a href="Registration.aspx" class="text-primary">Click Here to Register</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    <% } %>
    </div>
</div> 
  

</asp:Content>
