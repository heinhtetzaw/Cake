using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Web.UI.HtmlControls;

public partial class Controls_Flat_Room_Detail : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack) return;
    }
    public void View_Record(string room_id)
    {
        if (Flat_Helper.Update_View_Count(room_id))
        {
            filtered_flat_room _room = Flat_Helper.Get_Flat_Room(room_id);
            lbl_title.Text = _room.title;
            lbl_available_on.Text = _room.available.Value.ToString("dd/MM/yyyy");
            lbl_price.Text = _room.price.ToString() + " S$";
            lbl_postal_code.Text = _room.postal_code;
            lbl_description.Text = _room.description;
            lbl_nearest_mrt.Text = String.Format("{0}, {1}, {2}", _room.mrt1_name, _room.mrt2_name, _room.mrt3_name);
            lbl_post_on.Text = CommonHelper.GetEasyPostTime(_room.post_on.Value);

            panel_record.Visible = true;
            bookmark_object.PostID = _room.room_id;
            google_map_iframe.Attributes.Add("src", String.Format("../map/{0}", _room.postal_code+"^"+_room.mrt1_name));
            
            bookmark_object.Refresh();
            
        }
    }
    protected void btn_close_Click(object sender, EventArgs e)
    {
        panel_record.Visible = false;
    }
}