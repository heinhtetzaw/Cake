<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/News/news.master" AutoEventWireup="true" Theme="default"
    CodeFile="list.aspx.cs" Inherits="Pages_News_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainPanel" runat="Server">
    <asp:UpdatePanel runat="server" ID="panel_main">
        <ContentTemplate>
            <div class="WorkingBox">
                <asp:GridView ID="gridview_news_list" runat="server" CellPadding="5" Width="100%"
                    OnRowDataBound="gridview_news_list_RowDataBound" AllowPaging="True" PageSize="10"
                    AutoGenerateColumns="false" OnPageIndexChanging="gridview_news_list_PageIndexChanging"
                    OnRowCommand="gridview_news_list_RowCommand">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <table border="0" width="100%">
                                    <tr>
                                        <td valign="top" style="width: 100%">
                                            <a href='<%#GenerateNewDetailPageLinkOnly((String)Eval("news_id")) %>' target="_blank">
                                                <%# Eval("subject")%></a>
                                        </td>
                                      
                                    </tr>
                                </table>
                                <asp:HiddenField ID="hidden_room_id" runat="server" Value='<%# Bind("news_id") %>' />
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
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RightSidePanel" runat="Server">
</asp:Content>
