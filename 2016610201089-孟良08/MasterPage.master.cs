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
}
