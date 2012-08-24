<%@ Control Language="C#" AutoEventWireup="true" CodeFile="news_list_box.ascx.cs"
    Inherits="Pages_News_control_news_list_box" %>
<asp:UpdatePanel runat="server" ID="panel_main">
    <ContentTemplate>
        <div class="WorkingBox">
            <asp:GridView ID="gridview_news_list" runat="server" CellPadding="5" Width="100%"
                OnRowDataBound="gridview_news_list_RowDataBound" AllowPaging="True" AutoGenerateColumns="False"
                OnPageIndexChanging="gridview_news_list_PageIndexChanging" PageSize="5" OnRowCommand="gridview_news_list_RowCommand">
                <Columns>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label runat="server" ID="lbl_header" Text='<%#Header %>' />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table border="0" width="100%">
                                <tr valign="middle">
                                    <td>
                                        <asp:Image runat="server" ID="img_news" ImageUrl="~/Images/daily_news.png" Height="50" />
                                    </td>
                                    <td valign="top" style="width: 100%">
                                        <a href='<%#GenerateNewDetailPageLinkOnly((String)Eval("news_id")) %>' target="_blank"
                                            class="label_list_item">
                                            <%# Eval("subject")%></a>
                                    </td>
                                </tr>
                            </table>
                            <asp:HiddenField ID="hidden_room_id" runat="server" Value='<%# Bind("news_id") %>' />
                        </ItemTemplate>
                        <FooterTemplate>
                        <hr />
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
         
        </div>
    </ContentTemplate>
</asp:UpdatePanel>
