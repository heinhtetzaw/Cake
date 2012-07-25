<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Flat_Room_Detail.ascx.cs"
    Inherits="Controls_Flat_Room_Detail" %>
<%@ Register Src="BookmarkPostControl.ascx" TagName="BookmarkPostControl" TagPrefix="uc5" %>
<asp:Panel runat="server" ID="panel_record" CssClass="panel_progress_overlay">
    <asp:Panel runat="server" ID="panel_record_inner" CssClass="panel_room_detail">
        <table width="975px" border="0px" style="height: 100%">
            <tr>
                <td style="width: 100px">
                    <asp:Image ID="img_logo" ImageUrl="~/Images/Logo.png" runat="server" Height="25px" />
                </td>
                <td align="center">
                    <asp:Label runat="server" ID="lbl_page_title" Text="Available 2 male room-mate(s) @ Toa Payoh, S$ 330"
                        Font-Bold="true"></asp:Label>
                </td>
                <td style="width: 100px" align="right">
                    <asp:LinkButton runat="server" ID="btn_close" Text="[X] Close" OnClientClick="javaScript:window.close(); return false;" />
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <%--Google Map--%>
                    <asp:Panel runat="server" ID="panel_map"  >
                        <iframe runat="server" id="google_map_iframe" width="100%" height="250px" style="border: 1px;
                            padding: 0px" src="~/Pages/page_google_map.aspx"></iframe>
                    </asp:Panel>
                   
                    <ajaxToolkit:DropShadowExtender ID="DropShadowExtender1"  runat="server" 
                        TargetControlID="panel_map" Opacity="0.5" Radius="3" Rounded="True">
                    </ajaxToolkit:DropShadowExtender>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <table width="100%">
                        <tr valign="top">
                            <td>
                                <%--Post Info--%>
                                <table>
                                    <tr>
                                        <td class="Title_td">
                                            <asp:Label ID="Label2" runat="server" Text="Title:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label runat="server" ID="lbl_title" Text="Available 2 male room-mate(s) @ Toa Payoh, S$ 330"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="Title_td">
                                            <asp:Label ID="Label3" runat="server" Text="Available on:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label runat="server" ID="lbl_available_on" Text="01/09/2012"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="Title_td">
                                            <asp:Label ID="Label4" runat="server" Text="Welcome to:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label runat="server" ID="lbl_available_for" Text="Male only, 2 persons"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="Title_td">
                                            <asp:Label ID="Label5" runat="server" Text="Price:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label runat="server" ID="lbl_price" Text="330 S$"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="Title_td">
                                            <asp:Label ID="Label7" runat="server" Text="Nearest MRT(s):"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label runat="server" ID="lbl_nearest_mrt" Text="Braddell, Toa Payoh"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="Title_td">
                                            <asp:Label ID="Label9" runat="server" Text="Postal Code:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label runat="server" ID="lbl_postal_code" Text="310205"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="Title_td">
                                            <asp:Label ID="Label11" runat="server" Text="Contact No:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label runat="server" ID="lbl_contact_no" Text="98254965"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="Title_td">
                                            <asp:Label ID="Label6" runat="server" Text="Post on:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label runat="server" ID="lbl_post_on" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td>
                                            <uc5:BookmarkPostControl ID="bookmark_object" runat="server" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <%--Post Description--%>
                                <table>
                                    <tr>
                                        <td class="Title_td" style="text-align: left">
                                            <asp:Label ID="Label13" runat="server" Text="Description:"></asp:Label>
                                          
                                        </td>
                                        <td class="Title_td">
                                            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/stats.png" />
                                            <asp:Label runat="server" ID="lbl_view" Text="" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:TextBox runat="server" ID="lbl_description" ReadOnly="true" TextMode="MultiLine"
                                                Text="" Width="490px" Height="250px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                    <td colspan="2">  <asp:Label runat="server" ID="lbl_loading_time" Text="" class="Title_td" Style="width: 80px" /></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="3" align="right">
                    <hr />
                </td>
            </tr>
        </table>
    </asp:Panel>
    <ajaxToolkit:RoundedCornersExtender ID="RoundedCornersExtender_Record_panel" TargetControlID="panel_record_inner"
        runat="server">
    </ajaxToolkit:RoundedCornersExtender>
</asp:Panel>
