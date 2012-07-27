using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String orignal_server_name = this.Request.ServerVariables["SERVER_NAME"];
        switch (orignal_server_name.Trim().ToLower())
        {
            case "contact.shwe8.net": Response.Redirect("http://shwe8.net/contactus"); break;
            case "room.shwe8.net": Response.Redirect("http://shwe8.net/list/all"); break;
            case "shwe8.net": Response.Redirect("http://shwe8.net/list/all"); break;
            case "www.shwe8.net": Response.Redirect("http://shwe8.net/list/all"); break;
        }
    }
}