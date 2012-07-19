using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_page_room_listing : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack) return;
        Bind_MRT_DDL();

        gridview_rooms_list.DataSource = Flat_Helper.Get_Flat_Room_List();
        gridview_rooms_list.DataBind();
    }
    private void Bind_MRT_DDL()
    {
        List<filtered_flat_mrt> mrts = Flat_Helper.Get_MRT_List();
        filtered_flat_mrt default_mrt = new filtered_flat_mrt() { 
            mrt_name="All MRT",
            mrt_id="all"
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

        gridview_rooms_list.DataSource =Flat_Helper.Get_Flat_Room_List(ddl_mrt1.SelectedValue,ddl_roomate.SelectedValue) ;
        gridview_rooms_list.DataBind();
    }
}