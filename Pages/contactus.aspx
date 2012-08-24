<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/RightDock.master" AutoEventWireup="true"
    Theme="default" CodeFile="contactus.aspx.cs" Inherits="Pages_contactus" %>

<%@ Register Src="../Controls/facebookLike.ascx" TagName="facebookLike" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadPanel" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainPanel" runat="Server">
    <asp:UpdatePanel runat="server" ID="update_panel_main">
        <ContentTemplate>
            <table width="100%" style="height: 74px; text-align: left; font-size: 13" cellspacing="0">
                <tr>
                    <td>
                        <asp:Label runat="server" ID="lablel1" Text="Contact Us" Font-Bold="true" Font-Underline="true"
                            Font-Size="15" />
                        <br />
                        <asp:Label runat="server" ID="Label3" Font-Italic="true" Text="Please complete the form below. We'll do everything we can to respond to you as quickly as possible. Our goal is to reply to every email within two business days." />
                    </td>
                </tr>
            </table>
            <asp:Panel runat="server" ID="panel_form" Visible="true">
               
                <hr /> <asp:Label runat="server" ID="Label4" Text="Enquiry Form " Font-Bold="true" Font-Size="15"></asp:Label>
                <table>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="lbl_name" Text="Your name: "></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="tb_name" Text="" />
                            <asp:Label runat="server" ID="lbl_name_error" Text="" SkinID="Error" /><ajaxToolkit:TextBoxWatermarkExtender
                                ID="TextBoxWatermarkExtender1" runat="server" TargetControlID="tb_name" WatermarkText="Your name, Please"
                                WatermarkCssClass="watermarked">
                            </ajaxToolkit:TextBoxWatermarkExtender>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="Label1" Text="Your email: "></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="tb_email" Text="" Width="200px" />
                            <asp:Label runat="server" ID="lbl_email_error" Text="" SkinID="Error" />
                            <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender2" runat="server"
                                TargetControlID="tb_email" WatermarkText="Your email, Please" WatermarkCssClass="watermarked">
                            </ajaxToolkit:TextBoxWatermarkExtender>
                        </td>
                    </tr>
                    <tr valign="top">
                        <td>
                            <asp:Label runat="server" ID="Label2" Text="Your message: "></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="tb_meassage" TextMode="MultiLine" Width="550px" Height="300px"
                                Text="" /><br />
                            <asp:Label runat="server" ID="lbl_meassage_error" Text="" SkinID="Error" />
                            <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender3" runat="server"
                                TargetControlID="tb_meassage" WatermarkText="You can file your enquiry here."
                                WatermarkCssClass="watermarked">
                            </ajaxToolkit:TextBoxWatermarkExtender>
                        </td>
                    </tr>
                    <tr valign="top">
                        <td>
                        </td>
                        <td>
                            <asp:LinkButton runat="server" ID="btn_send" Text="Send" OnClick="btn_send_Click" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:Panel runat="server" ID="panel_message" Visible="false">
                <br />
                <asp:Label runat="server" ID="lbl_message" Text="Dear <b>Sir/Mamdm</b>,<br/><br/>Your message has been sent to our team. <br/>We will contact back it to you very shortly. <br/><br/>Best Regards,<br/><b>Shwe 8 Team</b><hr/>"></asp:Label>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="RightSidePanel" runat="Server">
    <uc1:facebookLike ID="facebookLike1" runat="server" />
    <hr />
</asp:Content>
