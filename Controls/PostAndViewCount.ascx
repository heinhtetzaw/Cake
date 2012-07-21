<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PostAndViewCount.ascx.cs" Inherits="Controls_PostAndViewCount" %>
    <table class="SlideTable">
        <tr class="Header">
            <td>
                <asp:Label runat="server" ID="Label1" Text="Site Status" Font-Bold="true" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lbl_post" Text="" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lbl_view" Text="" />
            </td>
        </tr>
    </table>