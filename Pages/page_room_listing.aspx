<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Default.master" Theme="default"
    AutoEventWireup="true" CodeFile="page_room_listing.aspx.cs" Inherits="Pages_page_room_listing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel runat="server" ID="panel_main">
        <ContentTemplate>
            <div class="HighLightBox">
                <table>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="lbl_search_mrt1" Text="Nearest MRT:" />
                        </td>
                        <td>
                            <asp:Label runat="server" ID="Label1" Text="Looking for:" />
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:DropDownList runat="server" ID="ddl_mrt1" Width="120px" />
                        </td>
                        <td>
                            <asp:DropDownList runat="server" ID="ddl_roomate" Width="120px">
                                <asp:ListItem Selected="True" Value="all">Welcome All</asp:ListItem>
                                <asp:ListItem Value="m">Male only</asp:ListItem>
                                <asp:ListItem Value="f">Female only</asp:ListItem>
                                <asp:ListItem Value="c">Couple</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:Button runat="server" ID="btn_search" Text="Search" OnClick="btn_search_Click" />
                        </td>
                    </tr>
                </table>
            </div>
            <div class="WorkingBox">
            <asp:GridView ID="gridview_rooms_list" runat="server" AutoGenerateColumns="False" Width="100%">
                <Columns>
                    <asp:BoundField DataField="title" HeaderText="Post">
                        <HeaderStyle HorizontalAlign="Left" />
                        <ItemStyle Width="700px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="view_count" HeaderText="View">
                        <HeaderStyle HorizontalAlign="Left" />
                        <ItemStyle Width="50px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="post_on" DataFormatString="{0:dd/MM/yyyy hh:mm:ss tt}"
                        HeaderText="Posted On">
                        <HeaderStyle HorizontalAlign="Left" />
                        <ItemStyle Width="160px" />
                    </asp:BoundField>
                </Columns>
            </asp:GridView></div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
