<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BookmarkPostControl.ascx.cs" Inherits="Controls_BookmarkPostControl" %>

<asp:UpdatePanel runat="server" ID="control_update_panel">
    <ContentTemplate>
        <table>
            <tr>
                <td>
                    <asp:Image runat="server" ID="img_bookmark" ImageUrl="~/Images/bookmark.png" />
                </td>
                <td>
                 <asp:Label runat="server" ID="lbl_bookmarked" Text="Bookmarked" SkinID="Highlighted" Visible="false"/>
                    <asp:TextBox runat="server" ID="tb_email" Width="80px" Text="" Visible="false">
                    </asp:TextBox>
                    <asp:HiddenField runat="server" ID="HFPostID" />
                    
                </td>
                <td>
                    <asp:LinkButton runat="server" ID="lbtn_bookmark" Text="Bookmark this post" OnClick="lbtnGO_Click"></asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:Label runat="server" ID="lbl_error" Text="" SkinID="Error" />
                </td>
            </tr>
        </table>
    </ContentTemplate>
</asp:UpdatePanel>

