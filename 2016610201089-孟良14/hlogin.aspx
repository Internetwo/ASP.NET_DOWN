<%@ Page Language="C#" AutoEventWireup="true" CodeFile="hlogin.aspx.cs" Inherits="hlogin" Debug="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>管理员登录</title>
    <style type="text/css">
        .style1
        {
            width: 600px;
        }
        .style3
        {
            text-align: center;
            font-size: xx-large;
            height: 60px;
            font-family: 微软雅黑;
        }
        .style6
        {
            text-align: right;
            height: 30px;
            width: 260px;
        }
        .style7
        {
            text-align: left;
            height: 30px;
        }
        .style8
        {
            height: 30px;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table cellpadding="0" cellspacing="0" class="style1" align="center">
            <tr>
                <td class="style3" colspan="2">
                    <strong>管理员登录</strong></td>
            </tr>
            <tr>
                <td class="style6">
                    用户名：</td>
                <td class="style7">
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style6">
                    密&nbsp;&nbsp;码：</td>
                <td class="style7">
                    <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style6">
                    验证码：</td>
                <td class="style7">
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                    <img src="check.aspx" id="img1" />
                    <asp:LinkButton ID="LinkButton1" runat="server">看不清</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td class="style8" colspan="2">
                    <asp:Button ID="Button1" runat="server" Height="30px" Text="登录" Width="60px" 
                        onclick="Button1_Click" />
                    </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
