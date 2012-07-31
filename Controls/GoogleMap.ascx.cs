using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Artem.Google.UI;
public partial class Controls_GoogleMap : System.Web.UI.UserControl
{
    public String Postal_Code;
    public String MRT_Station;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack) return;

    }
    public void Generate_Map()
    {

        if (MRT_Station != "")
        {
            Marker _marker_mrt = new Marker();
            _marker_mrt.Address = MRT_Station + " Station";
            _marker_mrt.Animation = MarkerAnimation.Drop;
            _marker_mrt.Title = "Nearest MRT: " + MRT_Station;
            _marker_mrt.Info = _marker_mrt.Address;

            MarkerImage _marker_image = new MarkerImage();
            _marker_image.Url = "../Images/train.png";
            _marker_mrt.Icon = _marker_image;
            google_map_default.Markers.Add(_marker_mrt);


        }
        if (Postal_Code != "")
        {
            Marker _marker = new Marker();
            _marker.Address = Postal_Code + " Singapore";
            _marker.Animation = MarkerAnimation.Drop;
            _marker.Title = "Postal Code: " + Postal_Code;
            _marker.Info = Postal_Code;
            google_map_default.Markers.Add(_marker);

        }
        google_map_default.DefaultAddress = (Postal_Code != "") ? Postal_Code + " Singapore" : MRT_Station + " MRT Singapore";
       
    }
}