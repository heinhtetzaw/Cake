<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/RightDock.master" Theme="default"
    AutoEventWireup="true" CodeFile="page_room_listing.aspx.cs" Inherits="Pages_page_room_listing" %>

<%@ Register Assembly="Artem.Google" Namespace="Artem.Google.UI" TagPrefix="artem" %>
<%@ Register Src="../Controls/CakeExchangeRate.ascx" TagName="CakeExchangeRate" TagPrefix="uc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainPanel" runat="Server">
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
                <asp:GridView ID="gridview_rooms_list" runat="server" AutoGenerateColumns="False"
                    CellPadding="5" Width="100%" OnRowCommand="gridview_rooms_list_RowCommand" OnRowDataBound="gridview_rooms_list_RowDataBound"
                    AllowPaging="True">
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
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("post_on") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# CommonHelper.GetEasyPostTime((DateTime)Eval("post_on")) %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Width="180px" />
                        </asp:TemplateField>
                    </Columns>
                    <RowStyle Font-Size="9" Font-Names="Tahoma" CssClass="GridRow" />
                    <AlternatingRowStyle CssClass="GridAlterRow" Font-Size="9" Font-Names="Tahoma" />
                    <SelectedRowStyle CssClass="GridSelectedRow" />
                </asp:GridView>
            </div>
            <asp:Panel runat="server" ID="panel_record" CssClass="panel_progress_overlay" Visible="true">
                <asp:Panel runat="server" ID="panel_record_inner" CssClass="panel_room_detail">
                    <table width="975px" border="0px" style="height: 100%">
                        <tr>
                            <td style="width: 100px">
                                <asp:Image ID="img_logo" ImageUrl="~/Images/Logo.png" runat="server" Height="25px" />
                            </td>
                            <td align="center">
                                <asp:Label runat="server" ID="Label8" Text="Available 2 male room-mate(s) @ Toa Payoh, S$ 330"></asp:Label>
                            </td>
                            <td style="width: 100px" align="right">
                            <asp:LinkButton runat="server" ID="btn_close" Text="[X] Close" OnClick="btn_close_Click" />
                            </td>
                        </tr>
                        <tr style="height: 300">
                            <td colspan="3">
                                <%--Google Map--%>
                                <artem:GoogleMap ID="googlemap" runat="server" MapType="Roadmap" Zoom="18" Height="300px"
                                    Width="100%">
                                </artem:GoogleMap>
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
                                                    <td colspan="2">
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
                                                
                                            </table>
                                        </td>
                                        <td>
                                            <%--Post Description--%>
                                            <table>
                                                <tr>
                                                    <td class="Title_td" style="text-align: left">
                                                        <asp:Label ID="Label13" runat="server" Text="Description:"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:TextBox runat="server" ID="lbl_description" ReadOnly="true" TextMode="MultiLine"
                                                            Text="" Width="490px" Height="250px"></asp:TextBox>
                                                    </td>
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
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="RightSidePanel" runat="Server">
    <uc1:CakeExchangeRate ID="CakeExchangeRate1" runat="server" />
</asp:Content>
