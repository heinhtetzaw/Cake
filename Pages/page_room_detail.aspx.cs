using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_page_room_detail : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = Title_Prefix + "Room";
    }
}