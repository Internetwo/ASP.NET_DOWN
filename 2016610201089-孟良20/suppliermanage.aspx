<%@ Page Language="C#" MasterPageFile="~/MasterPage_admin.master" AutoEventWireup="true" CodeFile="suppliermanage.aspx.cs" Inherits="suppliermanage" Title="管理供货商" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style5
        {
            height: 60px;
            font-size: xx-large;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="0" cellspacing="0" class="style1">
        <tr>
            <td class="style5">
                管理供货商</td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="Button1" runat="server" Text="按名称查询" onclick="Button1_Click" />
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button2" runat="server" Text="按城市查询" onclick="Button2_Click" />
                <br />
                <br />
                <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                    <asp:View ID="View1" runat="server">
                        供货商名称：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button3" runat="server" Text="查询" onclick="Button3_Click" />
                        &nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button4" runat="server" Text="显示全部" onclick="Button4_Click" />
                    </asp:View>
                    <asp:View ID="View2" runat="server">
                        省份：<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                            DataSourceID="SqlDataSource1" DataTextField="省份名称" DataValueField="省份编号">
                        </asp:DropDownList>
                        &nbsp;&nbsp;&nbsp;
                        城市：<asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" 
                            DataSourceID="SqlDataSource2" DataTextField="城市名称" DataValueField="城市编号">
                        </asp:DropDownList>
                        &nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button5" runat="server" Text="查询" onclick="Button5_Click" />
                        &nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button6" runat="server" Text="显示全部" onclick="Button6_Click" />
                        <br />
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="Data Source=.;Initial Catalog=myshop;Integrated Security=True" 
                    SelectCommand="SELECT * FROM [省份信息表] ORDER BY [省份编号]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="Data Source=.;Initial Catalog=myshop;Integrated Security=True" 
                    SelectCommand="SELECT * FROM [城市信息表] WHERE ([省份编号] = @省份编号) ORDER BY [城市编号]">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="省份编号" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                    </asp:View>
                </asp:MultiView>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" 
                    GridLines="None" AutoGenerateColumns="False" EnableModelValidation="True" 
                    onpageindexchanging="GridView1_PageIndexChanging" AllowPaging="True" 
                    PageSize="5" onrowcommand="GridView1_RowCommand">
                    <RowStyle BackColor="#EFF3FB" />
                    <Columns>
                        <asp:BoundField DataField="供应商名称" HeaderText="供应商名称" />
                        <asp:BoundField DataField="供应商地址" HeaderText="供应商地址" />
                        <asp:BoundField DataField="城市邮编" HeaderText="城市邮编" />
                        <asp:BoundField DataField="供应商电话" HeaderText="供应商电话" />
                        <asp:BoundField DataField="供应商所在城市" HeaderText="供应商所在城市" />
                        <asp:BoundField DataField="供应商所在省份" HeaderText="供应商所在省份" />
                        <asp:TemplateField HeaderText="删除" ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                    CommandName="sc" Text="删除" CommandArgument='<%# bind("供应商编号") %>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:HyperLinkField DataNavigateUrlFields="供应商编号" 
                            DataNavigateUrlFormatString="detailmanage.aspx?id={0}" Text="查看详情" />
                    </Columns>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>

