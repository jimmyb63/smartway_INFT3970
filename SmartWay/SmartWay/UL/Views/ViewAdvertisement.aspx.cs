﻿using SmartWay.BL.Models;
using SmartWay.DAL.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartWay.UL.Views
{
    public partial class ViewAdvertisement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string adId = "";
            if (Request.QueryString["advertisementID"] != "" && Request.QueryString["advertisementID"] != null)
            {
                adId = Request.QueryString["advertisementID"];
            }

            adID.Value = adId;
        }

        protected void reportAd(object sender, EventArgs e)
        {
            int ad = Convert.ToInt32(adID.Value);
            Person currentUser = (Person)Session["currentUser"];
            int userID = currentUser.userID;
            Response.Redirect("NewAddReviewRequest.aspx?userID=" + userID + "&adID=" + ad);
        }

        protected List<Advertisement> getAd([Control]string adID)
        {
            int id = Convert.ToInt32(adID);
            AdvertisementControls AC = new AdvertisementControls();
            List<Advertisement> ad = AC.getAdvertisement(id);
            return ad;
        }

        protected List<string> getAdImages(int adID)
        {
            AdvertisementControls AC = new AdvertisementControls();
            List<string> adImages = AC.getAdImages(adID);
            return adImages;
        }
    }
}