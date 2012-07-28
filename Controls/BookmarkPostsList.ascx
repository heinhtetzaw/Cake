<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BookmarkPostsList.ascx.cs"
    Inherits="Controls_BookmarkPostsList" %>
<%@ Register Src="Flat_Room_Detail.ascx" TagName="Flat_Room_Detail" TagPrefix="uc1" %>
<asp:Panel runat="server" ID="panel_header" Width="100%" CssClass="TitleBox">
    <asp:Label runat="server" ID="lbl_title" Text="Your bookmarked list" SkinID="TitleLabel" />
</asp:Panel>
<ajaxToolkit:RoundedCornersExtender ID="rce_panel_header" runat="server" TargetControlID="panel_header"
    Corners="Top">
</ajaxToolkit:RoundedCornersExtender>
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

<asp:Label runat="server" ID="lbl_bookmark_notice" Text="Bookmark with this email account: ">
</asp:Label> <asp:TextBox runat="server" ID="tb_useremail" Text="" Width="150px"></asp:TextBox><ajaxToolkit:TextBoxWatermarkExtender
    ID="watermarked_box" runat="server" WatermarkText="Please enter your email" TargetControlID="tb_useremail">
</ajaxToolkit:TextBoxWatermarkExtender>
<asp:LinkButton runat="server" ID="btnRefresh" onclick="btnRefresh_Click" >
<asp:Image runat="server" ID="imgRefresh"  ImageUrl="~/Images/refresh.png" Height="16"/>
</asp:LinkButton>
<br />
<asp:Label runat="server" ID="lbl_error" Text="" SkinID="Error"/>
<hr />
