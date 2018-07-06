<%@ Page Language="C#" MasterPageFile="~/MasterPage_admin.master" AutoEventWireup="true" CodeFile="detailmanage.aspx.cs" Inherits="detailmanage" Title="编辑供货商" Debug="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style5
        {
            width: 500px;
        }
        .style6
        {
            font-size: xx-large;
            font-weight: bold;
            height: 48px;
        }
        .style9
        {
            text-align: right;
            height: 30px;
        }
        .style10
        {
            text-align: left;
            height: 30px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="0" cellspacing="0" class="style5" align="center">
        <tr>
            <td class="style6" colspan="2">
                编辑供货商</td>
        </tr>
        <tr>
            <td class="style9">
                供货商名称：</td>
            <td class="style10">
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style9">
                所在城市：</td>
            <td class="style10">
                <asp:DropDownList ID="DropDownList1" runat="server" Enabled="False">
                </asp:DropDownList>
&nbsp;&nbsp;&nbsp;
                <asp:DropDownList ID="DropDownList2" runat="server" Enabled="False">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style9">
                地址：</td>
            <td class="style10">
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style9">
                邮编：</td>
            <td class="style10">
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style9">
                电话：</td>
            <td class="style10">
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="Button1" runat="server" Text="我要修改" onclick="Button1_Click" />
&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button2" runat="server" Text="取消修改" onclick="Button2_Click" />
&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button3" runat="server" Text="确定修改" onclick="Button3_Click" />
            </td>
        </tr>
    </table>
</asp:Content>

