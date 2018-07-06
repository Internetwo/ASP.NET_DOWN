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

public partial class register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection("server=.;uid=sa;pwd=123456;database=myshop");
        SqlCommand cmd = new SqlCommand("select * from 用户详细信息表 where 用户名='" + TextBox1.Text + "'", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count != 0)
        {
            Response.Write("<script language='javascript'>alert('此用户名已被注册！')</script>");
        }
        else
        {
            Boolean file = false;
            string[] str = { ".jpg", ".jpeg", "bmp", "png", "gif" };
            for (int i = 0; i < str.Length; i++)
            {
                if (System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName).ToLower() == str[i])
                {
                    file = true;
                }
            }
            if (FileUpload1.PostedFile.ContentLength == 0)
            {
                Response.Write("<script language='javascript'>alert('请选择要上传的照片文件！')</script>");
            }
            else if (file == false)
            {
                Response.Write("<script language='javascript'>alert('请注意使用照片格式！')</script>");
            }
            else
            {
                FileUpload1.PostedFile.SaveAs(Server.MapPath("") + "\\images\\user\\" + TextBox1.Text + ".jpg");
                SqlCommand cmd1 = new SqlCommand("insert into 用户详细信息表 values('" + TextBox1.Text + "','" + TextBox2.Text + "','" + DropDownList1.Text + "','" + TextBox4.Text + "','" + TextBox5.Text + "','" + TextBox6.Text + "','" + TextBox7.Text + "','" + "~\\images\\user\\" + TextBox1.Text + ".jpg')", con);
                con.Open();
                cmd1.ExecuteNonQuery();
                con.Close();
                Response.Write("<script language='javascript'>alert('注册成功！');location.href='login.aspx'</script>");
            }
        }
    }
}
