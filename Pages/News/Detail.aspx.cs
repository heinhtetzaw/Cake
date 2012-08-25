using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_News_Detail : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = Title_Prefix + "NEWS";
        if (IsPostBack) return;
        if (Page.RouteData.Values["news_id"] != null)
        {
            this.Title = View_Record(Page.RouteData.Values["news_id"].ToString());
        }
    }

    public String View_Record(string news_id)
    {
        DateTime Start_point = DateTime.Now;

        filtered_news_post _news_post = News_Helper.Get_News_Post(news_id);
        if (_news_post != null)
        {
            lbl_title.Text = _news_post.subject;
            lbl_description.Text = Server.HtmlDecode(_news_post.body.Replace(Environment.NewLine,"<br/>"));
            lbl_source.Text = String.Format("Source: {0}", _news_post.source_name);
            img_post.ImageUrl = _news_post.img_url;
            PostOnFacebook(_news_post);
            list_related_news.Header = "Related News:";
            list_related_news.News_Type = _news_post.news_type_id;
            list_related_news.BindList();
            return "Shwe 8: Myanmar News";
        }
        return "Oops... System has error :(";
    }
    void PostOnFacebook(filtered_news_post _news_post)
    {
        fb_post.PostName = "ေရႊအိတ္";
        fb_post.Caption = _news_post.news_type_description;
        fb_post.Description = _news_post.body;
        fb_post.ImageURL =_news_post.img_url.Trim()==""? "http://shwe8.net/images/daily_news.png": _news_post.img_url;
        fb_post.Message = _news_post.subject;
        fb_post.PostURL = string.Format("{0}://{1}{2}/news/{3}", Request.Url.Scheme, Request.Url.Authority, Request.ApplicationPath,_news_post.news_id);
      
    }
}