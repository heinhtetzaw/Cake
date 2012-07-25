using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Artem.Google.UI;
public partial class Pages_page_room_listing :BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
         this.Title =Title_Prefix+"Rooms";
         if (IsPostBack) return;

        Bind_MRT_DDL();

        Bind_List(0);
       
       

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
        Bind_List(0);
    }

    protected void gridview_rooms_list_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "go_detail")
        {
            string room_id = e.CommandArgument.ToString();
        }
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


    protected void lbn_title_Click(object sender, EventArgs e)
    {
        GridViewRow selectedRow = ((Control)sender).Parent.NamingContainer as GridViewRow;
        gridview_rooms_list.SelectedIndex = selectedRow.RowIndex;
    }

   
    protected void gridview_rooms_list_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        Bind_List(e.NewPageIndex);
    }
    private void Bind_List(Int32 index_page)
    {
        DateTime Start_point = DateTime.Now;
        gridview_rooms_list.PageIndex = index_page;
        gridview_rooms_list.DataSource = Flat_Helper.Get_Flat_Room_List(ddl_mrt1.SelectedValue,rbtn_welcomeType.SelectedValue);
        gridview_rooms_list.DataBind();
        DateTime end_point = DateTime.Now;
        TimeSpan difference = end_point.Subtract(Start_point);
        lbl_search_duration.Text = String.Format("Searching time: {0}", difference.TotalMilliseconds.ToString());
    }
}