<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Default.master" AutoEventWireup="true"
    CodeFile="page_room_detail.aspx.cs" Inherits="Pages_page_room_detail" Theme="default" %>

<%@ Register Src="../../Controls/Flat_Room_Detail.ascx" TagName="Flat_Room_Detail" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <uc1:Flat_Room_Detail ID="flat_room_detail" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
