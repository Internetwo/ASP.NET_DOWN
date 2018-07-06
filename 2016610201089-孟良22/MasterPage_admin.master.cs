using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;

public partial class MasterPage_admin : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("hlogin.aspx");
    }
    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        if (TreeView1.SelectedNode.Text == "添加产品分类")
        {
            Response.Redirect("productplus.aspx");
        }
        else if (TreeView1.SelectedNode.Text == "管理产品分类")
        {
            Response.Redirect("productmanage.aspx");
        }
        else if (TreeView1.SelectedNode.Text == "添加供货商")
        {
            Response.Redirect("supplier.aspx");
        }
        else if (TreeView1.SelectedNode.Text == "管理供货商")
        {
            Response.Redirect("suppliermanage.aspx");
        }
        else if (TreeView1.SelectedNode.Text == "管理产品信息")
        {
            Response.Redirect("productinformationmanage.aspx");
        }
        else if (TreeView1.SelectedNode.Text == "添加新产品")
        {
            Response.Redirect("productinformationplus.aspx");
        }
        else if (TreeView1.SelectedNode.Text == "订单管理")
        {
            Response.Redirect("order.aspx");
        }
        else
        {
            Response.Write("<script>alert('系统正在完善,请稍候！')</script>");
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}
