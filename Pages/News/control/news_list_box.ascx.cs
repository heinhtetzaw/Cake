using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_News_control_news_list_box : System.Web.UI.UserControl
{
    String _header;
    public String Header
    {
        get { return _header; }
        set { _header = value; }
    }
    String _News_Type;
    public String News_Type
    {
        get { return _News_Type; }
        set { _News_Type = value; }

    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack) return;
        
    }

    public void BindList()
    {
        Bind_List(0);
    }

    #region Grid Listing Event
    protected void gridview_news_list_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        Bind_List(e.NewPageIndex);
    }

    protected void gridview_news_list_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if (e.Row.RowState == DataControlRowState.Alternate)
            {
                e.Row.Attributes.Add("onmouseover", "this.className='GridMouseOverRow'");
                e.Row.Attributes.Add("onmouseout", "this.className='GridAlterRow'");
            }
            else
            {
                e.Row.Attributes.Add("onmouseover", "this.className='GridMouseOverRow'");
                e.Row.Attributes.Add("onmouseout", "this.className='GridRow'");
            }

        }
    }
    public String GenerateNewDetailPageLinkOnly(String news_id)
    {
        return string.Format("{0}://{1}{2}/news/{3}", Request.Url.Scheme, Request.Url.Authority, Request.ApplicationPath, news_id);
    }



    protected void gridview_news_list_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }
    #endregion

    #region Private Functions
    private void Bind_List(Int32 index_page)
    {
        gridview_news_list.PageIndex = index_page;
        gridview_news_list.DataSource = News_Helper.Get_News_Post_List("", News_Type, index_page, gridview_news_list.PageSize);
        gridview_news_list.DataBind();
    }
    #endregion
}