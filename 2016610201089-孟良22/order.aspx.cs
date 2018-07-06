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

public partial class order : System.Web.UI.Page
{
    public void GetSelData()
    {
        SqlConnection con = new SqlConnection("server=.;uid=sa;pwd=123456;database=myshop");
        SqlCommand cmd = new SqlCommand("select * from 订单信息表 where " + Request["field"].ToString() + " like '%" + Request["fieldvalue"].ToString() + "%'", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds.Tables[0].DefaultView;
        GridView1.DataBind();
    }
    public void GetData()
    {
        SqlConnection con = new SqlConnection("server=.;uid=sa;pwd=123456;database=myshop");
        SqlCommand cmd = new SqlCommand("select * from 订单信息表", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds.Tables[0].DefaultView;
        GridView1.DataBind();
    }
    public void GetDetail()
    {
        SqlConnection con = new SqlConnection("server=.;uid=sa;pwd=123456;database=myshop");
        SqlCommand cmd = new SqlCommand("select * from 订单详细信息表 where 订单编号=" + Request["ddbh"].ToString(), con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView2.DataSource = ds.Tables[0].DefaultView;
        GridView2.DataBind();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["adname"] == null)
        {
            Response.Redirect("hlogin.aspx");
        }
        if (!IsPostBack)
        {
            if (Request["fieldvalue"] == null)
            {
                if (Request["ddbh"] == null)
                {
                    GetData();
                }
                else
                {
                    GetData();
                    GetDetail();
                }
            }
            else
            {
                if (Request["ddbh"] == null)
                {
                    GetSelData();
                }
                else
                {
                    GetSelData();
                    GetDetail();
                }
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text == "")
        {
            Response.Write("<script language='javascript'>alert('请输入查询内容！')</script>");
            TextBox1.Focus();
        }
        else
        {
            Response.Redirect("order.aspx?fieldvalue=" + TextBox1.Text + "&field=" + DropDownList1.SelectedItem.Text);
        }
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        if (Request["fieldvalue"] == null)
        {
            GetData();
        }
        else
        {
            GetSelData();
        }
        ((DropDownList)GridView1.Rows[e.NewEditIndex].Cells[7].FindControl("DropDownList2")).Enabled = true;
    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        if (Request["fieldvalue"] == null)
        {
            GetData();
        }
        else
        {
            GetSelData();
        }
        ((DropDownList)GridView1.Rows[e.RowIndex].Cells[7].FindControl("DropDownList2")).Enabled = false;
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int ddbh = Convert.ToInt16(GridView1.DataKeys[e.RowIndex][0]);
        string xm = ((TextBox)GridView1.Rows[e.RowIndex].Cells[2].Controls[0]).Text;
        string yhdz = ((TextBox)GridView1.Rows[e.RowIndex].Cells[4].Controls[0]).Text;
        string yb = ((TextBox)GridView1.Rows[e.RowIndex].Cells[5].Controls[0]).Text;
        string dh = ((TextBox)GridView1.Rows[e.RowIndex].Cells[6].Controls[0]).Text;
        string ddzt = ((DropDownList)GridView1.Rows[e.RowIndex].Cells[7].FindControl("DropDownList2")).SelectedItem.Text;
        SqlConnection con = new SqlConnection("server=.;uid=sa;pwd=123456;database=myshop");
        SqlCommand cmd = new SqlCommand("update 订单信息表 set 收件人姓名='" + xm + "',用户地址='" + yhdz + "',邮编='" + yb + "',用户电话='" + dh + "',订单状态='" + ddzt + "'" + " where 订单编号=" + ddbh, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        GridView1.EditIndex = -1;
        if (Request["fieldvalue"] == null)
        {
            GetData();
        }
        else
        {
            GetSelData();
        }
        ((DropDownList)GridView1.Rows[e.RowIndex].Cells[7].FindControl("DropDownList2")).Enabled = false;
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        if (Request["fieldvalue"] == null)
        {
            GetData();
        }
        else
        {
            GetSelData();
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("order.aspx");
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "sc")
        {
            SqlConnection con = new SqlConnection("server=.;uid=sa;pwd=123456;database=myshop");
            SqlCommand cmd = new SqlCommand("delete from 订单信息表 where 订单编号=" + e.CommandArgument.ToString(), con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Write("<script language='javascript'>alert('删除成功！');window.location='order.aspx'</script>");
        }
    }
}
