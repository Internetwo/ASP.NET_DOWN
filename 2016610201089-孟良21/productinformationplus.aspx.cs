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

public partial class productinformationplus : System.Web.UI.Page
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
        Boolean file = false;
        string[] str = { ".jpg", ".jpeg", ".bmp", ".png", ".gif" };
        for (int i = 0; i < str.Length; i++)
        {
            if (System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName).ToLower() == str[i])
            {
                file = true;
            }
        }
        if (FileUpload1.PostedFile.ContentLength == 0)
        {
            Response.Write("<script>alert('请选择要上传的照片文件！')</script>");
        }
        else if (file == false)
        {
            Response.Write("<script>alert('文件格式有误，请选择图片格式！')</script>");
        }
        else
        {
            string wjm = System.IO.Path.GetRandomFileName() + DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString();
            SqlConnection con = new SqlConnection("server=.;uid=sa;pwd=123456;database=myshop");
            SqlCommand cmd = new SqlCommand("select * from 产品分类信息表 where 产品分类编号=" + DropDownList1.SelectedValue, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            string wz = ds.Tables[0].Rows[0]["产品图片存放位置"].ToString();
            FileUpload1.PostedFile.SaveAs(Server.MapPath(".") + "\\" + wz + wjm + ".jpg");
            SqlCommand cmd1 = new SqlCommand("insert into 产品信息表(产品分类编号,产品价格,供应商编号,产品名称,产品描述,产品图片,产品库存数量) values(" + DropDownList1.SelectedValue + "," + TextBox2.Text + "," + DropDownList2.SelectedValue + ",'" + TextBox1.Text + "','" + TextBox4.Text + "','" + wz + wjm + ".jpg'," + TextBox5.Text + ")", con);
            con.Open();
            cmd1.ExecuteNonQuery();
            con.Close();
            Response.Write("<script>alert('添加成功！')</script>");
        }
    }
}
