<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PostRoomAdv.ascx.cs" Inherits="Pages_Rooms_control_PostRoomAdv" %>
 <table  class="SlideTable" style="min-height:64" cellspacing="0">
        <tr valign="middle" style="height:70px">
            <td onmouseover="this.className='MenuButtonBoxMouseOver';" onmouseout="this.className='MenuButtonBoxMouseUp';" class="MenuButtonBoxMouseOver">
                <asp:LinkButton ID="LinkButton2" runat="server" Text="" SkinID="menu" PostBackUrl="~/post">
                    <table class="MenuButtonBox">
                        <tr>
                            <td>
                                <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/post_adv.png" />
                                <asp:Label runat="server" ID="Label1" Text="<%$ Resources:Resource,post_room_adv %>"  />
                            </td>
                        </tr>
                    </table>
                </asp:LinkButton>
            </td>
        </tr>
    </table>