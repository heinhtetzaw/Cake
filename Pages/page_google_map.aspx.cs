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
        String postal_code_value = Page.RouteData.Values["postalcode"] as string;
        Marker _marker=new Marker();
        _marker.Address = postal_code_value;
        _marker.Animation = MarkerAnimation.Drop;
        _marker.Title = "Here";
        _marker.Info = postal_code_value;

        //MarkerImage _marker_image = new MarkerImage();
        //_marker_image.Url = "http://aux4.iconpedia.net/uploads/929579781226397845.png";
        //_marker.Icon = _marker_image;

        google_map_default.Markers.Add(_marker);
        google_map_default.DefaultAddress = postal_code_value;
    }
}