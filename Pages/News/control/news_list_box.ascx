<%@ Control Language="C#" AutoEventWireup="true" CodeFile="news_list_box.ascx.cs"
    Inherits="Pages_News_control_news_list_box" %>

            <asp:GridView ID="gridview_news_list" runat="server" CellPadding="5" Width="100%"
                OnRowDataBound="gridview_news_list_RowDataBound" AllowPaging="True" AutoGenerateColumns="False"
                OnPageIndexChanging="gridview_news_list_PageIndexChanging" PageSize="5" OnRowCommand="gridview_news_list_RowCommand"
                ShowFooter="True">
                <Columns>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:LinkButton runat="server" ID="lbtn_more_stories" PostBackUrl='<%#GenerateNewTypeinkOnly() %>'
                                Text='<%#Header %>' SkinID="menu">
                            </asp:LinkButton>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table border="0" width="100%">
                                <tr valign="top">
                                    <td rowspan="2">
                                        <asp:Image runat="server" ID="img_news" ImageUrl="~/Images/daily_news.png" Height="50" />
                                    </td>
                                    <td valign="top" style="width:100%">
                                        <a href='<%#GenerateNewDetailPageLinkOnly((String)Eval("news_id")) %>' class="label_list_item"
                                            target="_self">
                                        <asp:Label runat="server" ID="lbl_subject" Text='<%# Eval("subject")%>' /></a>
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
                            <table width="100%">
                                <tr>
                                    <td align="right">
                                        <asp:LinkButton runat="server" ID="lbtn_more_stories" Text="More Stories" PostBackUrl='<%#GenerateNewTypeinkOnly() %>' />
                                    </td>
                                </tr>
                            </table>
                        </FooterTemplate>
                        <HeaderStyle HorizontalAlign="Left" Height="5px" CssClass="MenuBox" />
                        <ItemStyle Width="700px" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="view_count" HeaderText="View" Visible="false">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle Width="50px" HorizontalAlign="Center" />
                    </asp:BoundField>
                </Columns>
            </asp:GridView>
