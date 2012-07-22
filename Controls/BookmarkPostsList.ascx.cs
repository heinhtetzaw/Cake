using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Controls_BookmarkPostsList : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack) return;
        if (Session["current_email"] != null && Session["current_email"]!="")
        {
            tb_useremail.Text = Session["current_email"].ToString();
        }
        Refersh();
    }
    public void Refersh()
    {


        List<filtered_flat_bookmark> list = Flat_Helper.Get_Flat_Room_List_with_bookmark(tb_useremail.Text);
        Session["current_email"] = tb_useremail.Text;
        
        gridview_rooms_list.DataSource = list;
        gridview_rooms_list.DataBind();

    }
    protected void gridview_rooms_list_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "go_detail")
        {
            string room_id = e.CommandArgument.ToString();
            flat_room_detail.View_Record(room_id);
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

    protected void btnRefresh_Click(object sender, EventArgs e)
    {
        lbl_error.Text = "";
        if (!CommonHelper.CheckValidEmailFormat(tb_useremail.Text))
        {
            lbl_error.Text = "Use valid email address format.";
            return;
        }
    
        Refersh();
    }
    protected void gridview_rooms_list_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gridview_rooms_list.PageIndex = e.NewPageIndex;
        Refersh();
    }
}