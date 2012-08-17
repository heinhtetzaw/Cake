using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Zayko.Finance;
public partial class Controls_CakeExchangeRate : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ShowExchangeRate();
        }
    }
    private void ShowExchangeRate()
    {
        try
        {
            CurrencyConverter cc = new CurrencyConverter();

            cc.AdjustToLocalTime = false;

            // Add a proxy here is needed. Example:
            // cc.Proxy = new System.Net.WebProxy("0.0.0.0", 80);
            CurrencyData cd = cc.GetCurrencyData("SGD", "MMK");
            lbl_ExchangeRate.Text = String.Format("1 SGD = {0} Kyats", (cd.Rate - 7).ToString("C0").Replace("$", "").Replace("RM", "").Replace("¥", ""));
            lbl_checkon.Text = "based on Yahoo! Finance";
        }
        catch (Exception ex)
        {
            lbl_checkon.Text = "Service unavailable :(";
        }

    }
}