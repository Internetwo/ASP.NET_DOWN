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

public partial class detailmanage : System.Web.UI.Page
{
    public void Init()
    {
        SqlConnection con = new SqlConnection("server=.;uid=sa;pwd=123456;database=myshop");
        SqlCommand cmd = new SqlCommand("select * from 省份信息表", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        DropDownList1.Items.Clear();
        if (ds.Tables[0].Rows.Count != 0)
        {
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                DropDownList1.Items.Add(ds.Tables[0].Rows[i][1].ToString());
            }
        }
        SqlCommand cmd2 = new SqlCommand("select * from 供应商信息表 where 供应商编号=" + Request["id"].ToString(), con);
        SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
        DataSet ds2 = new DataSet();
        da2.Fill(ds2);

        SqlCommand cmd3 = new SqlCommand("select * from 省份信息表 where 省份名称='" + ds2.Tables[0].Rows[0][6].ToString() + "'", con);
        SqlDataAdapter da3 = new SqlDataAdapter(cmd3);
        DataSet ds3 = new DataSet();
        da3.Fill(ds3);

        SqlCommand cmd4 = new SqlCommand("select * from 城市信息表 where 省份编号=" + ds3.Tables[0].Rows[0][0].ToString(), con);
        SqlDataAdapter da4 = new SqlDataAdapter(cmd4);
        DataSet ds4 = new DataSet();
        da4.Fill(ds4);

        DropDownList2.Items.Clear();
        if (ds4.Tables[0].Rows.Count != 0)
        {
            for (int i = 0; i < ds4.Tables[0].Rows.Count; i++)
            {
                DropDownList2.Items.Add(ds4.Tables[0].Rows[i][1].ToString());
            }
        }
        DropDownList1.SelectedItem.Text = ds2.Tables[0].Rows[0][6].ToString();
        DropDownList2.SelectedItem.Text = ds2.Tables[0].Rows[0][5].ToString();
    }
    public void GetData()
    {
        SqlConnection con = new SqlConnection("server=.;uid=sa;pwd=123456;database=myshop");
        SqlCommand cmd = new SqlCommand("select * from 供应商信息表 where 供应商编号=" + Request["id"].ToString(), con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        TextBox1.Text = ds.Tables[0].Rows[0][1].ToString();
        TextBox2.Text = ds.Tables[0].Rows[0][2].ToString();
        TextBox3.Text = ds.Tables[0].Rows[0][3].ToString();
        TextBox4.Text = ds.Tables[0].Rows[0][4].ToString();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Init();
            GetData();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        TextBox1.ReadOnly = false;
        TextBox2.ReadOnly = false;
        TextBox3.ReadOnly = false;
        TextBox4.ReadOnly = false;
        DropDownList1.Enabled = true;
        DropDownList2.Enabled = true;
        Button1.Enabled = false;
        Button2.Enabled = true;
        Button3.Enabled = true;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        TextBox1.ReadOnly = true;
        TextBox2.ReadOnly = true;
        TextBox3.ReadOnly = true;
        TextBox4.ReadOnly = true;
        DropDownList1.Enabled = false;
        DropDownList2.Enabled = false;
        Button1.Enabled = true;
        Button2.Enabled = false;
        Button3.Enabled = false;
        Init();
        GetData();
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection("server=.;uid=sa;pwd=123456;database=myshop");
        SqlCommand cmd = new SqlCommand("update 供应商信息表 set 供应商名称='" + TextBox1.Text + "',供应商地址='" + TextBox2.Text + "',城市邮编='" + TextBox3.Text + "',供应商电话='" + TextBox4.Text + "',供应商所在省份='" + DropDownList1.SelectedItem.Text + "',供应商所在城市='" + DropDownList2.SelectedItem.Text + "' where 供应商编号=" + Request["id"].ToString(), con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        TextBox1.ReadOnly = true;
        TextBox2.ReadOnly = true;
        TextBox3.ReadOnly = true;
        TextBox4.ReadOnly = true;
        DropDownList1.Enabled = false;
        DropDownList2.Enabled = false;
        Button1.Enabled = true;
        Button2.Enabled = false;
        Button3.Enabled = false;
        Response.Write("<script language='javascript'>alert('修改成功！')</script>");
    }
}
