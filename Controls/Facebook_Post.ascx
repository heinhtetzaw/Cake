<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Facebook_Post.ascx.cs"
    Inherits="Controls_Facebook_Post" %>
<asp:LinkButton ID="btnShare" runat="server" OnClick="btnShare_Click">
    <asp:Image runat="server" ID="img_fb" ImageUrl="~/Images/share-facebook.gif" />
</asp:LinkButton><br />
<asp:Label runat="server" ID="lbl_status" Text="" />
<asp:HiddenField runat="server" ID="hfPostLink" />
<asp:HiddenField runat="server" ID="hfCaption" />
<asp:HiddenField runat="server" ID="hfDescription" />
<asp:HiddenField runat="server" ID="hfMessage" />
<asp:HiddenField runat="server" ID="hfName" />
<asp:HiddenField runat="server" ID="hfURL" />
<asp:HiddenField runat="server" ID="hfImageURL" />
<asp:HiddenField runat="server" ID="hfLink" />
