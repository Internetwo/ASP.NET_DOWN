<%@ Page Language="C#" MasterPageFile="~/MasterPage_admin.master" AutoEventWireup="true" CodeFile="suppliermanage.aspx.cs" Inherits="suppliermanage" Title="��������" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style5
        {
            height: 60px;
            font-size: xx-large;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="0" cellspacing="0" class="style1">
        <tr>
            <td class="style5">
                ��������</td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="Button1" runat="server" Text="�����Ʋ�ѯ" onclick="Button1_Click" />
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button2" runat="server" Text="�����в�ѯ" onclick="Button2_Click" />
                <br />
                <br />
                <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                    <asp:View ID="View1" runat="server">
                        ���������ƣ�<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button3" runat="server" Text="��ѯ" onclick="Button3_Click" />
                        &nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button4" runat="server" Text="��ʾȫ��" onclick="Button4_Click" />
                    </asp:View>
                    <asp:View ID="View2" runat="server">
                        ʡ�ݣ�<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                            DataSourceID="SqlDataSource1" DataTextField="ʡ������" DataValueField="ʡ�ݱ��">
                        </asp:DropDownList>
                        &nbsp;&nbsp;&nbsp;
                        ���У�<asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" 
                            DataSourceID="SqlDataSource2" DataTextField="��������" DataValueField="���б��">
                        </asp:DropDownList>
                        &nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button5" runat="server" Text="��ѯ" onclick="Button5_Click" />
                        &nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button6" runat="server" Text="��ʾȫ��" onclick="Button6_Click" />
                        <br />
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="Data Source=.;Initial Catalog=myshop;Integrated Security=True" 
                    SelectCommand="SELECT * FROM [ʡ����Ϣ��] ORDER BY [ʡ�ݱ��]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="Data Source=.;Initial Catalog=myshop;Integrated Security=True" 
                    SelectCommand="SELECT * FROM [������Ϣ��] WHERE ([ʡ�ݱ��] = @ʡ�ݱ��) ORDER BY [���б��]">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="ʡ�ݱ��" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                    </asp:View>
                </asp:MultiView>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" 
                    GridLines="None" AutoGenerateColumns="False" EnableModelValidation="True" 
                    onpageindexchanging="GridView1_PageIndexChanging" AllowPaging="True" 
                    PageSize="5" onrowcommand="GridView1_RowCommand">
                    <RowStyle BackColor="#EFF3FB" />
                    <Columns>
                        <asp:BoundField DataField="��Ӧ������" HeaderText="��Ӧ������" />
                        <asp:BoundField DataField="��Ӧ�̵�ַ" HeaderText="��Ӧ�̵�ַ" />
                        <asp:BoundField DataField="�����ʱ�" HeaderText="�����ʱ�" />
                        <asp:BoundField DataField="��Ӧ�̵绰" HeaderText="��Ӧ�̵绰" />
                        <asp:BoundField DataField="��Ӧ�����ڳ���" HeaderText="��Ӧ�����ڳ���" />
                        <asp:BoundField DataField="��Ӧ������ʡ��" HeaderText="��Ӧ������ʡ��" />
                        <asp:TemplateField HeaderText="ɾ��" ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                    CommandName="sc" Text="ɾ��" CommandArgument='<%# bind("��Ӧ�̱��") %>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:HyperLinkField DataNavigateUrlFields="��Ӧ�̱��" 
                            DataNavigateUrlFormatString="detailmanage.aspx?id={0}" Text="�鿴����" />
                    </Columns>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>

