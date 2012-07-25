using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text.RegularExpressions;
using System.Net.Mail;
using System.Net;
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
    public static String GetEasyPostTime(DateTime? check_date_time)
    {
        if (!check_date_time.HasValue) return "";
        string result = "";

        DateTime current_time = DateTime.Now;
        TimeSpan difference;
        if (current_time >= check_date_time.Value)
            difference = current_time.Subtract(check_date_time.Value);
        else
            difference = check_date_time.Value.Subtract(current_time);

        if (difference.Days == 0 && difference.Hours == 0 && difference.Minutes == 0)
            result = "just now";
        else if (difference.Days == 0 && difference.Hours == 0 && difference.Minutes > 0)
            result = string.Format("about {0} minutes ago", difference.Minutes.ToString());
        else if (difference.Days == 0 && difference.Hours > 0)
            result = string.Format("{0} hours {1} minutes ago", difference.Hours.ToString(), difference.Minutes.ToString());
        else if (difference.Days > 0 && difference.Days <= 7)
            result = string.Format("last {0} days ago", difference.Days.ToString());
        else if (difference.Days > 7)
            result = check_date_time.Value.ToString("dd MMMM hh:mm tt");
        return result;
    }
    public static String GetStandardDateFormat(DateTime? check_date_time)
    {
        if (check_date_time.HasValue)
            return check_date_time.Value.ToString("dd/MM/yyyy");
        else
            return " - ";
    }
    public static String GetStandardPriceFormat(Int32? check_price)
    {
        if (check_price.HasValue)
            return "S$ " + check_price.Value.ToString("D0");
        else
            return " - ";
    }
    public static String GetGenderFormart(string check_gender)
    {
        switch (check_gender)
        {
            case "m": return "Male Only";
            case "f": return "Female Only";
            case "c": return "Couple Only";
            case "b": return "Male/Female";
        }
        return " - ";
    }

    public static String ReportError(Exception ex, String extra_parameter)
    {
        String Support_Email = "support@shwe8.net";
        String Subject = String.Format("Support: Error report on {0}", DateTime.Now.ToString("dd/MM/yyyy hh:mm:ss tt"));
        String Body = String.Format("Information: {0}\nError Message:{1}", extra_parameter, ex.Message);
        SendEmail(Support_Email, Support_Email, Subject, Body);
        return "Oops. Your action is unsuccessed becuase of the system fault. We have immediately inform to Shwe 8 Support Team. \n Please refresh the page and try again.\n Sorry :(";
    }

    public static String SendEmail(string from_mail_address, string to_mail_address, string subject, string body)
    {
        MailMessage mailObj = new MailMessage(from_mail_address, to_mail_address, subject, body);
        SmtpClient SMTPServer = new SmtpClient("mail.shwe8.net");
        SMTPServer.EnableSsl = false;
        SMTPServer.Timeout = 10000;
        SMTPServer.DeliveryMethod = SmtpDeliveryMethod.Network;
        SMTPServer.UseDefaultCredentials = false;
        SMTPServer.Credentials = new NetworkCredential("support@shwe8.net", "nop@ssw0rd");

        try
        {
            SMTPServer.Send(mailObj);
            return "success";
        }
        catch (Exception ex)
        {
            return ex.ToString();
        }
    }
}