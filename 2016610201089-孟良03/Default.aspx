<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" Title="无标题页" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style15
    {
        width: 100%;
        border: 1px solid #000000;
    }
</style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style15">
    <tr>
        <td>
            <asp:DataList ID="DataList1" runat="server" CellSpacing="10" 
                RepeatDirection="Horizontal">
                <ItemTemplate>
                    <asp:Image ID="Image2" runat="server" Height="97px" 
                        ImageUrl='<%# bind("产品图片") %>' Width="91px" />
                    <br />
                    <asp:Label ID="Label3" runat="server" Text='<%# bind("产品名称") %>'></asp:Label>
                    <br />
                    RMB：<asp:Label ID="Label4" runat="server" Text='<%# bind("产品价格") %>'></asp:Label>
                </ItemTemplate>
            </asp:DataList>
            <div>
            当前页：<asp:Label ID="lblcurrent" runat="server" Text="1"></asp:Label>，总页数：
            <asp:Label 
                    ID="lbltotel" runat="server" Text="Label"></asp:Label>，
                    <asp:LinkButton ID="lbtnup" runat="server" onclick="lbtnup_Click">上一页</asp:LinkButton>&nbsp;
                    <asp:LinkButton ID="lbtndown" runat="server" onclick="lbtndown_Click">下一页</asp:LinkButton>&nbsp;
                <asp:LinkButton ID="lbtnfirst" runat="server" onclick="lbtnfirst_Click">第一页</asp:LinkButton>&nbsp;
                <asp:LinkButton ID="lbtnlast" runat="server" onclick="lbtnlast_Click">最后一页</asp:LinkButton>
                    &nbsp;&nbsp;
                <asp:TextBox ID="TextBox2" runat="server" Height="20px" Width="35px"></asp:TextBox>
&nbsp;<asp:Button ID="Button2" runat="server" Text="跳转" onclick="Button2_Click" />
                    </div>
        </td>
    </tr>
</table>
</asp:Content>

