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
    OnRowCommand="gridview_rooms_list_RowCommand" 
    OnRowDataBound="gridview_rooms_list_RowDataBound" PageSize="25"
    AllowPaging="True" 
    onpageindexchanging="gridview_rooms_list_PageIndexChanging">
    <Columns>
        <asp:TemplateField HeaderText="Bookmarked Post Title">
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
        <asp:TemplateField HeaderText="Bookmarked On">
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# CommonHelper.GetEasyPostTime((DateTime?)Eval("bookmark_on")) %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle HorizontalAlign="Left" />
            <ItemStyle Width="180px" />
        </asp:TemplateField>
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
<uc1:Flat_Room_Detail ID="flat_room_detail" runat="server" />
