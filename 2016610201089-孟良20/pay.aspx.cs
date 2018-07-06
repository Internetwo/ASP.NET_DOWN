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

public partial class pay : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Redirect("login.aspx");
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        string rq = DateTime.Now.ToString();
        SqlConnection con = new SqlConnection("server=.; uid=sa; pwd=123456; database=myshop");
        SqlCommand cmd = new SqlCommand("insert into 订单信息表(用户名,收件人姓名,订单日期,用户地址,用户所在城市,用户所在省份,邮编,用户电话,订单状态) values('" + Session["username"].ToString() + "','" + TextBox2.Text + "','" + rq + "','" + DropDownList1.SelectedItem.Text + DropDownList2.SelectedItem.Text + TextBox3.Text + "','" + DropDownList2.SelectedItem.Text + "','" + DropDownList1.SelectedItem.Text + "','" + TextBox4.Text + "','" + TextBox5.Text + "','未审核')", con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        SqlCommand cmd1 = new SqlCommand("select * from 订单信息表 where 用户名='" + Session["username"].ToString() + "' and  订单日期='" + rq + "'", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd1);
        DataSet ds = new DataSet();
        da.Fill(ds);
        int ddbh = Convert.ToInt16(ds.Tables[0].Rows[0]["订单编号"]);
        SqlCommand cmd2 = new SqlCommand("select * from 购物车 where 用户名='" + Session["username"].ToString() + "'", con);
        SqlDataAdapter da1 = new SqlDataAdapter(cmd2);
        DataSet ds1 = new DataSet();
        da1.Fill(ds1);
        for (int i = 0; i < ds1.Tables[0].Rows.Count; i++)
        {
            int cpbh = Convert.ToInt16(ds1.Tables[0].Rows[i]["产品编号"]);
            string cpmc = ds1.Tables[0].Rows[i]["产品名称"].ToString();
            decimal cpdj = Convert.ToDecimal(ds1.Tables[0].Rows[i]["产品价格"]);
            int gmsl = Convert.ToInt16(ds1.Tables[0].Rows[i]["购买数量"]);
            decimal zj = Convert.ToDecimal(cpdj * gmsl);
            SqlCommand cmd3 = new SqlCommand("insert into 订单详细信息表(订单编号,产品编号,产品名称,产品单价,购买数量,总价) values(" + ddbh + "," + cpbh + ",'" + cpmc + "'," + cpdj + "," + gmsl + "," + zj + ")", con);
            con.Open();
            cmd3.ExecuteNonQuery();
            con.Close();
            SqlCommand cmd5 = new SqlCommand("select * from 产品信息表 where 产品编号=" + cpbh, con);
            SqlDataAdapter da2 = new SqlDataAdapter(cmd5);
            DataSet ds2 = new DataSet();
            da2.Fill(ds2);
            int cpkc = Convert.ToInt16(ds2.Tables[0].Rows[0]["产品库存数量"]) - gmsl;
            SqlCommand cmd6 = new SqlCommand("update 产品信息表 set 产品库存数量=" + cpkc + " where 产品编号=" + cpbh, con);
            con.Open();
            cmd6.ExecuteNonQuery();
            con.Close();
        }
        SqlCommand cmd4 = new SqlCommand("delete from 购物车 where 用户名 ='" + Session["username"].ToString() + "'", con);
        con.Open();
        cmd4.ExecuteNonQuery();
        con.Close();
        Response.Redirect("paying.aspx?ddh=" + ddbh);
    }
}
