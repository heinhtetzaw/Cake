using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_page_room_post : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = "shwe8.com, Post";
        if (IsPostBack) return;
        // Get MRT List;
        List<filtered_flat_mrt> mrts = Flat_Helper.Get_MRT_List();
        ddl_mrt1.DataTextField = "mrt_name";
        ddl_mrt1.DataValueField = "mrt_id";
        ddl_mrt1.DataSource = mrts;
        ddl_mrt1.DataBind();

        ddl_mrt2.DataTextField = "mrt_name";
        ddl_mrt2.DataValueField = "mrt_id";
        ddl_mrt2.DataSource = mrts;
        ddl_mrt2.DataBind();

        ddl_mrt3.DataTextField = "mrt_name";
        ddl_mrt3.DataValueField = "mrt_id";
        ddl_mrt3.DataSource = mrts;
        ddl_mrt3.DataBind();

        if (Session["current_email"] != null &&
        Session["current_mobile"] != null)
        {
            tb_email.Text = Session["current_email"].ToString();
            tb_mobile.Text = Session["current_mobile"].ToString();
            Fill_On_Form();
        }
    }
    private void Fill_On_Form()
    {
        string email = tb_email.Text;
        string contact_no = tb_mobile.Text;

        Session["current_email"] = email;
        Session["current_mobile"] = contact_no;

        filtered_flat_room _flat_room = Flat_Helper.Get_Flat_Room(email, contact_no);
        Fill_On_Form(_flat_room);
    }
    private void Fill_On_Form(filtered_flat_room _flat_room)
    {
        if (_flat_room != null)
        {
            tb_description.Text = _flat_room.description;
            tb_postal_code.Text = _flat_room.postal_code;
            tb_title.Text = _flat_room.title;
            tb_price.Text = _flat_room.price.ToString();
            if (_flat_room.available_count.HasValue) ddl_available_person.SelectedValue = _flat_room.available_count.Value.ToString();
            if (_flat_room.available.HasValue) calendar_ex.SelectedDate = _flat_room.available;
            rbtn_looking_type.SelectedValue = _flat_room.available_type;

            ddl_mrt1.SelectedValue = _flat_room.mrt1_id;
            ddl_mrt2.SelectedValue = _flat_room.mrt2_id;
            ddl_mrt3.SelectedValue = _flat_room.mrt3_id;
        }
    }
    private flat_room Get_Object_Form()
    {
        flat_room _flat_room = new flat_room();

        _flat_room.description = tb_description.Text;
        _flat_room.title = tb_title.Text;
        _flat_room.email = tb_email.Text;
        _flat_room.contact_no = tb_mobile.Text;
        _flat_room.postal_code = tb_postal_code.Text;
        _flat_room.available_count = Int32.Parse(ddl_available_person.SelectedValue);
        _flat_room.available_type = rbtn_looking_type.SelectedValue;
        _flat_room.mrt1_id = ddl_mrt1.SelectedValue;
        _flat_room.mrt2_id = ddl_mrt2.SelectedValue;
        _flat_room.mrt3_id = ddl_mrt3.SelectedValue;

        // Availabe date
        DateTime available = DateTime.Now;
        System.Globalization.CultureInfo enUS = new System.Globalization.CultureInfo("en-US");
        if (DateTime.TryParseExact(tb_available.Text, "dd/MM/yyyy", enUS, System.Globalization.DateTimeStyles.None, out available))
            _flat_room.available = available;
        else
            _flat_room.available = null;
        // Price
        Int32 Price = 0;
        if (Int32.TryParse(tb_price.Text, out Price)) _flat_room.price = Price; else _flat_room.price = null;

        return _flat_room;
    }
    
    private Boolean ValidateBeforePost_Step1()
    {
        lbl_email_error.Text = ""; tb_email.CssClass = "OrignalX";
        lbl_mobile_error.Text = ""; tb_mobile.CssClass = "OrignalX";

        Boolean IsValid = true;
        if (!CommonHelper.CheckValidEmailFormat(tb_email.Text))
        {
            lbl_email_error.Text = "Invalid Email Format.";
            tb_email.CssClass = "ErrorTextBox";
            IsValid = false;
        }

        if (tb_mobile.Text.Trim() == "" || tb_mobile.Text.Length != 8)
        {
            lbl_mobile_error.Text = "Invalid, must be 8 digits.";
            tb_mobile.CssClass = "ErrorTextBox";
            IsValid = false;
        }
        return IsValid;
    }
    protected void lbtn_get_info_Click(object sender, EventArgs e)
    {
        if (!ValidateBeforePost_Step1()) return;
        Fill_On_Form();
    }
    protected void btn_post_Click(object sender, EventArgs e)
    {
        Session["current_email"] = tb_email.Text;
        Session["current_mobile"] = tb_mobile.Text;
        if (!ValidateBeforePost_Step1()) return;
        Flat_Helper.Update_Flat_Room(Get_Object_Form());
    }
}