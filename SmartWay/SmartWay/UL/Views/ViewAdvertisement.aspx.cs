﻿using SmartWay.BL.Models;
using SmartWay.DAL.Controllers;
using System;
using System.IO;
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
            AdvertisementControls AC = new AdvertisementControls();
            int id = Convert.ToInt32(adId);
            txtViewCount.Text = Convert.ToString(AC.getViewCount(id));
            if (Session["currentUser"] != null)
            {
                if (Session[adId] == null)
                {
                    id = Convert.ToInt32(adId);
                    int count = Convert.ToInt32(txtViewCount.Text);
                    AC.updateViewCount(id, (count + 1));
                    Session[adId] = adId;
                }
            }
        }

        public void ReportAd(object sender, EventArgs e)
        {
            int ad = Convert.ToInt32(adID.Value);
            Person currentUser = (Person)Session["currentUser"];
            int userID = currentUser.userID;
            Response.Redirect("NewAddReviewRequest.aspx?userID=" + userID + "&adID=" + ad);
        }

        public List<Advertisement> getAd([Control]string adID)
        {
            int id = Convert.ToInt32(adID);
            AdvertisementControls AC = new AdvertisementControls();
            List<Advertisement> ad = AC.getAdvertisement(id);
            return ad;
        }

        public List<string> getAdImages(int adID)
        {
            AdvertisementControls AC = new AdvertisementControls();
            List<string> adImages = AC.getAdImages(adID);
            return adImages;
        }

        public void WantToBuy(object sender, EventArgs e)
        {
            string adID = Request.QueryString["advertisementID"];
            if (Session["currentUser"] != null)
            {
                //Person currentUser = (Person)Session["currentUser"];
                //string userID = Convert.ToString(currentUser.userID);
                Response.Redirect("WantToBuy.aspx?advertisementID=" + adID);
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        public int getOfferCount(int adID)
        {
            AdvertisementControls AC = new AdvertisementControls();
            int count = AC.getOfferCount(adID);
            return count;
        }
    }
}