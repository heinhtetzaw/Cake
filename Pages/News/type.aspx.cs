using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_News_type : BasePage
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
        get { return hf_news_type.Value; }
        set { hf_news_type.Value = value; }

    }

    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = Title_Prefix + "Myanmar NEWS";
        if (IsPostBack) return;
        if (Page.RouteData.Values["type_id"] != null)
        {
            News_Type = Page.RouteData.Values["type_id"].ToString();
            Bind_List(0);
        }
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
    protected void lbtn_Pre_Next_Command(object sender, CommandEventArgs e)
    {
        Int32 _newPageIndex = Int32.Parse(hf_current_page.Value);
        if (e.CommandArgument.ToString().ToLower() == "next")
        {
            _newPageIndex = _newPageIndex + 1;
        }
        else if (e.CommandArgument.ToString().ToLower() == "previous" && _newPageIndex != 0)
        {
            _newPageIndex = _newPageIndex - 1;
        }
        hf_current_page.Value = _newPageIndex.ToString();
        Bind_List(_newPageIndex);
    }
    #endregion

    #region Private Functions
    private void Bind_List(Int32 index_page)
    {
        List<filtered_news_post> Search_Result = News_Helper.Get_News_Post_List("", News_Type, index_page, gridview_news_list.PageSize).ToList();
        if (Search_Result.Count > 0) Header = Search_Result[0].news_type_description;
        gridview_news_list.DataSource = Search_Result;
        gridview_news_list.DataBind();
        lbtn_Previous.Visible = (index_page != 0);
        lbtn_Next.Visible = (gridview_news_list.PageSize < Search_Result.Count);
    }
    #endregion
}