<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Default.master" AutoEventWireup="true"
    CodeFile="page_room_post.aspx.cs" Inherits="Pages_page_room_post" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel runat="server" ID="update_panel_main">
        <ContentTemplate>
            <table>
                <tr>
                    <td>
                        <asp:Label runat="server" ID="lbl_lookingfor" Text="Looking for:"></asp:Label>
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label runat="server" ID="lbl_available" Text="Available: "></asp:Label>
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label runat="server" ID="lbl_price" Text="Price: "></asp:Label>
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label runat="server" ID="Label3" Text="Looking for:"></asp:Label>
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label runat="server" ID="Label4" Text="Looking for:"></asp:Label>
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
