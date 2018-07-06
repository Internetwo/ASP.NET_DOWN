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

public partial class suppliermanage : System.Web.UI.Page
{
    public void GetData()
    {
        SqlConnection con = new SqlConnection("server=.;uid=sa;pwd=123456;database=myshop");
        SqlCommand cmd = new SqlCommand("select * from 供应商信息表 order by 供应商编号 asc", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds.Tables[0].DefaultView;
        GridView1.DataBind();
    }
    public void GetNameSelData()
    {
        SqlConnection con = new SqlConnection("server=.;uid=sa;pwd=123456;database=myshop");
        SqlCommand cmd = new SqlCommand("select * from 供应商信息表 where 供应商名称 like '%" + Request["name"].ToString() + "%' order by 供应商编号 asc", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds.Tables[0].DefaultView;
        GridView1.DataBind();
    }
    public void GetCitySelData()
    {
        SqlConnection con = new SqlConnection("server=.;uid=sa;pwd=123456;database=myshop");
        SqlCommand cmd = new SqlCommand("select * from 供应商信息表 where 供应商所在城市 = '" + Request["city"].ToString() + "' order by 供应商编号 asc", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds.Tables[0].DefaultView;
        GridView1.DataBind();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["adname"] == null)
        {
            Response.Redirect("hlogin.aspx");
        }
        if (!IsPostBack)
        {
            if (Request["name"] == null && Request["city"] == null)
            {
                Button1.BackColor = System.Drawing.Color.YellowGreen;
                Button2.BackColor = System.Drawing.Color.LightGray;
                GetData();
            }
            else if (Request["name"] != null)
            {
                MultiView1.ActiveViewIndex = 0;
                Button1.BackColor = System.Drawing.Color.YellowGreen;
                Button2.BackColor = System.Drawing.Color.LightGray;
                GetNameSelData();
            }
            else if (Request["city"] != null)
            {
                MultiView1.ActiveViewIndex = 1;
                Button2.BackColor = System.Drawing.Color.YellowGreen;
                Button1.BackColor = System.Drawing.Color.LightGray;
                GetCitySelData();
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 0;
        Button1.BackColor = System.Drawing.Color.YellowGreen;
        Button2.BackColor = System.Drawing.Color.LightGray;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
        Button1.BackColor = System.Drawing.Color.LightGray;
        Button2.BackColor = System.Drawing.Color.YellowGreen;
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text == "")
        {
            Response.Write("<script language='javascript'>alert('请输入要查询的供应商名称！')</script>");
            TextBox1.Focus();
        }
        else
        {
            Response.Redirect("suppliermanage.aspx?name=" + TextBox1.Text);
        }
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("suppliermanage.aspx");
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        Response.Redirect("suppliermanage.aspx?city=" + DropDownList2.SelectedItem.Text);
    }
    protected void Button6_Click(object sender, EventArgs e)
    {
        Response.Redirect("suppliermanage.aspx");
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        if (Request["name"] == null && Request["city"] == null)
        {
            GetData();
        }
        else if (Request["name"] != null)
        {
            GetNameSelData();
        }
        else if (Request["city"] != null)
        {
            GetCitySelData();
        }
    }
}
