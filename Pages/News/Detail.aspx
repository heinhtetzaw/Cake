<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/News/news.master" AutoEventWireup="true"
    Theme="default" CodeFile="Detail.aspx.cs" Inherits="Pages_News_Detail" %>

<%@ Register Src="../../Controls/facebookLike.ascx" TagName="facebookLike" TagPrefix="uc1" %>
<%@ Register Src="../../Controls/Facebook_Post.ascx" TagName="Facebook_Post" TagPrefix="uc2" %>
<%@ Register Src="../Rooms/control/PostRoomAdv.ascx" TagName="PostRoomAdv" TagPrefix="uc3" %>
<%@ Register Src="control/NewsAdv.ascx" TagName="NewsAdv" TagPrefix="uc4" %>
<%@ Register Src="control/news_list_box.ascx" TagName="news_list_box" TagPrefix="uc5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainPanel" runat="Server">
    <table width="100%">
        <tr>
            <td>
                <asp:Label runat="server" ID="lbl_title" CssClass="label_title5" />
            </td>
        </tr>
        <tr>
            <td>
                <table width="100%">
                    <tr valign="middle">
                        <td>
                            <uc2:Facebook_Post ID="fb_post" runat="server" />
                        </td>
                        <td align="right">
                            <asp:Label runat="server" ID="lbl_source" CssClass="label_supporter" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Image runat="server" ID="img_post" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lbl_description" Style="text-align: justify" />
            </td>
        </tr>
    </table>
    <hr />
   
    <uc5:news_list_box ID="list_related_news" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RightSidePanel" runat="Server">
    <uc1:facebookLike ID="facebookLike1" runat="server" />
    <uc3:PostRoomAdv ID="PostRoomAdv1" runat="server" />
    <uc4:NewsAdv ID="NewsAdv1" runat="server" />
</asp:Content>
