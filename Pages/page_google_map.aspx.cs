using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Artem.Google.UI;
public partial class Pages_page_google_map : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (IsPostBack) return;
        String location =Page.RouteData.Values["postalcode"] as string;
        String postal_code_value = location.Split('^')[0];
        String mrt_station = location.Split('^')[1];

        if (postal_code_value != "")
        {
            Marker _marker = new Marker();
            _marker.Address =  postal_code_value + " Singapore";
            _marker.Animation = MarkerAnimation.Drop;
            _marker.Title = "Postal Code: " + postal_code_value;
            _marker.Info = postal_code_value;
            google_map_default.Markers.Add(_marker);
        }

        if (mrt_station != "")
        {
            Marker _marker_mrt = new Marker();
            _marker_mrt.Address = mrt_station + " Station";
            _marker_mrt.Animation = MarkerAnimation.Drop;
            _marker_mrt.Title = "Nearest MRT: " + mrt_station;
            _marker_mrt.Info = _marker_mrt.Address;

            MarkerImage _marker_image = new MarkerImage();
            _marker_image.Url = "../Images/train.png";
            _marker_mrt.Icon = _marker_image;
            google_map_default.Markers.Add(_marker_mrt);
        }
      
        
        google_map_default.DefaultAddress = postal_code_value;
    }
}