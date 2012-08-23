<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Quotes/Quote.master" AutoEventWireup="true"
    Theme="default" CodeFile="page_quote_listing.aspx.cs" Inherits="Pages_Quotes_page_quote_listing" %>

<%@ Register Src="../../Controls/Facebook_Post.ascx" TagName="Facebook_Post" TagPrefix="uc3" %>
<%@ Register Src="../../Controls/GoogleAdsence_SlideBar.ascx" TagName="GoogleAdsence_SlideBar"
    TagPrefix="uc1" %>
<%@ Register Src="../../Controls/CakeExchangeRate.ascx" TagName="CakeExchangeRate"
    TagPrefix="uc2" %>
<%@ Register Src="../../Controls/facebookLike.ascx" TagName="facebookLike" TagPrefix="uc4" %>
<%-- Add content controls here --%>
<asp:Content ID="Content2" ContentPlaceHolderID="MainPanel" runat="Server">
    <asp:UpdatePanel runat="server" ID="panel_main">
        <ContentTemplate>
            <div class="WorkingBox">
                <asp:GridView ID="gridview_quote_list" runat="server" CellPadding="5" Width="100%"
                    OnRowDataBound="gridview_Quote_list_RowDataBound" AllowPaging="True" PageSize="10"
                    OnPageIndexChanging="gridview_Quote_list_PageIndexChanging" OnRowCommand="gridview_quote_list_RowCommand">
                    <Columns>
                        <asp:TemplateField HeaderText="Quotes">
                            <ItemTemplate>
                                <table border="0" width="100%">
                                    <tr>
                                        <td colspan="3">
                                            <asp:Label runat="server" ID="lbl_title" Text='<%# Eval("title") %>' CssClass="label_title5" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <asp:Label runat="server" ID="lbl_description" Text='<%# Eval("description") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label runat="server" ID="lbl_QuoteBy" Text='<%# Eval("quote_by") %>' CssClass="label_supporter" />
                                        </td>
                                        <td>
                                        </td>
                                        <td align="right">
                                            <asp:ImageButton runat="server" ID="btn_shareOnFacebook" ImageUrl="~/Images/share-facebook.gif"
                                                CommandArgument="<%# Container.DataItemIndex %>" CommandName="post_facebook" />
                                        </td>
                                    </tr>
                               
                                </table>
                                <asp:HiddenField ID="hidden_room_id" runat="server" Value='<%# Bind("quote_id") %>' />
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Width="700px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="view_count" HeaderText="View" Visible="false">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle Width="50px" HorizontalAlign="Center" />
                        </asp:BoundField>
                    </Columns>
                </asp:GridView>
                <uc3:Facebook_Post ID="FBpost" runat="server" Visible="false"/>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="RightSidePanel" runat="Server">
    <uc2:CakeExchangeRate ID="CakeExchangeRate1" runat="server" />
    <hr />
    <uc4:facebookLike ID="facebookLike1" runat="server" />
    <hr />
    <uc1:GoogleAdsence_SlideBar ID="GoogleAdsence_SlideBar1" runat="server" />
</asp:Content>
