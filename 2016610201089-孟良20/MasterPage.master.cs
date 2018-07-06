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
using System.Data.SqlClient;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            LinkButton1.Text = "登录";
            LinkButton2.Text = "注册";
        }
        else
        {
            LinkButton1.Text = "亲爱的" + Session["username"].ToString() + "，欢迎您！";
            LinkButton2.Text = "退出";
        }
        Label1.Text = "本站当前有：" + Application["onlineuser"].ToString() + " 位访问者，历史访问人数为：" + Application["usertotal"] + "人"; 
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx?ss=" + TextBox1.Text);
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        if (LinkButton1.Text == "登录")
        {
            Response.Redirect("login.aspx");
        }
        else 
        {
            Response.Redirect("personal.aspx");
        }
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        if (LinkButton2.Text == "注册")
        {
            Response.Redirect("register.aspx");
        }
        else
        {
            LinkButton1.Text = "登录";
            LinkButton2.Text = "注册";
            Session.Abandon();
        }
    }
    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        if (TreeView1.SelectedNode.Text == "商品浏览")
        {
            Response.Redirect("Default.aspx");
        }
        else if (TreeView1.SelectedNode.Text == "我的订单")
        {
            Response.Redirect("paying.aspx");
        }
        else if (TreeView1.SelectedNode.Text == "购物车")
        {
            Response.Redirect("box.aspx");
        }
        else if (TreeView1.SelectedNode.Text == "修改个人信息")
        {
            Response.Redirect("personal.aspx");
        }
        else
        {
            Response.Write("<script>alert('小主稍安勿躁，系统正在完善！')</script>");
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("hlogin.aspx");
    }
}
