using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class hlogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection("server=.;uid=sa;pwd=123456;database=myshop");
        SqlCommand cmd = new SqlCommand("select * from 用户详细信息表 where 用户名='" + TextBox1.Text + "'", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count == 0)
        {
            Response.Write("<script>alert('用户名错误！')</script>");

        }
        else if (ds.Tables[0].Rows[0]["权限"].ToString() != "0")
        {
            Response.Write("<script>alert('此通道仅限管理员登录！');window.location.href='login.aspx';</script>");
        }
        else if (ds.Tables[0].Rows[0]["密码"].ToString() != TextBox2.Text)
        {
            Response.Write("<script>alert('密码错误！')</script>");
        }
        else if (TextBox3.Text.ToUpper() == Request.Cookies["validateCookie"]["ChkCode"].ToString().ToUpper())
        {
            Session["adname"] = TextBox1.Text;
            Response.Redirect("productplus.aspx");
        }
        else
        {
            TextBox3.Focus();
            Response.Write("<script>alert('验证码错误！')</script>");
        }
    }
}