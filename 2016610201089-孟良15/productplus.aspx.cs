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

public partial class productplus : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["adname"] == null)
        {
            Response.Redirect("hlogin.aspx");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection("server=.;uid=sa;pwd=123456;database=myshop");
        SqlCommand cmd = new SqlCommand("insert into 产品分类信息表(产品分类名称,产品类别描述,产品图片存放位置) values('" + TextBox1.Text + "','" + TextBox2.Text + "','~\\images\\" + TextBox1.Text + "\\')", con);
        SqlCommand cmd1 = new SqlCommand("select * from 产品分类信息表 where 产品分类名称='" + TextBox1.Text + "'", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd1);
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (System.IO.Directory.Exists(Server.MapPath(".") + "\\images\\" + TextBox3.Text))
        {
            Response.Write("<script>alert('产品图片目录名称已经存在，请尝试更换！')</script>");
            TextBox3.Focus();
        }
        else if (ds.Tables[0].Rows.Count != 0)
        {
            Response.Write("<script>alert('产品分类名称已经存在，请尝试更换！')</script>");
            TextBox1.Focus();
        }
        else
        {
            con.Open();
            cmd.ExecuteNonQuery();
            System.IO.Directory.CreateDirectory(Server.MapPath(".") + "\\images\\" + TextBox3.Text);
            Response.Write("<script>alert('添加信息成功！')</script>");
        }
    }
}
