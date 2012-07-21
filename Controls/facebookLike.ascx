<%@ Control Language="C#" AutoEventWireup="true" CodeFile="facebookLike.ascx.cs" Inherits="Controls_facebookLike" %>
 <table class="SlideTable">
        <tr class="Header">
            <td>
                <asp:Label runat="server" ID="Label1" Text="Shwe 8's Facebook" Font-Bold="true" />
            </td>
        </tr>
        <tr>
            <td>
               <iframe src="//www.facebook.com/plugins/likebox.php?href=https%3A%2F%2Fwww.facebook.com%2FiTunes&amp;width=200&amp;height=258&amp;colorscheme=light&amp;show_faces=true&amp;border_color&amp;stream=false&amp;header=false" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:100%; height:258px;" allowTransparency="true"></iframe>
            </td>
        </tr>
       
    </table>
