using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
public partial class _Default : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
     

    }

   
    protected void btn_myanmar_Command(object sender, CommandEventArgs e)
    {
        switch (e.CommandArgument.ToString())
        {
            case "myanmar": CommonHelper.SetCurrentCulture("zh-cn"); break;
            case "english": CommonHelper.SetCurrentCulture("en-US"); break;
        }
       Response.Redirect(Request.Url.ToString(),false);
    }
}
