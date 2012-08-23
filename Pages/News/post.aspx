<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/News/news.master" AutoEventWireup="true"
    Theme="default" CodeFile="post.aspx.cs" Inherits="Pages_News_post" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainPanel" runat="Server">
    <table width="100%">
        <tr>
            <td colspan="2">
                <asp:Label ID="Label1" runat="server" Text="Title"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:TextBox runat="server" ID="tb_title" Width="100%" MaxLength="200"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="Label2" runat="server" Text="Post"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:TextBox runat="server" ID="tb_post" Width="100%" TextMode="MultiLine" Height="320px" MaxLength="4000"    onkeyDown="return checkTextAreaMaxLength(this,event,'4000');"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="Label5" runat="server" Text="Image URL"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:TextBox runat="server" ID="tb_image_url" Width="100%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Type"></asp:Label>
            </td>
            <td>
                <asp:DropDownList runat="server" ID="ddl_news_type" Width="300px" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="Source"></asp:Label>
            </td>
            <td>
                <asp:DropDownList runat="server" ID="ddl_source" Width="300px" />
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
            <asp:LinkButton runat="server" ID="lbtn_post" Text="Post News" 
                    onclick="lbtn_post_Click"/>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RightSidePanel" runat="Server">
</asp:Content>
