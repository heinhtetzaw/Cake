using System;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Text.RegularExpressions;
using System.Web;
using System.Globalization;
using System.Threading;
/// <SUMMARY>
/// Base class with properties for meta tags for content pages 
/// </SUMMARY>


public class BaseControl : UserControl
{


    #region Session GET/SET Function
    public void SetSessionValue(String SessionName, Object SessionValue)
    {
        Session[SessionName] = SessionValue;
    }
    public Object GetSessionValue(String SessionName)
    {
        try
        {
            if (Session[SessionName] == null)
                return "";
            else
                return Session[SessionName] as Object;
        }
        catch (Exception ex)
        {
            //Unhalded Exception;
            return "Session Error: " + ex.Message;
        }
    }
    #endregion
    public String GenerateNewDetailPageLink(String Room_ID)
    {
        return string.Format("OpenNewWindow('{0}://{1}{2}/room/{3}');", Request.Url.Scheme, Request.Url.Authority, Request.ApplicationPath, Room_ID);
    }
}
public class BasePage : Page
{
    #region Localization
    protected override void InitializeCulture()
    {
        try
        {
            Thread.CurrentThread.CurrentCulture = new CultureInfo(GetCurrentCultureCode());
            Thread.CurrentThread.CurrentUICulture = Thread.CurrentThread.CurrentCulture;
        }
        catch
        {
            throw;
        }

    }

    public string GetCurrentCultureName()
    {
        string myCultureName = "";
        switch (GetCurrentCultureCode().ToLower())
        {
            case "zh-cn": myCultureName = "myanmar"; break;
            case "en-us": myCultureName = "english"; break;
        }
        return myCultureName;
    }
    public string GetCurrentCultureCode()
    {

        if (Session["sCurrentCulture"] == null)
        {
            return "zh-cn";
        }
        else
        {
            return Session["sCurrentCulture"].ToString();
        }
    }

    #endregion

    #region Session GET/SET Function
    public void SetSessionValue(String SessionName, Object SessionValue)
    {
        Session[SessionName] = SessionValue;
    }
    public Object GetSessionValue(String SessionName)
    {
        try
        {
            if (Session[SessionName] == null)
                return "";
            else
                return Session[SessionName] as Object;
        }
        catch (Exception ex)
        {
            //Unhalded Exception;
            return "Session Error: " + ex.Message;
        }
    }
    #endregion
    public string Title_Prefix = "Shwe 8: ";
    // Constructor
    // Add an event handler to Init event for the control
    // so we can execute code when a server control (page)
    // that inherits from this base class is initialized.
    public BasePage()
    {
        Init += new EventHandler(BasePage_Init);
    }

    // Whenever a page that uses this base class is initialized
    // add meta keywords and descriptions if available
    void BasePage_Init(object sender, EventArgs e)
    {
        AddMetaData();
    }


    public String GenerateNewDetailPageLink(String Room_ID)
    {
        return string.Format("OpenNewWindow('{0}://{1}{2}room/{3}');", Request.Url.Scheme, Request.Url.Authority, Request.ApplicationPath, Room_ID);
    }
    public String GenerateNewDetailPageLinkOnly(String Room_ID)
    {
        return string.Format("{0}://{1}{2}/room/{3}", Request.Url.Scheme, Request.Url.Authority, Request.ApplicationPath, Room_ID);
    }
    public void AddMetaData()
    {

        HtmlMeta _metaD = new HtmlMeta();
        _metaD.Name = "Description";
        _metaD.Content = "Shwe8.net is the one of search engine site for Myanmar in  Singapore as shwe rooms.";

        HtmlMeta _metaK = new HtmlMeta();
        _metaK.Name = "Keywords";
        _metaK.Content = "Shwe room, Room Rent, Singapore, Shwe8, HDB in Singapore, House for Myanmar, Myanmar Room, Find room mate, Search Room, cheap rental rooms in singapore"
            + ", renting apartment in singapore"
            + ", free property advertisement"
            + ", finding rooms for rent"
            + ", rented flats in singapore"
            ;

        ((Control)Header).Controls.Add(_metaD);
        ((Control)Header).Controls.Add(_metaK);
    }

}
