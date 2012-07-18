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
        RoomsDataContext _roomsDataContext = new RoomsDataContext();
        List<room> rooms=  (from c in _roomsDataContext.rooms   select c).ToList();
        gridview_rooms_list.DataSource = rooms;
        gridview_rooms_list.DataBind();
    }
}