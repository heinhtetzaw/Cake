<%@ Page Language="C#" AutoEventWireup="true" CodeFile="page_google_map.aspx.cs"
    Inherits="Pages_page_google_map" Theme="default" %>

<%@ Register Assembly="Artem.Google" Namespace="Artem.Google.UI" TagPrefix="artem" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="width:100%;height:100%;padding:0px">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <artem:GoogleMap ID="google_map_default" runat="server"  MapType="Roadmap"
            Zoom="13" Height="280px" Width="100%" >
        </artem:GoogleMap>
    </div>
    
    </form>
</body>
</html>
