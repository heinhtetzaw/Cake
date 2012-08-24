using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_News_list : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = Title_Prefix + "Myanamr NEWS";
        if (IsPostBack) return;

        list_art.BindList();
        list_crime.BindList();
        list_economic.BindList();
        list_policy.BindList();
        list_sport.BindList();
        list_techno.BindList();
    }

}