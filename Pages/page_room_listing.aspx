<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Flat.master" Theme="default"
    AutoEventWireup="true" CodeFile="page_room_listing.aspx.cs" Inherits="Pages_page_room_listing" %>

<%@ Register Src="../Controls/CakeExchangeRate.ascx" TagName="CakeExchangeRate" TagPrefix="uc1" %>
<%@ Register Src="../Controls/PostAndViewCount.ascx" TagName="PostAndViewCount" TagPrefix="uc2" %>
<%@ Register Src="../Controls/facebookLike.ascx" TagName="facebookLike" TagPrefix="uc3" %>
<%@ MasterType VirtualPath="~/MasterPage/Default.master" %>
<%@ Register Src="../Controls/Flat_Room_Detail.ascx" TagName="Flat_Room_Detail" TagPrefix="uc4" %>
<%@ Register Src="../Controls/BookmarkPostsList.ascx" TagName="BookmarkPostsList"
    TagPrefix="uc5" %>
<%@ Register Src="../Controls/GoogleAdsence_SlideBar.ascx" TagName="GoogleAdsence_SlideBar"
    TagPrefix="uc6" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainPanel" runat="Server">
    <asp:UpdatePanel runat="server" ID="panel_main">
        <ContentTemplate>
            <asp:Panel runat="server" ID="panel_header" Width="100%" CssClass="TitleBox" Visible="false">
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
                            <asp:Label runat="server" ID="Label1" Text="Welcome: " />
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:DropDownList runat="server" ID="ddl_mrt1" Width="120px" />
                        </td>
                        <td>
                            <asp:RadioButtonList ID="rbtn_welcomeType" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Selected="True" Value="all">All</asp:ListItem>
                                <asp:ListItem Value="m">Male Only</asp:ListItem>
                                <asp:ListItem Value="f">Female only</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td class="Title_td" style="width: 300px; text-align: left">
                            <asp:Button runat="server" ID="btn_search" Text="Search" OnClick="btn_search_Click" />
                            <asp:Label runat="server" ID="lbl_search_duration" Text="Welcome: " />
                        </td>
                    </tr>
                </table>
            </div>
            <div class="WorkingBox">
                <asp:GridView ID="gridview_rooms_list" runat="server" CellPadding="5" Width="100%"
                    OnRowCommand="gridview_rooms_list_RowCommand" OnRowDataBound="gridview_rooms_list_RowDataBound"
                    AllowPaging="True" PageSize="25" OnPageIndexChanging="gridview_rooms_list_PageIndexChanging">
                    <Columns>
                        <asp:TemplateField HeaderText="Room listing for Shwe Rental.">
                            <ItemTemplate>
                                <table border="0">
                                    <tr>
                                        <td class="Title_td" style="max-width: 70px; width: 50px">
                                            <asp:Label runat="server" ID="lbl_room_" Text="Title: " />
                                        </td>
                                        <td colspan="6">
                                            <asp:LinkButton ID="lbn_title" runat="server" CommandName="go_detail" CommandArgument='<%# Bind("room_id") %>'
                                                Text='<%# Bind("title") %>' SkinID="TitleLabel_BLUE" OnClientClick='<%#GenerateNewDetailPageLink((String)Eval("room_id")) %>'
                                                OnClick="lbn_title_Click"> </asp:LinkButton>
                                        </td>
                                        <td class="Title_td" style="width: 50px">
                                            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/stats.png" />
                                            <asp:Label runat="server" ID="lbl_view" Text='<%# Bind("view_count") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="Title_td" style="max-width: 70px; width: 50px">
                                            <asp:Label runat="server" ID="Label4" Text="MRT: " />
                                        </td>
                                        <td style="width: 150px">
                                            <asp:Label runat="server" ID="Label5" Text='<%# Eval("mrt1_name") %>' />
                                        </td>
                                        <td class="Title_td">
                                            <asp:Label runat="server" ID="lbl_room_title" Text="Available on: " />
                                        </td>
                                        <td style="width: 190px">
                                            <asp:Label runat="server" ID="lbl_avaiable_date" Text='<%# CommonHelper.GetStandardDateFormat((DateTime?)Eval("available")) %>' />
                                        </td>
                                        <td class="Title_td" style="width: 50px">
                                            <asp:Label runat="server" ID="Label2" Text="Price: " />
                                        </td>
                                        <td style="width: 50px">
                                            <asp:Label runat="server" ID="Label3" Text='<%# CommonHelper.GetStandardPriceFormat((Int32?)Eval("price")) %>' />
                                        </td>
                                        <td class="Title_td">
                                            <asp:Label runat="server" ID="Label7" Text="Person: " />
                                        </td>
                                        <td style="width: 70px">
                                            <asp:Label ID="Label8" runat="server" Text='<%# Eval("available_count") + " person"%>'></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                    </tr>
                                    <tr>
                                        <td class="Title_td" style="max-width: 70px; width: 50px">
                                            <asp:Label runat="server" ID="lbl_looking" Text="Looking:" />
                                        </td>
                                        <td>
                                            <asp:Label runat="server" ID="Label9" Text='<%# CommonHelper.GetGenderFormart((string)Eval("available_type")) %>' />
                                        </td>
                                        <td class="Title_td">
                                            <asp:Label runat="server" ID="Label6" Text="Post on: " />
                                        </td>
                                        <td>
                                            <asp:Label ID="Label1" runat="server" Text='<%# CommonHelper.GetEasyPostTime((DateTime?)Eval("post_on")) %>'></asp:Label>
                                        </td>
                                        <td class="Title_td">
                                            <asp:Label runat="server" ID="Label10" Text="Contact: " />
                                        </td>
                                        <td>
                                            <asp:Label ID="Label11" runat="server" Text='<%# Eval("contact_no") %>'></asp:Label>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="btn_detail" runat="server" CommandName="go_detail" CommandArgument='<%# Bind("room_id") %>'
                                                Text="View Detail" Width="80px" OnClick="lbn_title_Click" OnClientClick='<%#GenerateNewDetailPageLink((String)Eval("room_id")) %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                </table>
                                <asp:HiddenField ID="hidden_room_id" runat="server" Value='<%# Bind("room_id") %>' />
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
<asp:Content ID="Content1" ContentPlaceHolderID="RightSidePanel" runat="Server">
    <uc1:CakeExchangeRate ID="CakeExchangeRate1" runat="server" />
    <hr />
    <uc6:GoogleAdsence_SlideBar ID="GoogleAdsence_SlideBar1" runat="server" />
    <hr />
    <uc2:PostAndViewCount ID="PostAndViewCount1" runat="server" />
    <hr />
    <uc3:facebookLike ID="facebookLike1" runat="server" />
</asp:Content>
