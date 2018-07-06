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

public partial class _Default : System.Web.UI.Page
{
    public void pagination()
    {
        SqlConnection con = new SqlConnection("server=.;uid=sa;pwd=123456;database=myshop");
        SqlCommand cmd = new SqlCommand("select * from 产品信息表", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        PagedDataSource ps = new PagedDataSource();
        ps.DataSource = ds.Tables[0].DefaultView;
        ps.AllowPaging = true;
        ps.PageSize = 10;
        ps.CurrentPageIndex = Convert.ToInt16(lblcurrent.Text) - 1;
        lbltotel.Text = ps.PageCount.ToString();
        lbtnup.Enabled = true;
        lbtndown.Enabled = true;
        lbtnfirst.Enabled = true;
        lbtnlast.Enabled = true;
        if (ps.IsFirstPage)
        {
            lbtnup.Enabled = false;
            lbtnfirst.Enabled = false;
        }
        if (ps.IsLastPage)
        {
            lbtndown.Enabled = false;
            lbtnlast.Enabled = false;
        }
        DataList1.DataSource = ps;
        DataList1.DataBind();
    }

    public void typepagination()
    {
        SqlConnection con = new SqlConnection("server=.;uid=sa;pwd=123456;database=myshop");
        SqlCommand cmd = new SqlCommand("select * from 产品信息表 where 产品分类编号=" + Request["id"].ToString(), con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        PagedDataSource ps = new PagedDataSource();
        ps.DataSource = ds.Tables[0].DefaultView;
        ps.AllowPaging = true;
        ps.PageSize = 10;
        ps.CurrentPageIndex = Convert.ToInt16(lblcurrent.Text) - 1;
        lbltotel.Text = ps.PageCount.ToString();
        lbtnup.Enabled = true;
        lbtndown.Enabled = true;
        lbtnfirst.Enabled = true;
        lbtnlast.Enabled = true;
        if (ps.IsFirstPage)
        {
            lbtnup.Enabled = false;
            lbtnfirst.Enabled = false;
        }
        if (ps.IsLastPage)
        {
            lbtndown.Enabled = false;
            lbtnlast.Enabled = false;
        }
        DataList1.DataSource = ps;
        DataList1.DataBind();
    }

    public void Selpagination()
    {
        SqlConnection con = new SqlConnection("server=.;uid=sa;pwd=123456;database=myshop");
        SqlCommand cmd = new SqlCommand("select * from 产品信息表 where 产品名称 like '%" + Request["ss"].ToString() + "%'", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        PagedDataSource ps = new PagedDataSource();
        ps.DataSource = ds.Tables[0].DefaultView;
        ps.AllowPaging = true;
        ps.PageSize = 10;
        ps.CurrentPageIndex = Convert.ToInt16(lblcurrent.Text) - 1;
        lbltotel.Text = ps.PageCount.ToString();
        lbtnup.Enabled = true;
        lbtndown.Enabled = true;
        lbtnfirst.Enabled = true;
        lbtnlast.Enabled = true;
        if (ps.IsFirstPage)
        {
            lbtnup.Enabled = false;
            lbtnfirst.Enabled = false;
        }
        if (ps.IsLastPage)
        {
            lbtndown.Enabled = false;
            lbtnlast.Enabled = false;
        }
        DataList1.DataSource = ps;
        DataList1.DataBind();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request["ss"] == null && Request["id"]==null)
            {
                pagination();
            }
            else if (Request["ss"]!=null)
            {
                Selpagination();
            }
            else if (Request["id"]!=null)
            {
                typepagination();
            }
        }
    }
    protected void lbtnup_Click(object sender, EventArgs e)
    {
        lblcurrent.Text = (Convert.ToInt16(lblcurrent.Text) - 1).ToString();
        if (Request["ss"] == null && Request["id"] == null)
        {
            pagination();
        }
        else if (Request["ss"] != null)
        {
            Selpagination();
        }
        else if (Request["id"] != null)
        {
            typepagination();
        }
    }
    protected void lbtndown_Click(object sender, EventArgs e)
    {
        lblcurrent.Text = (Convert.ToInt16(lblcurrent.Text) + 1).ToString();
        if (Request["ss"] == null && Request["id"] == null)
        {
            pagination();
        }
        else if (Request["ss"] != null)
        {
            Selpagination();
        }
        else if (Request["id"] != null)
        {
            typepagination();
        }
    }
    protected void lbtnfirst_Click(object sender, EventArgs e)
    {
        lblcurrent.Text = "1";
        if (Request["ss"] == null && Request["id"] == null)
        {
            pagination();
        }
        else if (Request["ss"] != null)
        {
            Selpagination();
        }
        else if (Request["id"] != null)
        {
            typepagination();
        }
    }
    protected void lbtnlast_Click(object sender, EventArgs e)
    {
        lblcurrent.Text = lbltotel.Text;
        if (Request["ss"] == null && Request["id"] == null)
        {
            pagination();
        }
        else if (Request["ss"] != null)
        {
            Selpagination();
        }
        else if (Request["id"] != null)
        {
            typepagination();
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            if (Convert.ToInt16(TextBox2.Text) > Convert.ToInt16(lbltotel.Text))
            {
                Response.Write("<script language='javascript'>alert('已超过总数！')</script>");
            }
            else
            {
                lblcurrent.Text = TextBox2.Text;
                if (Request["ss"] == null && Request["id"] == null)
                {
                    pagination();
                }
                else if (Request["ss"] != null)
                {
                    Selpagination();
                }
                else if (Request["id"] != null)
                {
                    typepagination();
                }
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script language='javascript'>alert('请输入整数！')</script>");
        }
    }
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "pi" || e.CommandName == "tb")
        {
            Response.Redirect("detail.aspx?sendid=" + e.CommandArgument.ToString());
        }
    }
}
