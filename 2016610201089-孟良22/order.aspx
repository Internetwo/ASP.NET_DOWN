<%@ Page Language="C#" MasterPageFile="~/MasterPage_admin.master" AutoEventWireup="true" CodeFile="order.aspx.cs" Inherits="order" Title="订单管理" Debug="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style5
        {
            width: 900px;
        }
        .style6
        {
            font-size: xx-large;
            font-weight: bold;
            height: 50px;
        }
        .style7
        {
            height: 30px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<center>
    <table cellpadding="0" cellspacing="0" class="style5">
        <tr>
            <td class="style6" align="center">
                订单信息汇总</td>
        </tr>
        <tr>
            <td  align="center">
                请选择查询字段：<asp:DropDownList ID="DropDownList1" runat="server" 
                    AutoPostBack="True">
                    <asp:ListItem>用户名</asp:ListItem>
                    <asp:ListItem>收件人姓名</asp:ListItem>
                    <asp:ListItem>用户电话</asp:ListItem>
                </asp:DropDownList>
&nbsp;&nbsp;&nbsp; 请输入查询内容：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button1" runat="server" Text="查询" onclick="Button1_Click" />
&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button2" runat="server" Text="显示全部" onclick="Button2_Click" />
                                        </td>
        </tr>
        <tr>
            <td align="center">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" 
                    onrowediting="GridView1_RowEditing" onrowcancelingedit="GridView1_RowCancelingEdit" 
                    onrowupdating="GridView1_RowUpdating" onrowcommand="GridView1_RowCommand"
                    onpageindexchanging="GridView1_PageIndexChanging" PageSize="5" 
                    DataKeyNames="订单编号,用户名,收件人姓名,订单日期,用户地址,邮编,用户电话,订单状态">
                    <RowStyle BackColor="#E3EAEB" />
                    <Columns>
                        <asp:BoundField DataField="订单编号" HeaderText="订单编号" ReadOnly="True" />
                        <asp:BoundField DataField="用户名" HeaderText="用户名" ReadOnly="True" />
                        <asp:BoundField DataField="收件人姓名" HeaderText="收件人姓名" />
                        <asp:BoundField DataField="订单日期" HeaderText="订单日期" ReadOnly="True" />
                        <asp:BoundField DataField="用户地址" HeaderText="用户地址" />
                        <asp:BoundField DataField="邮编" HeaderText="邮编" />
                        <asp:BoundField DataField="用户电话" HeaderText="用户电话" />
                        <asp:TemplateField HeaderText="订单状态">
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownList2" runat="server" Enabled="False" 
                                    SelectedValue='<%# bind("订单状态") %>'>
                                    <asp:ListItem>未审核</asp:ListItem>
                                    <asp:ListItem>已审核</asp:ListItem>
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="True" />
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                    CommandArgument='<%# bind("订单编号") %>' CommandName="sc" 
                                    onclientclick="return confirm(&quot;确定要删除吗？&quot;)" Text="删除"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:HyperLinkField DataNavigateUrlFields="订单编号" 
                            DataNavigateUrlFormatString="order.aspx?ddbh={0}" Text="查看详情" />
                    </Columns>
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#7C6F57" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td class="style7" align="center">
                当前订单详细信息</td>
        </tr>
        <tr>
            <td align="center">
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" ForeColor="#333333" GridLines="None" >
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="订单编号" HeaderText="订单编号" />
                        <asp:BoundField DataField="产品编号" HeaderText="产品编号" />
                        <asp:BoundField DataField="产品名称" HeaderText="产品名称" />
                        <asp:BoundField DataField="产品单价" HeaderText="产品单价" />
                        <asp:BoundField DataField="购买数量" HeaderText="购买数量" />
                        <asp:BoundField DataField="总价" HeaderText="总价" />
                    </Columns>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
            </td>
        </tr>
    </table>
</center>
</asp:Content>

