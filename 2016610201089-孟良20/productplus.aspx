<%@ Page Language="C#" MasterPageFile="~/MasterPage_admin.master" AutoEventWireup="true" CodeFile="productplus.aspx.cs" Inherits="productplus" Title="添加产品分类" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style5
    {
        width: 420px;
    }
        .style6
        {
            height: 40px;
            font-size: large;
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
        .style11
        {
            text-align: right;
            height: 31px;
        }
        .style12
        {
            text-align: left;
            height: 31px;
        }
        .style13
        {
            height: 30px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="0" cellspacing="0" class="style5" align="center">
    <tr>
        <td class="style6" colspan="2">
            添加产品分类</td>
    </tr>
    <tr>
        <td class="style9">
            产品分类名称：</td>
        <td class="style10">
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style9">
            产品分类描述：</td>
        <td class="style10">
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style11">
            产品图片存放位置：</td>
        <td class="style12">
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style13" colspan="2">
            <asp:Button ID="Button1" runat="server" Text="确定" onclick="Button1_Click" />
        </td>
    </tr>
</table>
</asp:Content>

