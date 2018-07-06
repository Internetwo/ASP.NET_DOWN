<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="box.aspx.cs" Inherits="box" Title="无标题页" Debug="true"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div align="center">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" EnableModelValidation="True" 
        DataKeyNames="产品编号,产品名称,产品价格,购买数量" 
            onrowcancelingedit="GridView1_RowCancelingEdit" 
            onrowediting="GridView1_RowEditing" onrowupdating="GridView1_RowUpdating" 
            onrowdeleting="GridView1_RowDeleting">
        <Columns>
            <asp:BoundField DataField="产品编号" HeaderText="产品编号" ReadOnly="True" />
            <asp:BoundField DataField="产品名称" HeaderText="产品名称" ReadOnly="True" />
            <asp:BoundField DataField="产品价格" HeaderText="产品价格" ReadOnly="True" />
            <asp:BoundField DataField="购买数量" HeaderText="购买数量" />
            <asp:CommandField ShowEditButton="True" EditText="修改数量" />
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                        CommandName="Delete" 
                        onclientclick="return confirm(&amp;quot;确定要删除吗？&amp;quot;)" 
                        Text="删除"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    </br>
    产品总价：<asp:Label ID="Label1" runat="server" Text=""></asp:Label>&nbsp;&nbsp;&nbsp;
    产品数量总计：<asp:Label ID="Label2" runat="server" Text=""></asp:Label><br />
    <asp:Label ID="Label3" runat="server" Text="" ForeColor="Red" 
        style="font-weight: 700"></asp:Label>
    <br />
    <br />
    <asp:Button ID="Button3" runat="server" Text="继续购物" onclick="Button3_Click" />
&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button4" runat="server" Text="清空购物车" 
            onclientclick="return confirm(&quot;确定要清空吗？&quot;)" onclick="Button4_Click" />
&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button5" runat="server" Text="结算" onclick="Button5_Click" />
    </div>
</asp:Content>

