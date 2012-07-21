using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Controls_PostAndViewCount : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack) return;
        filtered_site_status _status = Flat_Helper.Get_Site_Status();
        lbl_post.Text = String.Format("Posts: {0}", _status.total_post);
        lbl_view.Text = String.Format("Views: {0}", _status.total_view);
    }
}