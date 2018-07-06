<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="box.aspx.cs" Inherits="box" Title="无标题页" Debug="true"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div align="center">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" EnableModelValidation="True" 
        DataKeyNames="产品编号,产品名称,产品价格,购买数量">
        <Columns>
            <asp:BoundField DataField="产品编号" HeaderText="产品编号" />
            <asp:BoundField DataField="产品名称" HeaderText="产品名称" />
            <asp:BoundField DataField="产品价格" HeaderText="产品价格" />
            <asp:BoundField DataField="购买数量" HeaderText="购买数量" />
        </Columns>
    </asp:GridView>
    </br>
    产品总价：<asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    &nbsp;&nbsp;&nbsp;
    产品数量总计：<asp:Label ID="Label2" runat="server" Text=""></asp:Label>
    <br />
    <asp:Label ID="Label3" runat="server" Text="" ForeColor="Red" 
        style="font-weight: 700"></asp:Label>
    <br />
    <br />
    <asp:Button ID="Button3" runat="server" Text="继续购物" />
&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button4" runat="server" Text="清空购物车" />
&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button5" runat="server" Text="结算" />
    </div>
</asp:Content>

