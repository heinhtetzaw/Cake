using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Controls_BookmarkPostControl : System.Web.UI.UserControl
{
    public string PostID
    {
        set { HFPostID.Value = value; }
        get { return HFPostID.Value; }
    }
    public string User_Email
    {
        set
        {
            Session["current_email"] = value;
        }
        get
        {
            if (Session["current_email"] == null) return "";
            return Session["current_email"].ToString();
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack) return;
        tb_email.Text = "";
    }

    public void Refresh()
    {
        Boolean is_bookmarked = true;
        if (User_Email != "" && PostID != "")
        {
            is_bookmarked = Flat_Helper.is_bookmarked(User_Email, PostID);
        }
        else
        {
            is_bookmarked = false;
        }
        lbl_bookmarked.Visible = is_bookmarked;
        lbtn_bookmark.Visible = !is_bookmarked;
    }
    protected void lbtnGO_Click(object sender, EventArgs e)
    {
        lbl_error.Text = "";
        
        if ( Session["current_email"]==null)
        {
            if (tb_email.Visible == false)
            {
                tb_email.Visible = true;
                tb_email.CssClass = "ErrorTextBox";
                lbl_error.Text = "Please enter your email, bookmark again.";
                return;
            }
            else
            {
                if (CommonHelper.CheckValidEmailFormat(tb_email.Text))
                    Session["current_email"] = tb_email.Text;
                else
                {
                    tb_email.Visible = true;
                    tb_email.CssClass = "ErrorTextBox";
                    lbl_error.Text = "Please enter your email, bookmark again.";
                    return;
                }
            }
        }
       
        
        Flat_Helper.Bookmark_This_Post(HFPostID.Value, Session["current_email"].ToString());
        tb_email.Visible = false;
        lbl_error.Text = "";
        lbl_bookmarked.Visible = true;
        lbtn_bookmark.Visible = false;


    }
}