<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/News/news.master" AutoEventWireup="true"
    CodeFile="type.aspx.cs" Inherits="Pages_News_type" Theme="default" %>

<%@ Register src="../../Controls/facebookLike.ascx" tagname="facebookLike" tagprefix="uc1" %>
<%@ Register src="../Rooms/control/FindRoomAdv.ascx" tagname="FindRoomAdv" tagprefix="uc2" %>
<%@ Register src="control/NewsAdv.ascx" tagname="NewsAdv" tagprefix="uc3" %>
<%@ Register src="../Rooms/control/PostRoomAdv.ascx" tagname="PostRoomAdv" tagprefix="uc4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainPanel" runat="Server">
    <asp:UpdatePanel runat="server" ID="panel_main">
        <ContentTemplate>
            <div class="WorkingBox">
            <asp:HiddenField runat="server" ID="hf_news_type" />
                <asp:GridView ID="gridview_news_list" runat="server" CellPadding="5" Width="100%"
                    OnRowDataBound="gridview_news_list_RowDataBound" AllowPaging="True" AutoGenerateColumns="False"
                    OnPageIndexChanging="gridview_news_list_PageIndexChanging" PageSize="15" OnRowCommand="gridview_news_list_RowCommand">
                    <Columns>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                <asp:Label runat="server" ID="lbl_header" Text='<%#Header %>' />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <table border="0" width="100%">
                                    <tr valign="top">
                                        <td rowspan="2">
                                            <asp:Image runat="server" ID="img_news" ImageUrl="~/Images/daily_news.png" Height="50" />
                                        </td>
                                        <td valign="top" style="width: 100%">
                                            <a href='<%#GenerateNewDetailPageLinkOnly((String)Eval("news_id")) %>' class="label_list_item"
                                                target="_self">
                                                <%# Eval("subject")%></a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label runat="server" ID="lbl_source" Text='<%#String.Format("Source: {0}",(String)Eval("source_name")) %>'
                                                CssClass="label_supporter" />
                                        </td>
                                    </tr>
                                </table>
                                <asp:HiddenField ID="hidden_room_id" runat="server" Value='<%# Bind("news_id") %>' />
                            </ItemTemplate>
                            <FooterTemplate>
                            </FooterTemplate>
                            <HeaderStyle HorizontalAlign="Left" Height="5px" CssClass="MenuBox" />
                            <ItemStyle Width="700px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="view_count" HeaderText="View" Visible="false">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle Width="50px" HorizontalAlign="Center" />
                        </asp:BoundField>
                    </Columns>
                    <PagerSettings LastPageText="" Visible="False" />
                </asp:GridView>
                <table width="100%">
                    <tr>
                        <td>
                            <asp:LinkButton runat="server" ID="lbtn_Previous" Text="Previous" OnCommand="lbtn_Pre_Next_Command"
                                CommandArgument="previous" />
                            <asp:HiddenField runat="server" ID="hf_current_page" Value="0" />
                        </td>
                        <td align="right">
                            <asp:LinkButton runat="server" ID="lbtn_Next" Text="Next" OnCommand="lbtn_Pre_Next_Command"
                                CommandArgument="next" />
                        </td>
                    </tr>
                </table>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RightSidePanel" runat="Server">
    <uc2:FindRoomAdv ID="FindRoomAdv1" runat="server" />
    <hr />
    <uc3:NewsAdv ID="NewsAdv1" runat="server" />
    <hr />
    <uc1:facebookLike ID="facebookLike1" runat="server" />
    <hr />
    <uc4:PostRoomAdv ID="PostRoomAdv1" runat="server" />
</asp:Content>
