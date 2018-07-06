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
}
