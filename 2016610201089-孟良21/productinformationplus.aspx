<%@ Page Language="C#" MasterPageFile="~/MasterPage_admin.master" AutoEventWireup="true" CodeFile="productinformationplus.aspx.cs" Inherits="productinformationplus" Title="添加产品信息" Debug="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style5
        {
            width: 640px;
        }
        .style6
        {
            font-size: xx-large;
            font-weight: bold;
            height: 52px;
        }
        .style7
        {
            text-align: right;
            height: 200px;
        }
        .style8
        {
            text-align: left;
            height: 200px;
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
            color: #FF0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<center>
    <table cellpadding="0" cellspacing="0" class="style5">
        <tr>
            <td class="style6" colspan="2">
                添加产品信息</td>
        </tr>
        <tr>
            <td class="style9">
                产品名称：</td>
            <td class="style10">
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style9">
                产品分类：</td>
                                        <td class="style10">
                                            <asp:DropDownList ID="DropDownList1" runat="server" 
                                                DataSourceID="SqlDataSource1" DataTextField="产品分类名称" DataValueField="产品分类编号">
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:myshopConnectionString %>" 
                                                SelectCommand="SELECT * FROM [产品分类信息表] ORDER BY [产品分类编号]">
                                            </asp:SqlDataSource>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style9">
                                            产品价格：</td>
                                        <td class="style10">
                                            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                                ErrorMessage="请输入最多两位小数的正实数！" 
                                                ValidationExpression="^[0-9]+(,[0-9]{0,2})?$" ControlToValidate="TextBox2"></asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style9">
                                            产品图片：</td>
                                        <td class="style10">
                                        <asp:FileUpload ID="FileUpload1" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style7">
                                            产品描述：</td>
                                        <td class="style8">
                                            <asp:TextBox ID="TextBox4" runat="server" Height="150px" TextMode="MultiLine" 
                                                Width="255px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style9">
                                            产品库存：</td>
            <td class="style10">
                <asp:TextBox ID="TextBox5" runat="server">
                </asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="只允许输入数字！" ValidationExpression="[0-9]+" ControlToValidate="TextBox5"></asp:RegularExpressionValidator>
                </br>
                <span class="style11">最大库存量为：2147483647</span>
            </td>
        </tr>
        <tr>
            <td class="style9">
                供应商：</td>
            <td class="style10">
                <asp:DropDownList ID="DropDownList2" runat="server" 
                    DataSourceID="SqlDataSource2" DataTextField="供应商名称" DataValueField="供应商编号">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:myshopConnectionString %>" 
                    SelectCommand="SELECT * FROM [供应商信息表] ORDER BY [供应商编号]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="2" height="30px">
                <asp:Button ID="Button1" runat="server" Text="添加" onclick="Button1_Click" />
            </td>
        </tr>
    </table>
    </center>
</asp:Content>

