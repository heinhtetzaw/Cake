<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CakeExchangeRate.ascx.cs"
    Inherits="Controls_CakeExchangeRate" %>

    <table class="SlideTable" style="height:90px">
        <tr class="Header">
            <td>
                <asp:Label runat="server" ID="Label1" Text="Exchange Rate" Font-Bold="true" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lbl_ExchangeRate" Text="" />
            </td>
        </tr>
        <tr>
            <td class="Title_td" style="text-align:left;font-style:italic">
          
                <asp:Label runat="server" ID="lbl_checkon" Text="" />
            </td>
        </tr>
    </table>

