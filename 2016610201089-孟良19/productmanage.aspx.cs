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

public partial class productmanage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["adname"] == null)
        {
            Response.Redirect("hlogin.aspx");
        }
    }
    protected void DetailsView1_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName == "sc")
        {
            SqlConnection con = new SqlConnection("server=.;uid=sa;pwd=123456;database=myshop");
            SqlCommand cmd = new SqlCommand("select * from 产品信息表 where 产品分类编号=" + e.CommandArgument.ToString(), con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count == 0)
            {
                string ml = DetailsView1.DataKey[3].ToString();
                SqlCommand cmd1 = new SqlCommand("delete from 产品分类信息表 where 产品分类编号=" + e.CommandArgument.ToString(), con);
                con.Open();
                cmd1.ExecuteNonQuery();
                con.Close();
                DetailsView1.DataBind();
                System.IO.Directory.Delete(Server.MapPath(".") + "\\" + ml, true);
                Response.Write("<script>alert('删除成功！')</script>");
            }
            else
            {
                Response.Write("<script>alert('类目文件夹中有文件，不能删除！')</script>");
            }
        }
    }
}
