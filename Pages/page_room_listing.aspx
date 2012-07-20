﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Default.master" Theme="default"
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


                <asp:GridView ID="gridview_rooms_list" runat="server" AutoGenerateColumns="False"
                    Width="100%" OnRowCommand="gridview_rooms_list_RowCommand">
                    <Columns>
                        <asp:TemplateField HeaderText="Post">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbn_title" runat="server" Text='<%# Bind("title") %>' CommandName="go_detail"
                                    CommandArgument='<%# Bind("room_id") %>'></asp:LinkButton>
                                <asp:HiddenField ID="hidden_room_id" runat="server" Value='<%# Bind("room_id") %>' />
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Width="700px" />
                        </asp:TemplateField>
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
                </asp:GridView>
            </div>
            <asp:Panel runat="server" ID="panel_record" CssClass="panel_progress_overlay" Visible="false">
                <asp:Panel runat="server" ID="panel_record_inner" CssClass="panel_room_detail">
                    <table width="695px" border="0px" style="height: 100%">
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
                            <td rowspan="4">
                                <asp:Image ID="img_record" ImageUrl="~/Images/find_rooms.png" runat="server" />
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
                            <td colspan="2">
                                <asp:Label runat="server" ID="lbl_postal_code" Text="310205"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="Title_td">
                                <asp:Label ID="Label11" runat="server" Text="Contact No:"></asp:Label>
                            </td>
                            <td colspan="2">
                                <asp:Label runat="server" ID="lbl_contact_no" Text="98254965"></asp:Label>
                            </td>
                        </tr>
                        <tr valign="top">
                            <td class="Title_td">
                                <asp:Label ID="Label13" runat="server" Text="Description:"></asp:Label>
                            </td>
                            <td colspan="2">
                                <asp:TextBox runat="server" ID="lbl_description" ReadOnly="true" TextMode="MultiLine"
                                    Text="" Width="550px" Height="265px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" align="right">
                                <hr />
                                <asp:Button runat="server" Width="80px" ID="btn_close" Text="Close" OnClick="btn_close_Click" />
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
