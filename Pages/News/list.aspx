<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/News/news.master" AutoEventWireup="true"
    Theme="default" CodeFile="list.aspx.cs" Inherits="Pages_News_list" %>

<%@ Register Src="../../Controls/GoogleAdsence_SlideBar.ascx" TagName="GoogleAdsence_SlideBar"
    TagPrefix="uc1" %>
<%@ Register Src="../../Controls/facebookLike.ascx" TagName="facebookLike" TagPrefix="uc2" %>
<%@ Register Src="../../Controls/CakeExchangeRate.ascx" TagName="CakeExchangeRate"
    TagPrefix="uc3" %>
<%@ Register Src="control/news_list_box.ascx" TagName="news_list_box" TagPrefix="uc4" %>
<%@ Register Src="../Rooms/control/PostRoomAdv.ascx" TagName="PostRoomAdv" TagPrefix="uc5" %>
<%@ Register Src="../Rooms/control/FindRoomAdv.ascx" TagName="FindRoomAdv" TagPrefix="uc6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainPanel" runat="Server">
    <asp:UpdatePanel runat="server" ID="panel_main">
        <ContentTemplate>
            <div class="WorkingBox" >
                <uc4:news_list_box ID="list_policy" runat="server" News_Type="1" Header="ႏုိင္ငံေရး သတင္းမ်ား" />
                <uc4:news_list_box ID="list_economic" runat="server" News_Type="2" Header="စီးပြားေရး သတင္းမ်ား" />
                <uc4:news_list_box ID="list_techno" runat="server" News_Type="4" Header="နည္းပညာ သတင္းမ်ား" />
                <uc4:news_list_box ID="list_crime" runat="server" News_Type="5" Header="မွဴခင္း သတင္းမ်ား" />
                <uc4:news_list_box ID="lsit_international" runat="server" News_Type="7" Header="ႏုိင္ငံတကာ သတင္းမ်ား" />
                <uc4:news_list_box ID="list_art" runat="server" News_Type="3" Header="အႏုပညာ သတင္းမ်ား" />
                <uc4:news_list_box ID="list_sport" runat="server" News_Type="6" Header="အားကစား သတင္းမ်ား" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RightSidePanel" runat="Server">
    <uc6:FindRoomAdv ID="FindRoomAdv1" runat="server" />
    <hr />
    <uc3:CakeExchangeRate ID="CakeExchangeRate1" runat="server" />
    <hr />
    <uc5:PostRoomAdv ID="PostRoomAdv1" runat="server" />
    <hr />
    <uc2:facebookLike ID="facebookLike1" runat="server" />
</asp:Content>
