<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="detail.aspx.cs" Inherits="detail" Title="无标题页" Debug="true"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style16
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" 
        AutoGenerateColumns="False" PageSize="1" EnableModelValidation="True">
        <Columns>
            <asp:TemplateField HeaderText="商品详情">
                <ItemTemplate>
                    <table align="center" cellpadding="0" cellspacing="0" class="style16">
                        <tr>
                            <td colspan="2" style="text-align: center">
                                <asp:Label ID="Label1" runat="server" 
                                    style="font-size: xx-large; font-weight: 700; " 
                                    Text='<%# bind("产品名称") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td rowspan="2">
                                <asp:Image ID="Image2" runat="server" Height="50%" 
                                    ImageUrl='<%# bind("产品图片") %>' Width="100%" />
                            </td>
                            <td>
                                价格：<asp:Label ID="Label2" runat="server" Text='<%# bind("产品价格") %>'></asp:Label></td>
                        </tr>
                        <tr>
                            <td>
                                库存：<asp:Label ID="Label3" runat="server" Text='<%# bind("产品库存数量") %>'></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align: center">
                                <asp:Button ID="Button2" runat="server" style="text-align: center" Text="购买" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# bind("产品描述") %>' 
                                    TextMode="MultiLine" Width="100%" ReadOnly="True"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:HyperLinkField Text="添加购物车" DataNavigateUrlFields="产品编号" 
                DataNavigateUrlFormatString="box.aspx?sendid={0}" />
        </Columns>
    
    </asp:GridView>
</asp:Content>

