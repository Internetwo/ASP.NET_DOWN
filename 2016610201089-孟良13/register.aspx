<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" Title="无标题页" Debug="true"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style16
        {
            width: 60%;
        }
        .style17
        {
            text-align: right;
        }
        .style18
        {
            text-align: left;
        }
        .style19
        {
            text-align: center;
        font-family: 黑体;
        font-size: xx-large;
        font-weight: 700;
    }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="0" cellspacing="0" class="style16" align="center">
        <tr>
            <td class="style19" colspan="2">
                用户注册</td>
                                    </tr>
        <tr>
            <td class="style17">
                用户名：</td>
                                        <td class="style18">
                                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                ErrorMessage="不能为空！" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style17">
                                            密码：</td>
                                        <td class="style18">
                                            <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                ErrorMessage="不能为空！" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style17">
                                            再次输入密码：</td>
                                        <td class="style18">
                                            <asp:TextBox ID="TextBox8" runat="server" TextMode="Password"></asp:TextBox>
                                            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                                ErrorMessage="两次密码输入不一致！" ControlToCompare="TextBox2" 
                                                ControlToValidate="TextBox8"></asp:CompareValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style17">
                                            性别：</td>
                                        <td class="style18">
                                            <asp:DropDownList ID="DropDownList1" runat="server">
                                                <asp:ListItem>男</asp:ListItem>
                                                <asp:ListItem>女</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style17">
                                            电子邮件：</td>
            <td class="style18">
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                    ControlToValidate="TextBox4" ErrorMessage="请输入正确的邮箱格式！" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style17">
                地址：</td>
            <td class="style18">
                <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ErrorMessage="不能为空！" ControlToValidate="TextBox5"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style17">
                邮编：</td>
            <td class="style18">
                <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                    ControlToValidate="TextBox6" ErrorMessage="请输入正确的邮编格式！" 
                    ValidationExpression="\d{6}"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style17">
                电话：</td>
            <td class="style18">
                <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                    ControlToValidate="TextBox7" ErrorMessage="请输入正确的手机号码！" 
                    ValidationExpression="(^(0[0-9]{2,3}\-)?([2-9][0-9]{6,7})+(\-[0-9]{1,4})?$)|(^((\(\d{3}\))|(\d{3}\-))?(1[358]\d{9})$)"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style17">
                头像：</td>
            <td class="style18">
                <asp:FileUpload ID="FileUpload1" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="style17">
                <asp:Button ID="Button4" runat="server" onclick="Button4_Click" Text="注册" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
            <td class="style18">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button5" runat="server" onclick="Button5_Click" Text="取消" 
                    CausesValidation="False" />
            </td>
        </tr>
    </table>
</asp:Content>

