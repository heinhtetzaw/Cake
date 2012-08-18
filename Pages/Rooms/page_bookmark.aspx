<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Rooms/Flat.master" Theme="default"
    AutoEventWireup="true" CodeFile="page_bookmark.aspx.cs" Inherits="Pages_page_bookmark" %>

<%@ Register Src="../../Controls/CakeExchangeRate.ascx" TagName="CakeExchangeRate" TagPrefix="uc1" %>
<%@ Register Src="../../Controls/PostAndViewCount.ascx" TagName="PostAndViewCount" TagPrefix="uc2" %>
<%@ Register Src="../../Controls/facebookLike.ascx" TagName="facebookLike" TagPrefix="uc3" %>
<%@ MasterType VirtualPath="~/MasterPage/Default.master" %>
<%@ Register Src="../../Controls/Flat_Room_Detail.ascx" TagName="Flat_Room_Detail" TagPrefix="uc4" %>
<%@ Register Src="../../Controls/BookmarkPostsList.ascx" TagName="BookmarkPostsList"
    TagPrefix="uc5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainPanel" runat="Server">
    <asp:UpdatePanel runat="server" ID="panel_main">
        <ContentTemplate>
            <asp:Panel runat="server" ID="panel_bookmarkedList">
                <uc5:BookmarkPostsList ID="bookmarked_list" runat="server" />
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RightSidePanel" runat="Server">
    <uc1:CakeExchangeRate ID="CakeExchangeRate1" runat="server" />
    <hr />
    <uc2:PostAndViewCount ID="PostAndViewCount1" runat="server" />
    <hr />
    <uc3:facebookLike ID="facebookLike1" runat="server" />
</asp:Content>
