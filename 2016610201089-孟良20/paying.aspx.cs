using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class paying : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Redirect("login.aspx");
        }
        else if (Request["ddh"] != null)
        {
            SqlConnection con = new SqlConnection("server=.; uid=sa; pwd=123456; database=myshop");
            SqlCommand cmd = new SqlCommand("select a.编号,a.订单编号,a.产品编号,a.产品名称,a.产品单价,a.购买数量,a.总价,b.订单日期,b.订单状态 from 订单详细信息表 a,订单信息表 b where a.订单编号=b.订单编号 and a.订单编号=" + Request["ddh"].ToString(), con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds.Tables[0].DefaultView;
            GridView1.DataBind();
        }
        else
        {
            SqlConnection con = new SqlConnection("server=.; uid=sa; pwd=123456; database=myshop");
            SqlCommand cmd = new SqlCommand("select * from 订单信息表 where 用户名='" + Session["username"].ToString() + "'", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            string str = "";
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                str = str + ds.Tables[0].Rows[i]["订单编号"].ToString() + ",";
            }
            if (str.Length == 0)
            {
                Response.Write("<script language='javascript'>alert('小主还没订单信息呢！')</script>");
            }
            else
            {
                str = str.Remove(str.Length - 1);
                SqlCommand cmd1 = new SqlCommand("select a.编号,a.订单编号,a.产品编号,a.产品名称,a.产品单价,a.购买数量,a.总价,b.订单日期,b.订单状态 from 订单详细信息表 a,订单信息表 b where a.订单编号=b.订单编号 and a.订单编号 in (" + str + ")", con);
                SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
                DataSet ds1 = new DataSet();
                da.Fill(ds1);
                GridView1.DataSource = ds1.Tables[0].DefaultView;
                GridView1.DataBind();
            }
        }
    }
}