using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text.RegularExpressions;

/// <summary>
/// Summary description for CommonHelper
/// </summary>
public static class CommonHelper
{
    public static Boolean CheckValidEmailFormat(string sEmail)
    {
        if (sEmail == null)
        {
            return false;
        }

        int nFirstAT = sEmail.IndexOf('@');
        int nLastAT = sEmail.LastIndexOf('@');

        if ((nFirstAT > 0) && (nLastAT == nFirstAT) &&
        (nFirstAT < (sEmail.Length - 1)))
        {
            // address is ok regarding the single @ sign
            return (Regex.IsMatch(sEmail, @"(\w+)@(\w+)\.(\w+)"));
        }
        else
        {
            return false;
        }

    }

    public static String GetEasyPostTime(DateTime check_date_time)
    {
        string result = "";
        DateTime current_time = DateTime.Now;
        TimeSpan difference = current_time.Subtract(check_date_time);
        if (difference.Days == 0 && difference.Hours == 0 && difference.Minutes == 0)
            result = "just now";
        else if (difference.Days == 0 && difference.Hours == 0 && difference.Minutes > 0)
            result = string.Format("about {0} minutes ago", difference.Minutes.ToString());
        else if (difference.Days == 0 && difference.Hours > 0)
            result = string.Format("{0} hours {1} minutes ago", difference.Hours.ToString(), difference.Minutes.ToString());
        else if (difference.Days > 0 && difference.Days <= 7)
            result = string.Format("last {0} days ago", difference.Days.ToString());
        else if (difference.Days > 7)
            result = check_date_time.ToString("dd MMMM hh:mm tt");
        return result;
    }
   
}