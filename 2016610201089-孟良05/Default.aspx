<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" Title="WAYN��������" Debug="true" %>

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
                        ImageUrl='<%# bind("��ƷͼƬ") %>' Width="91px" />
                    <br />
                    <asp:Label ID="Label3" runat="server" Text='<%# bind("��Ʒ����") %>'></asp:Label>
                    <br />
                    RMB��<asp:Label ID="Label4" runat="server" Text='<%# bind("��Ʒ�۸�") %>'></asp:Label>
                </ItemTemplate>
            </asp:DataList>
            <div>
            ��ǰҳ��<asp:Label ID="lblcurrent" runat="server" Text="1"></asp:Label>����ҳ����
            <asp:Label 
                    ID="lbltotel" runat="server" Text="Label"></asp:Label>��
                    <asp:LinkButton ID="lbtnup" runat="server" onclick="lbtnup_Click">��һҳ</asp:LinkButton>&nbsp;
                    <asp:LinkButton ID="lbtndown" runat="server" onclick="lbtndown_Click">��һҳ</asp:LinkButton>&nbsp;
                <asp:LinkButton ID="lbtnfirst" runat="server" onclick="lbtnfirst_Click">��һҳ</asp:LinkButton>&nbsp;
                <asp:LinkButton ID="lbtnlast" runat="server" onclick="lbtnlast_Click">���һҳ</asp:LinkButton>
                    &nbsp;&nbsp;
                <asp:TextBox ID="TextBox2" runat="server" Height="20px" Width="35px"></asp:TextBox>
&nbsp;<asp:Button ID="Button2" runat="server" Text="��ת" onclick="Button2_Click" />
                    </div>
        </td>
    </tr>
</table>
</asp:Content>

<asp:Content ID="Content4" runat="server" 
    contentplaceholderid="ContentPlaceHolder2">
    <asp:GridView ID="GridView1" runat="server" CellPadding="4" 
        EnableModelValidation="True" ForeColor="#333333" GridLines="None" 
        PageSize="5" AutoGenerateColumns="False" style="text-align: center" 
        Width="100%">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="��Ʒ������" 
                DataNavigateUrlFormatString="Default.aspx?id={0}" DataTextField="��Ʒ��������" 
                HeaderText="���в�Ʒ����" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    </asp:GridView>
</asp:Content>



