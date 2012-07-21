using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Artem.Google.UI;
public partial class Pages_page_room_listing : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack) return;

        String postal_code_value = "310205";
        Marker _marker = new Marker();
        _marker.Address = postal_code_value;
        _marker.Animation = MarkerAnimation.Drop;
        _marker.Title = "Here";
        _marker.Info = "310205";

        //MarkerImage _marker_image = new MarkerImage();
        //_marker_image.Url = "http://aux4.iconpedia.net/uploads/929579781226397845.png";
        //_marker.Icon = _marker_image;

        googlemap.Markers.Add(_marker);
        googlemap.DefaultAddress = postal_code_value;

        Bind_MRT_DDL();

        gridview_rooms_list.DataSource = Flat_Helper.Get_Flat_Room_List();
        gridview_rooms_list.DataBind();
    }
    private void Bind_MRT_DDL()
    {
        List<filtered_flat_mrt> mrts = Flat_Helper.Get_MRT_List();
        filtered_flat_mrt default_mrt = new filtered_flat_mrt()
        {
            mrt_name = "All MRT",
            mrt_id = "all"
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

        gridview_rooms_list.DataSource = Flat_Helper.Get_Flat_Room_List(ddl_mrt1.SelectedValue, ddl_roomate.SelectedValue);
        gridview_rooms_list.DataBind();
    }

    protected void gridview_rooms_list_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "go_detail")
        {
            //gridview_rooms_list.SelectedIndex = e.CommandSource.;
            string room_id = e.CommandArgument.ToString();
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

                //Google Map
                String postal_code_value = _room.postal_code;
                Marker _marker = new Marker();
                _marker.Address = postal_code_value;
                _marker.Animation = MarkerAnimation.Drop;
                _marker.Title = _room.title;
                _marker.Info = _room.title;

                //MarkerImage _marker_image = new MarkerImage();
                //_marker_image.Url = "http://aux4.iconpedia.net/uploads/929579781226397845.png";
                //_marker.Icon = _marker_image;

                googlemap.Markers.Add(_marker);
                googlemap.DefaultAddress = postal_code_value;


                panel_record.Visible = true;


            }
        }
    }
    protected void btn_close_Click(object sender, EventArgs e)
    {
        panel_record.Visible = false;
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
}