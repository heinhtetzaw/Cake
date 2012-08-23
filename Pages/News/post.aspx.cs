using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_News_post : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = Title_Prefix + "News Post";
        if (IsPostBack) return;
        Load_Drop_Down_List();
    }

    protected void lbtn_post_Click(object sender, EventArgs e)
    {
        news_post _news_post = new news_post();
        _news_post.subject = tb_title.Text;
        _news_post.body = tb_post.Text;
        _news_post.news_source_id = ddl_source.SelectedValue;
        _news_post.news_type_id = ddl_news_type.SelectedValue;
        _news_post.img_url = tb_image_url.Text;

      String result=  News_Helper.Create_News_Post(_news_post);
      if (result.Contains("Fail"))
      {
          ShowMessageBox(result);
      }
      else
      {
          Reset_Form();
          ShowMessageBox("Post Successfully!");
      }

    }
    private void Reset_Form()
    {
        tb_title.Text = "";
        tb_post.Text = "";
        tb_image_url.Text = "";
        ddl_source.SelectedIndex = 0;
        ddl_news_type.SelectedIndex = 0;
    }
    private void Load_Drop_Down_List()
    {
        ddl_news_type.DataSource = News_Helper.Get_News_Type_List();
        ddl_news_type.DataTextField = "news_type_description";
        ddl_news_type.DataValueField = "news_type_id";
        ddl_news_type.DataBind();

        ddl_source.DataSource = News_Helper.Get_Resource_List();
        ddl_source.DataTextField = "source_name";
        ddl_source.DataValueField = "news_source_id";
        ddl_source.DataBind();
    }
}