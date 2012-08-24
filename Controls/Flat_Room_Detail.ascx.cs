using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;



public partial class Controls_Flat_Room_Detail : BaseControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack) return;
    }
    public String View_Record(string room_id)
    {
        DateTime Start_point = DateTime.Now;

      

        if (Flat_Helper.Update_View_Count(room_id))
        {
            filtered_flat_room _room = Flat_Helper.Get_Flat_Room(room_id);
            lbl_page_title.Text = _room.title;
            lbl_title.Text = _room.title;
            lbl_contact_no.Text = _room.contact_no;
            if (_room.available.HasValue)
            {
                if (Int32.Parse(_room.available.Value.ToString("yyyyMMdd")) > Int32.Parse(DateTime.Now.ToString("yyyyMMdd")))
                {
                    lbl_available_on.Text = _room.available.Value.ToString("dd/MM/yyyy");
                }
                else
                {
                    lbl_available_on.Text = "Immediately";
                }


            }
            else
            {
                lbl_available_on.Text = "Not shown";
            }


            switch (_room.available_type)
            {
                case "b": lbl_available_for.Text = "Both Male/Female"; break;
                case "m": lbl_available_for.Text = "Male only"; break;
                case "f": lbl_available_for.Text = "Female only"; break;
                case "c": lbl_available_for.Text = "Couple only"; break;
            }
            lbl_available_for.Text = string.Format("{0}, for {1} person{2}.",
                lbl_available_for.Text,
                _room.available_count,
                (_room.available_count > 1) ? "s" : "");
            if (_room.price.HasValue)
                lbl_price.Text = _room.price.ToString() + " S$";
            else
                lbl_price.Text = "Please contact for price.";

            lbl_postal_code.Text = (_room.postal_code == "") ? "Not shown" : _room.postal_code;
            lbl_description.Text = _room.description;


            lbl_nearest_mrt.Text = String.Format("{0}{1}{2}", _room.mrt1_name,
                _room.mrt2_name == null ? "" : ", " + _room.mrt2_name,
                _room.mrt3_name == null ? "" : ", " + _room.mrt3_name);
            lbl_post_on.Text = CommonHelper.GetEasyPostTime(_room.post_on.Value);
            lbl_view.Text = String.Format("Total View: {0}", _room.view_count.ToString());

            panel_record.Visible = true;
            bookmark_object.PostID = _room.room_id;
            google_map.Postal_Code = _room.postal_code;
            google_map.MRT_Station = _room.mrt1_name;
            google_map.Generate_Map();

            #region Facebook Post Paramenters
            FBpost.PostName = _room.title;
            FBpost.Caption = lbl_available_for.Text;
            FBpost.Description = _room.description;
            FBpost.ImageURL = "http://shwe8.net/images/train.png";
            FBpost.Message = "အိမ္ခန္းေၾကၿငာ via Shwe8.Net";
            FBpost.PostURL = System.Web.HttpContext.Current.Request.Url.ToString();


            #endregion


            bookmark_object.Refresh();

            DateTime end_point = DateTime.Now;
            TimeSpan difference = end_point.Subtract(Start_point);
            lbl_loading_time.Text = String.Format("Loading time: {0}", difference.TotalMilliseconds.ToString());
            return (_room.postal_code == "") ? _room.mrt1_name : _room.postal_code;



        }
        return "Oops: Error";
    }

}