<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Flat.master" Theme="default"
    AutoEventWireup="true" CodeFile="page_room_listing.aspx.cs" Inherits="Pages_page_room_listing" %>

<%@ Register Src="../Controls/CakeExchangeRate.ascx" TagName="CakeExchangeRate" TagPrefix="uc1" %>
<%@ Register Src="../Controls/PostAndViewCount.ascx" TagName="PostAndViewCount" TagPrefix="uc2" %>
<%@ Register Src="../Controls/facebookLike.ascx" TagName="facebookLike" TagPrefix="uc3" %>
<%@ MasterType VirtualPath="~/MasterPage/Default.master" %>
<%@ Register Src="../Controls/Flat_Room_Detail.ascx" TagName="Flat_Room_Detail" TagPrefix="uc4" %>
<%@ Register Src="../Controls/BookmarkPostsList.ascx" TagName="BookmarkPostsList"
    TagPrefix="uc5" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainPanel" runat="Server">
    <asp:UpdatePanel runat="server" ID="panel_main" >
        <ContentTemplate>
            
            <asp:Panel runat="server" ID="panel_header" Width="100%" CssClass="TitleBox">
                <asp:Label runat="server" ID="lbl_title" Text="Room List for Rental" SkinID="TitleLabel" />
            </asp:Panel>
            <ajaxToolkit:RoundedCornersExtender ID="rce_panel_header" runat="server" TargetControlID="panel_header"
                Corners="Top">
            </ajaxToolkit:RoundedCornersExtender>
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
                <asp:GridView ID="gridview_rooms_list" runat="server" CellPadding="5" Width="100%" 
                    OnRowCommand="gridview_rooms_list_RowCommand" OnRowDataBound="gridview_rooms_list_RowDataBound"
                    AllowPaging="True"  PageSize="25" onpageindexchanging="gridview_rooms_list_PageIndexChanging" 
                    >
                    <Columns>
                        <asp:TemplateField HeaderText="Post Title">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbn_title" runat="server" CommandName="go_detail" CommandArgument='<%# Bind("room_id") %>'
                                    Font-Overline="false" Text='<%# Bind("title") %>' Width="100%" OnClick="lbn_title_Click">
                                    <asp:HiddenField ID="hidden_room_id" runat="server" Value='<%# Bind("room_id") %>' />
                                </asp:LinkButton></ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Width="700px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="view_count" HeaderText="View">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle Width="50px" HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Posted On">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# CommonHelper.GetEasyPostTime((DateTime?)Eval("post_on")) %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Width="180px" />
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
            <uc4:Flat_Room_Detail ID="flat_room_detail" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="RightSidePanel" runat="Server">
    <uc1:CakeExchangeRate ID="CakeExchangeRate1" runat="server" />
    <hr />
    <uc2:PostAndViewCount ID="PostAndViewCount1" runat="server" />
    <hr />
    <uc3:facebookLike ID="facebookLike1" runat="server" />
</asp:Content>
