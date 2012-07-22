using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_contactus : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = "Shwe 8: Contact Us";
        if (IsPostBack) return;
    }
    Boolean ValidateBeforePost()
    {
        lbl_name_error.Text = ""; tb_name.CssClass = "OrignalX";
        lbl_email_error.Text = ""; tb_email.CssClass = "OrignalX";
        lbl_meassage_error.Text = ""; tb_meassage.CssClass = "OrignalX";

        Boolean IsValid = true;
        if (!CommonHelper.CheckValidEmailFormat(tb_email.Text))
        {
            lbl_email_error.Text = "Invalid Email Format.";
            tb_email.CssClass = "ErrorTextBox";
            IsValid = false;
        }

        if (tb_name.Text.Trim() == "" )
        {
            lbl_name_error.Text = "Please provide your name";
            tb_name.CssClass = "ErrorTextBox";
            IsValid = false;
        }

        if (tb_meassage.Text.Trim() == "")
        {
            lbl_meassage_error.Text = "Please provide your message on above";
            tb_meassage.CssClass = "ErrorTextBox";
            IsValid = false;
        }
        return IsValid;

    }
    protected void btn_send_Click(object sender, EventArgs e)
    {
        if (!ValidateBeforePost()) return;
        string Message = "Name: " + tb_name.Text + Environment.NewLine;
        Message += "Email: " + tb_email.Text + Environment.NewLine;
        Message += "Enquiry:" + Environment.NewLine + Environment.NewLine;
        Message += tb_meassage.Text;

        string email_result = CommonHelper.SendEmail("support@shwe8.net",
             "support@shwe8.net", "General enquiry to Shwe 8", Message);
        if (email_result == "success")
        {
            panel_form.Visible = false;
            panel_message.Visible = true;
        }
    }
}