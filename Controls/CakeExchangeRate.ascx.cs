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
       
        CurrencyConverter cc = new CurrencyConverter();

        cc.AdjustToLocalTime = false;

        // Add a proxy here is needed. Example:
        // cc.Proxy = new System.Net.WebProxy("0.0.0.0", 80);

        try
        {
            CurrencyData cd = cc.GetCurrencyData("SGD", "MMK");
            lbl_ExchangeRate.Text = String.Format("1 SGD = {0} Kyats on {1}", cd.Rate.ToString("C0").Replace("$",""), cd.TradeDate.ToString("dd/MM/yyyy hh:mm:ss tt"));
          

      
        }
        catch (Exception ex)
        {
         
        }

    }
}