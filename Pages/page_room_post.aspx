<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Flat.master" AutoEventWireup="true"
    CodeFile="page_room_post.aspx.cs" Inherits="Pages_page_room_post" Theme="Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainPanel" runat="Server">
    <script language="javascript" type="text/jscript">
        function PopulateTitle() {
            //var _price = ",S$ " + document.getElementById('<%=this.tb_price.ClientID%>').value;


            var _ddl_available_count = document.getElementById('<%=this.ddl_available_person.ClientID%>');
            var _count = _ddl_available_count.options[_ddl_available_count.selectedIndex].value + " ";

            var _ddl_mrt = document.getElementById('<%=this.ddl_mrt1.ClientID%>');
            var _mrt_name = "@" + _ddl_mrt.options[_ddl_mrt.selectedIndex].text + " ";

            document.getElementById('<%=this.tb_title.ClientID%>').value = "Available for " + _count + "room-mate(s) " + _mrt_name ;
        }
    </script>
    <asp:UpdatePanel runat="server" ID="update_panel_main">
        <ContentTemplate>
            <table>
                <tr>
                    <td style="width: 120px">
                        <asp:Label runat="server" ID="lbl_lookingfor" Text="Email: "></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="tb_email" Width="170px"></asp:TextBox>
                        <asp:Label runat="server" ID="lbl_email_error" Text="" SkinID="Error"></asp:Label>
                    </td>
                    <td>
                        <ajaxToolkit:TextBoxWatermarkExtender ID="watermark_email" runat="server" TargetControlID="tb_email"
                            WatermarkText="Please enter" WatermarkCssClass="watermarked">
                        </ajaxToolkit:TextBoxWatermarkExtender>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label runat="server" ID="lbl_mobile" Text="Mobile:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="tb_mobile" MaxLength="8" Width="70px"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server"
                            FilterType="Numbers" TargetControlID="tb_mobile" ValidChars="Numbers">
                        </ajaxToolkit:FilteredTextBoxExtender>
                        <ajaxToolkit:TextBoxWatermarkExtender ID="watermark_mobile" runat="server" TargetControlID="tb_mobile"
                            WatermarkText="8 digits" WatermarkCssClass="watermarked">
                        </ajaxToolkit:TextBoxWatermarkExtender>
                        <asp:Label runat="server" ID="lbl_mobile_error" Text="" SkinID="Error"></asp:Label>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td colspan="2">
                        <asp:LinkButton runat="server" ID="lbtn_get_info" Text="Lazy to retype? Get your last post here."
                            OnClick="lbtn_get_info_Click" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label runat="server" ID="lbl_price" Text="Price: "></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="tb_price" Width="60px" onkeyup="javascript:PopulateTitle()"
                            MaxLength="5" />
                        <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender3" runat="server"
                            TargetControlID="tb_price" WatermarkText="350" WatermarkCssClass="watermarked">
                        </ajaxToolkit:TextBoxWatermarkExtender>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server"
                            FilterType="Numbers" TargetControlID="tb_price" ValidChars="Numbers">
                        </ajaxToolkit:FilteredTextBoxExtender>
                        <asp:Label runat="server" ID="Label1" Text="S$"></asp:Label>
                        <asp:Label runat="server" ID="lbl_price_error" Text="" SkinID="Error"></asp:Label>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label runat="server" ID="Label3" Text="Looking for:"></asp:Label>
                    </td>
                    <td>
                        <asp:RadioButtonList ID="rbtn_looking_type" runat="server" RepeatDirection="Horizontal"
                            onchange="javascript:PopulateTitle()">
                            <asp:ListItem Value="b" Selected="True">All</asp:ListItem>
                            <asp:ListItem Value="m">Male only</asp:ListItem>
                            <asp:ListItem Value="f">Female only</asp:ListItem>
                            <asp:ListItem Value="c">Couple</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label runat="server" ID="Label4" Text="Available Date:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="tb_available" Width="80px" /><ajaxToolkit:CalendarExtender
                            ID="calendar_ex" runat="server" TargetControlID="tb_available" Format="dd/MM/yyyy">
                        </ajaxToolkit:CalendarExtender>
                        <ajaxToolkit:TextBoxWatermarkExtender ID="watermark_available" runat="server" TargetControlID="tb_available"
                            WatermarkText="dd/MM/yyyy" WatermarkCssClass="watermarked">
                        </ajaxToolkit:TextBoxWatermarkExtender>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label runat="server" ID="lbl_available_person" Text="Available Person(s):"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList runat="server" ID="ddl_available_person" onchange="javascript:PopulateTitle()">
                            <asp:ListItem Selected="True" Value="1">1 person</asp:ListItem>
                            <asp:ListItem Value="2">2 persons</asp:ListItem>
                            <asp:ListItem Value="3">3 persons</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label runat="server" ID="lbl_postal_code" Text="Postal Code:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="tb_postal_code" Width="80px" MaxLength="6"></asp:TextBox>
                        <asp:Label runat="server" ID="lbl_postal_code_error" Text="" SkinID="Error" /><ajaxToolkit:TextBoxWatermarkExtender
                            ID="watermark_postal_code" runat="server" TargetControlID="tb_postal_code" WatermarkText="6 digits"
                            WatermarkCssClass="watermarked">
                        </ajaxToolkit:TextBoxWatermarkExtender>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server"
                            FilterType="Numbers" TargetControlID="tb_postal_code" ValidChars="Numbers">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label runat="server" ID="lbl_nearest_mrt" Text="Nearest MRT:"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddl_mrt1" runat="server" Width="120" onchange="javascript:PopulateTitle()">
                        </asp:DropDownList>
                        <asp:DropDownList ID="ddl_mrt2" runat="server" Width="120">
                        </asp:DropDownList>
                        <asp:DropDownList ID="ddl_mrt3" runat="server" Width="120">
                        </asp:DropDownList>
                        <asp:Label runat="server" ID="lbl_mrt_error" Text="" SkinID="Error"></asp:Label>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td style="vertical-align: top">
                        <asp:Label runat="server" ID="lbl_description" Text="Description:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="tb_description" Height="215px" Width="550px" TextMode="MultiLine"></asp:TextBox>
                        <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server"
                            TargetControlID="tb_description" WatermarkText="Please tell more about your adv."
                            WatermarkCssClass="watermarked">
                        </ajaxToolkit:TextBoxWatermarkExtender>
                        <asp:Label runat="server" ID="lbl_description_error" Text="" SkinID="Error" />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label runat="server" ID="lbl_title" Text="Post Title:" />
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="tb_title" Width="400px" />
                        <asp:Label runat="server" ID="lbl_title_error" Text="" SkinID="Error" />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td>
                        <asp:LinkButton runat="server" ID="btn_post" Text="Post" OnClick="btn_post_Click" />
                    </td>
                    <td>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="RightSidePanel" runat="Server">
</asp:Content>
