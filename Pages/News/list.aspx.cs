﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_News_list : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = Title_Prefix + "NEWS";
        if (IsPostBack) return;
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
        return string.Format("{0}://{1}{2}/room/{3}", Request.Url.Scheme, Request.Url.Authority, Request.ApplicationPath, news_id);
    }



    protected void gridview_news_list_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        //if (e.CommandName == "post_facebook")
        //{
        //    int index = Convert.ToInt32(e.CommandArgument);

        //    GridViewRow currentRow = gridview_quote_list.Rows[index];
        //    String title = (currentRow.FindControl("lbl_title") as Label).Text;
        //    String quote_by = (currentRow.FindControl("lbl_QuoteBy") as Label).Text;
        //    String description = (currentRow.FindControl("lbl_description") as Label).Text;


        //    FBpost.PostName = title == "" || title == null ? String.Format("အေတြးအၿမင္မ်ား") : title;
        //    FBpost.Caption = quote_by == null || quote_by == "" ? "..." : quote_by;
        //    FBpost.Description = description;
        //    FBpost.ImageURL = "http://shwe8.net/images/quote.png";
        //    FBpost.Message = "Quotes via ေရႊအိတ္";
        //    FBpost.PostURL = string.Format("{0}://{1}{2}/quote", Request.Url.Scheme, Request.Url.Authority, Request.ApplicationPath);

        //    FBpost.Post_Now();

        //}
    }
    #endregion

    #region Private Functions
    private void Bind_List(Int32 index_page)
    {
        gridview_news_list.PageIndex = index_page;
        gridview_news_list.DataSource =News_Helper.Get_News_Post_List("","",index_page, gridview_news_list.PageSize);
        gridview_news_list.DataBind();
    }
    #endregion
}