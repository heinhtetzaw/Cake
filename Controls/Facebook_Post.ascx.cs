using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ImpactWorks.FBGraph.Connector;
using ImpactWorks.FBGraph.Core;
using ImpactWorks.FBGraph.Interfaces;

public partial class Controls_Facebook_Post : BaseControl
{
    public String Caption {
        get { return hfCaption.Value; }
        set { hfCaption.Value = value; }
    }

    public String Description {
        get { return hfDescription.Value; }
        set { hfDescription.Value = value; }
    } 
    public String ImageURL
    {
        get{ return hfImageURL.Value;}
        set{hfImageURL.Value=value;}
    }
    public String Message
    {
        get{return hfMessage.Value;}
        set{hfMessage.Value=value;}
    }
    public String PostName
    {
        get{return hfName.Value;}
        set{hfName.Value=value;}
    }
    public String PostURL
    {
        get{return hfURL.Value;}
        set{ hfURL.Value=value;}
    }
  

    protected void Page_Load(object sender, EventArgs e)
    {
        #region Get the code returned by Facebook
        lbl_status.Text = ""; btnShare.Visible = true;
        if (!String.IsNullOrEmpty(Request.QueryString["code"]) && GetSessionValue("request_session").ToString() == "true")
        {
            ImpactWorks.FBGraph.Connector.Facebook facebook = GetSessionValue("current_facebook_account") as ImpactWorks.FBGraph.Connector.Facebook;
            //Get the code returned by facebook
            string Code = Request.QueryString["code"];

            //process code for auth token
            facebook.GetAccessToken(Code);

            //Get User info
            FBUser currentUser = facebook.GetLoggedInUserInfo();
            //Link share

            IFeedPost FBpost = new FeedPost();

            //Custom Action that we can add
            FBpost.Action = new FBAction { Name = "Via Shwe8.NET Room Adv.", Link = "http://www.shwe8.net" };
            FBpost.Caption =Caption;
            FBpost.Description =Description;
            FBpost.ImageUrl = ImageURL;
            FBpost.Message =Message;
            FBpost.Name =PostName;
            FBpost.Url = PostURL;

            var postID = facebook.PostToWall(currentUser.id.GetValueOrDefault(), FBpost);
            SetSessionValue("request_session", "false");
            lbl_status.Text = "Shared on facebook successfully. Great!";
            btnShare.Visible = false;
        }

        #endregion
    }
    protected void btnShare_Click(object sender, EventArgs e)
    {
        //Setting up the facebook object
        ImpactWorks.FBGraph.Connector.Facebook facebook = new ImpactWorks.FBGraph.Connector.Facebook();
        facebook.AppID = CommonHelper.GetWebAppSetting("FBAppID");
        facebook.CallBackURL = System.Web.HttpContext.Current.Request.Url.ToString(); 
        facebook.Secret = CommonHelper.GetWebAppSetting("FBSecret");

        //Setting up the permissions
        List<FBPermissions> permissions = new List<FBPermissions>() {
            
                FBPermissions.email, //To get user's email address
                FBPermissions.user_about_me, // to read about me
                FBPermissions.user_birthday, // Get DOB
                FBPermissions.user_education_history, //get education
                FBPermissions.user_location, //Location of user
                FBPermissions.user_relationships,//relationship status of user
                FBPermissions.user_work_history,//Workhistory of user
                FBPermissions.user_website,//website entered in fb Profilr
                FBPermissions.create_event,
                FBPermissions.user_events,
                FBPermissions.user_status,
                FBPermissions.read_stream,
                FBPermissions.friends_events,
                FBPermissions.publish_stream
            };

        //Pass the permissions object to facebook instance
        facebook.Permissions = permissions;

        if (String.IsNullOrEmpty(Request.QueryString["code"]))
        {
            String authLink = facebook.GetAuthorizationLink();
            SetSessionValue("request_session", "true");
            SetSessionValue( "current_facebook_account",facebook);
            Response.Redirect(authLink);
        }
    }
}