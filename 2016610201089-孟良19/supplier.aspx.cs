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

public partial class supplier : System.Web.UI.Page
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
        SqlConnection con = new SqlConnection("server=.; uid=sa; pwd=123456; database=myshop");
        SqlCommand cmd = new SqlCommand("insert into 供应商信息表(供应商名称,供应商地址,城市邮编,供应商电话,供应商所在城市,供应商所在省份) values('" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "','" + DropDownList2.SelectedItem.Text + "','" + DropDownList1.SelectedItem.Text + "')", con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        Response.Write("<script language='javascript'>alert('添加成功！')</script>");
    }
}
