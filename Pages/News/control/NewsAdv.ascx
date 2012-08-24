<%@ Control Language="C#" AutoEventWireup="true" CodeFile="NewsAdv.ascx.cs" Inherits="Pages_News_control_NewsAdv" %>
 <table  class="SlideTable" style="min-height:64" cellspacing="0">
        <tr valign="middle" style="height:70px">
            <td onmouseover="this.className='MenuButtonBoxMouseOver';" onmouseout="this.className='MenuButtonBoxMouseUp';" class="MenuButtonBoxMouseOver">
                <asp:LinkButton ID="LinkButton2" runat="server" Text="" SkinID="menu" PostBackUrl="~/news/list/all">
                    <table class="MenuButtonBox">
                        <tr>
                            <td>
                                <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/daily_news.png" Height="48" />
                                <asp:Label runat="server" ID="Label1" Text="<%$ Resources:Resource,news_menu %>"  />
                            </td>
                        </tr>
                    </table>
                </asp:LinkButton>
            </td>
        </tr>
    </table>