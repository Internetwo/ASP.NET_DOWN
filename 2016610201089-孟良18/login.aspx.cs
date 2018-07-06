using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;

public partial class login : System.Web.UI.Page
{
    public string rnd()
    {
        Random rnd = new Random();
        string str = rnd.Next(1000, 9999).ToString();
        return str;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Label1.Text = rnd();
        }
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection("server=.;uid=sa;pwd=123456;database=myshop");
        SqlCommand cmd = new SqlCommand("select * from 用户详细信息表 where 用户名='" + TextBox2.Text + "'", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count == 0)
        {
            Response.Write("<script>alert('用户名错误！')</script>");
            Label1.Text = rnd();

        }
        else if (ds.Tables[0].Rows[0]["密码"].ToString() != TextBox3.Text)
        {
            Response.Write("<script>alert('密码错误！')</script>");
            Label1.Text = rnd();
        }
        else if (TextBox4.Text != Label1.Text)
        {
            Response.Write("<script>alert('验证码错误！')</script>");
            Label1.Text = rnd();
        }
        else
        {
            Session["username"] = TextBox2.Text;
            Response.Redirect("Default.aspx");
        }
    }
}
