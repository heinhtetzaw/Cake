﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Artem.Google.UI;
using System.Data;
public partial class Pages_page_room_listing : BasePage
{

    protected void Page_Load(object sender, EventArgs e)
    {
        DateTime Start_point = DateTime.Now;

        this.Title = Title_Prefix + "Rooms";
        if (IsPostBack) return;


        Bind_MRT_DDL();
        Bind_List(0);

        DateTime end_point = DateTime.Now;
        TimeSpan difference = end_point.Subtract(Start_point);
        lbl_search_duration.Text = String.Format("Searching time: {0}", difference.TotalMilliseconds.ToString());


    }

    private void Bind_MRT_DDL()
    {
        List<filtered_flat_mrt> mrts = Flat_Helper.Get_MRT_List();
        filtered_flat_mrt default_mrt = new filtered_flat_mrt()
        {
            mrt_name = "All MRT",
            mrt_id = "all"
        };
        mrts.Add(default_mrt);


        ddl_mrt1.DataTextField = "mrt_name";
        ddl_mrt1.DataValueField = "mrt_id";
        ddl_mrt1.DataSource = mrts;
        ddl_mrt1.DataBind();
        ddl_mrt1.SelectedValue = "all";
    }
    protected void btn_search_Click(object sender, EventArgs e)
    {
        hf_current_page.Value = "0";
        Bind_List(0);
    }


    public String GenerateNewDetailPageLink(String Room_ID)
    {
        return string.Format("OpenNewWindow('{0}://{1}{2}room/{3}');", Request.Url.Scheme, Request.Url.Authority, Request.ApplicationPath, Room_ID);
    }
    public String GenerateNewDetailPageLinkOnly(String Room_ID)
    {
        return string.Format("{0}://{1}{2}/room/{3}", Request.Url.Scheme, Request.Url.Authority, Request.ApplicationPath, Room_ID);
    }

    protected void gridview_rooms_list_RowDataBound(object sender, GridViewRowEventArgs e)
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


    protected void gridview_rooms_list_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        Bind_List(e.NewPageIndex);
    }
    private void Bind_List(Int32 index_page)
    {
        DateTime Start_point = DateTime.Now;
        List<filtered_flat_room> Search_Result= Flat_Helper.Get_Flat_Room_List(ddl_mrt1.SelectedValue, rbtn_welcomeType.SelectedValue, index_page, gridview_rooms_list.PageSize).ToList();
        //gridview_rooms_list.PageIndex = index_page;
        gridview_rooms_list.DataSource =Search_Result;
        gridview_rooms_list.DataBind();
        lbtn_Previous.Visible = (index_page != 0);
        lbtn_Next.Visible = (gridview_rooms_list.PageSize < Search_Result.Count);

        DateTime end_point = DateTime.Now;
        TimeSpan difference = end_point.Subtract(Start_point);
        lbl_search_duration.Text = String.Format("Searching time: {0}", difference.TotalMilliseconds.ToString());
    }
    protected void lbtn_Next_Click(object sender, EventArgs e)
    {
        Int32 _newPageIndex = Int32.Parse(hf_current_page.Value) + 1;
        hf_current_page.Value = _newPageIndex.ToString();
        Bind_List(_newPageIndex);
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
}