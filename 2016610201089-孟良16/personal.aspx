<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="personal.aspx.cs" Inherits="personal" Title="个人信息" Debug="true" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style16
        {
            width: 100%;
        }
        .style17
        {
            height: 29px;
        }
        .style18
        {
            height: 105px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="0" cellspacing="0" class="style16" border="1">
        <tr>
            <td rowspan="3" style="text-align: center">
                <asp:Image ID="Image2" runat="server" Width="100px" Height="100px" />
                <br />
                <asp:FileUpload ID="FileUpload1" runat="server" />&nbsp;
                <asp:Button ID="Button7" runat="server" Text="修改头像" onclick="Button7_Click" />
            </td>
            <td class="style17">
                用户名：<asp:Label ID="Label2" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td class="style17">
                修改密码：<asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox><br />
                <br />
                再次输入：<asp:TextBox ID="TextBox3" runat="server" TextMode="Password"></asp:TextBox>&nbsp;&nbsp;
                <asp:Button ID="Button3" runat="server" Text="确定" onclick="Button3_Click" />
                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="两次密码输入不一致！" 
                ControlToCompare="TextBox2" ControlToValidate="TextBox3"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="style18">
                性别：<asp:Label ID="Label3" runat="server"></asp:Label><br />
                <br />
                <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem>--修改性别--</asp:ListItem>
                    <asp:ListItem>男</asp:ListItem>
                    <asp:ListItem>女</asp:ListItem>
                </asp:DropDownList>
                <br />
                <br />
                <asp:Button ID="Button4" runat="server" Text="修改性别" onclick="Button4_Click" />
            </td>
        </tr>
        <tr>
            <td>
                邮编：<asp:Label ID="Label4" runat="server"></asp:Label><br />
                <br />
                电话：<asp:Label ID="Label5" runat="server"></asp:Label><br />
                <br />
                电子邮件：<asp:Label ID="Label6" runat="server"></asp:Label><br />
                <br />
                地址：<asp:Label ID="Label7" runat="server"></asp:Label></td>
            <td>
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>&nbsp;&nbsp;
                <asp:Button ID="Button1" runat="server" Text="修改邮编" onclick="Button1_Click" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="TextBox4" ErrorMessage="请输入正确的邮编格式！" 
                    ValidationExpression="\d{6}"></asp:RegularExpressionValidator>
                <br />
                <br />
                <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>&nbsp;&nbsp;
                <asp:Button ID="Button2" runat="server" Text="修改电话" onclick="Button2_Click" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                    ControlToValidate="TextBox5" ErrorMessage="请输入正确的手机号码！" 
                    ValidationExpression="(^(0[0-9]{2,3}\-)?([2-9][0-9]{6,7})+(\-[0-9]{1,4})?$)|(^((\(\d{3}\))|(\d{3}\-))?(1[358]\d{9})$)"></asp:RegularExpressionValidator>
                <br />
                <br />
                <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>&nbsp;&nbsp;
                <asp:Button ID="Button5" runat="server" Text="修改电子邮件" onclick="Button5_Click" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                    ControlToValidate="TextBox6" ErrorMessage="请输入正确的邮箱格式！" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                <br />
                <br />
                <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>&nbsp;&nbsp;
                <asp:Button ID="Button6" runat="server" Text="修改地址" onclick="Button6_Click" />
            </td>
        </tr>
    </table>
</asp:Content>

