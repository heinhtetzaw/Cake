<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/RightDock.master" AutoEventWireup="true"
    Theme="default" CodeFile="contactus.aspx.cs" Inherits="Pages_contactus" %>

<%@ Register Src="../Controls/facebookLike.ascx" TagName="facebookLike" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadPanel" runat="Server">

    <table width="1000" style="height: 74px; text-align: left;font-size:13" cellspacing="0" >
        <tr>
            <td>
            <asp:Label runat="server" ID="lablel1" Text="Contact Us" Font-Bold="true" Font-Underline="true" Font-Size="15"/>
            <br />
            <asp:Label runat="server" ID="Label3" Font-Italic="true" Text="Please complete the form below. We'll do everything we can to respond to you as quickly as possible. Our goal is to reply to every email within two business days.<br/> Items marked with an asterisk are required." />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainPanel" runat="Server">
    <table>
        <tr>
            <td>
                <asp:Label runat="server" ID="lbl_name" Text="Your name: "></asp:Label>
            </td>
            <td>
                <asp:TextBox runat="server" ID="tb_name" />
            </td>
        </tr>
          <tr>
            <td>
                <asp:Label runat="server" ID="Label1" Text="Your email: "></asp:Label>
            </td>
            <td>
                <asp:TextBox runat="server" ID="TextBox1" />
            </td>
        </tr>
        </tr>
          <tr valign="top">
            <td>
                <asp:Label runat="server" ID="Label2" Text="Your message: "></asp:Label>
            </td>
            <td>
                <asp:TextBox runat="server" ID="TextBox2" TextMode="MultiLine" Width="550px" Height="300px"/>
            </td>
        </tr>
        </tr>
          <tr valign="top">
            <td>
               
            </td>
            <td>
                <asp:LinkButton runat="server" ID="btn_send" Text="Send"/>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="RightSidePanel" runat="Server">
    <uc1:facebookLike ID="facebookLike1" runat="server" />
    <hr />
</asp:Content>
