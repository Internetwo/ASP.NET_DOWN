<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="pay.aspx.cs" Inherits="pay" Title="收货信息" Debug="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style16
        {
            width: 100%;
        }
        .style17
        {
            font-family: 微软雅黑;
            font-weight: bold;
            font-size: xx-large;
        }
        .style18
        {
            text-align: center;
        }
        .style20
        {
            text-align: left;
        }
        .style21
        {
            text-align: right;
        }
        .style22
        {
            text-align: right;
            height: 19px;
        }
        .style23
        {
            text-align: left;
            height: 19px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="0" cellspacing="0" class="style16">
        <tr>
            <td class="style17" colspan="3" style="text-align: center">
                填写收货信息</td>
        </tr>
        <tr>
            <td class="style21">
                收货人信息：</td>
            <td class="style20">
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </td>
            <td class="style20" width="160px">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="TextBox2" ErrorMessage="收货人信息不能为空！"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style21">
                省份：<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                    DataSourceID="SqlDataSource1" DataTextField="省份名称" DataValueField="省份编号">
                </asp:DropDownList>
&nbsp;&nbsp;&nbsp;
            </td>
            <td class="style20">
                城市：<asp:DropDownList ID="DropDownList2" runat="server" 
                    DataSourceID="SqlDataSource2" DataTextField="城市名称" DataValueField="城市编号">
                </asp:DropDownList>
            </td>
            <td class="style20" width="150px">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style22">
                地址：</td>
            <td class="style23" >
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            </td>
            <td class="style23">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="TextBox3" ErrorMessage="地址不能为空！"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style21">
                邮编：</td>
            <td class="style20">
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            </td>
            <td class="style20" width="150px">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="TextBox4" ErrorMessage="邮编不能为空！"></asp:RequiredFieldValidator>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="TextBox4" ErrorMessage="邮编格式不对！" 
                    ValidationExpression="\d{6}"></asp:RegularExpressionValidator>
                <br />
            </td>
        </tr>
        <tr>
            <td class="style21">
                电话：</td>
            <td class="style20">
                <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            </td>
            <td class="style20" width="150px">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="TextBox5" ErrorMessage="电话不能为空！"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style18" colspan="3">
                <asp:Button ID="Button3" runat="server" Text="生成订单" onclick="Button3_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="3">
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
            </td>
        </tr>
    </table>
</asp:Content>

