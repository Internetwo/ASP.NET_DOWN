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

public partial class box : System.Web.UI.Page
{
    protected void databind()
    {
        SqlConnection con = new SqlConnection("server=.;uid=sa;pwd=123456;database=myshop");
        SqlCommand cmd = new SqlCommand("select * from 购物车 where 用户名='" + Session["username"].ToString() + "'", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds.Tables[0].DefaultView;
        GridView1.DataBind();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Redirect("login.aspx");
        }
        else
        {
            SqlConnection con = new SqlConnection("server=.;uid=sa;pwd=123456;database=myshop");
            SqlCommand cmd = new SqlCommand("select * from 产品信息表 where 产品编号=" + Request["sendid"].ToString(), con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);

            string cpmc = ds.Tables[0].Rows[0]["产品名称"].ToString();
            decimal cpjg = Convert.ToDecimal(ds.Tables[0].Rows[0]["产品价格"]);
            int cpkc = Convert.ToInt16(ds.Tables[0].Rows[0]["产品库存数量"]);

            if (cpkc == 0)
            {
                Label3.Text = "产品库存为0";
            }
            else
            {
                SqlCommand cmd2 = new SqlCommand("select * from 购物车 where 用户名= '" + Session["username"].ToString() + "' and 产品编号=" + Request["sendid"].ToString(), con);
                SqlDataAdapter da1 = new SqlDataAdapter(cmd2);
                DataSet ds1 = new DataSet();
                da1.Fill(ds1);

                if (ds1.Tables[0].Rows.Count == 0)
                {
                    SqlCommand cmd1 = new SqlCommand("insert into 购物车 values(" + Request["sendid"].ToString() + ",'" + cpmc + "'," + cpjg + ",1,'" + Session["username"].ToString() + "')", con);
                    con.Open();
                    cmd1.ExecuteNonQuery();
                    con.Close();
                }
                else
                {
                    int gmsl = Convert.ToInt16(ds1.Tables[0].Rows[0]["购买数量"]) + 1;
                    SqlCommand cmd1 = new SqlCommand("update  购物车 set 购买数量=" + gmsl + "where 用户名= '" + Session["username"].ToString() + "' and 产品编号 =" + Request["sendid"].ToString(), con);
                    con.Open();
                    cmd1.ExecuteNonQuery();
                    con.Close();

                }
                databind();
            }

        }
    }
}
