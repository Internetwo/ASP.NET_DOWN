<%@ Page Language="C#" MasterPageFile="~/MasterPage_admin.master" AutoEventWireup="true" CodeFile="productmanage.aspx.cs" Inherits="productmanage" Title="产品类别管理" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style5
        {
            font-size: xx-large;
            height: 52px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="0" cellspacing="0" class="style1" align="center">
        <tr>
            <td class="style5">
                产品类别管理</td>
        </tr>
        <tr>
            <td align="center">
                <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" 
                    AutoGenerateRows="False" DataKeyNames="产品分类编号,产品分类名称,产品类别描述,产品图片存放位置" DataSourceID="SqlDataSource1" 
                    EnableModelValidation="True" Height="100px" Width="300px" 
                    HorizontalAlign="Center" onitemcommand="DetailsView1_ItemCommand" >
                    <Fields>
                        <asp:BoundField DataField="产品分类编号" HeaderText="产品分类编号" InsertVisible="False" 
                            ReadOnly="True" SortExpression="产品分类编号" />
                        <asp:BoundField DataField="产品分类名称" HeaderText="产品分类名称" 
                            SortExpression="产品分类名称" />
                        <asp:BoundField DataField="产品类别描述" HeaderText="产品类别描述" 
                            SortExpression="产品类别描述" />
                        <asp:BoundField DataField="产品图片存放位置" HeaderText="产品图片存放位置" 
                            SortExpression="产品图片存放位置" />
                        <asp:CommandField ShowEditButton="True" />
                    </Fields>
                    <FooterTemplate>
                        <asp:LinkButton ID="LinkButton5" runat="server" CausesValidation="False" 
                            CommandArgument='<%# bind("产品分类编号") %>' CommandName="sc" 
                            onclientclick="confirm(&quot;确定要删除吗？&quot;)" Text="删除"></asp:LinkButton>
                    </FooterTemplate>
                </asp:DetailsView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:myshopConnectionString2 %>" 
                    DeleteCommand="DELETE FROM [产品分类信息表] WHERE [产品分类编号] = @产品分类编号" 
                    InsertCommand="INSERT INTO [产品分类信息表] ([产品分类名称], [产品类别描述], [产品图片存放位置]) VALUES (@产品分类名称, @产品类别描述, @产品图片存放位置)" 
                    SelectCommand="SELECT * FROM [产品分类信息表] ORDER BY [产品分类编号]" 
                    UpdateCommand="UPDATE [产品分类信息表] SET [产品分类名称] = @产品分类名称, [产品类别描述] = @产品类别描述, [产品图片存放位置] = @产品图片存放位置 WHERE [产品分类编号] = @产品分类编号">
                    <DeleteParameters>
                        <asp:Parameter Name="产品分类编号" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="产品分类名称" Type="String" />
                        <asp:Parameter Name="产品类别描述" Type="String" />
                        <asp:Parameter Name="产品图片存放位置" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="产品分类名称" Type="String" />
                        <asp:Parameter Name="产品类别描述" Type="String" />
                        <asp:Parameter Name="产品图片存放位置" Type="String" />
                        <asp:Parameter Name="产品分类编号" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

