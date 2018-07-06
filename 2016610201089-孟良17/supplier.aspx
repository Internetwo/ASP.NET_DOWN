<%@ Page Language="C#" MasterPageFile="~/MasterPage_admin.master" AutoEventWireup="true" CodeFile="supplier.aspx.cs" Inherits="supplier" Title="无标题页" Debug="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style5
        {
            width: 640px;
        }
        .style6
        {
            font-size: xx-large;
            height: 60px;
            font-weight: bold;
        }
        .style7
        {
            height: 36px;
        }
        .style8
        {
            height: 40px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="0" cellspacing="0" class="style5" align="center">
        <tr>
            <td class="style6" colspan="2">
                添加供货商</td>
        </tr>
        <tr>
            <td class="style7" style="text-align: right">
                供货商名称：</td>
            <td class="style7" style="text-align: left">
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style7" style="text-align: right">
                所在城市：</td>
            <td class="style7" style="text-align: left">
                <asp:DropDownList ID="DropDownList1" runat="server" style="text-align: left" 
                    DataSourceID="SqlDataSource1" DataTextField="省份名称" DataValueField="省份编号" 
                    AutoPostBack="True">
                </asp:DropDownList>
            &nbsp;&nbsp;&nbsp;
                <asp:DropDownList ID="DropDownList2" runat="server" 
                    DataSourceID="SqlDataSource2" DataTextField="城市名称" DataValueField="城市编号" 
                    AutoPostBack="True">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style7" style="text-align: right">
                地址：</td>
            <td class="style7" style="text-align: left">
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style7" style="text-align: right">
                邮编：</td>
            <td class="style7" style="text-align: left">
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                    ControlToValidate="TextBox3" ErrorMessage="请输入正确的邮编格式！" 
                    ValidationExpression="\d{6}"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style7" style="text-align: right">
                电话：</td>
            <td class="style7" style="text-align: left">
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
             <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                    ControlToValidate="TextBox4" ErrorMessage="请输入正确的手机号码！" 
                    ValidationExpression="(^(0[0-9]{2,3}\-)?([2-9][0-9]{6,7})+(\-[0-9]{1,4})?$)|(^((\(\d{3}\))|(\d{3}\-))?(1[358]\d{9})$)"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style8" colspan="2">
                <asp:Button ID="Button1" runat="server" Text="添加" onclick="Button1_Click" />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="Data Source=.;Initial Catalog=myshop;Integrated Security=True" 
                    SelectCommand="SELECT * FROM [省份信息表] ORDER BY [省份编号]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="Data Source=.;Initial Catalog=myshop;Integrated Security=True" 
                    SelectCommand="SELECT * FROM [城市信息表] WHERE ([省份编号] = @省份编号) ORDER BY [城市编号]">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="省份编号" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

