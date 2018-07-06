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

public partial class personal : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Redirect("login.aspx");
        }
        SqlConnection con = new SqlConnection("server=.;uid=sa;pwd=123456;database=myshop");
        SqlCommand cmd = new SqlCommand("select * from 用户详细信息表 where 用户名='" + Session["username"].ToString() + "'", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        Image2.ImageUrl = ds.Tables[0].Rows[0]["头像"].ToString();
        Label2.Text = ds.Tables[0].Rows[0]["用户名"].ToString();
        Label3.Text = ds.Tables[0].Rows[0]["性别"].ToString();
        Label4.Text = ds.Tables[0].Rows[0]["邮编"].ToString();
        Label5.Text = ds.Tables[0].Rows[0]["电话"].ToString();
        Label6.Text = ds.Tables[0].Rows[0]["电子邮件"].ToString();
        Label7.Text = ds.Tables[0].Rows[0]["地址"].ToString();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox4.Text != "")
        {
            SqlConnection con = new SqlConnection("server=.;uid=sa;pwd=123456;database=myshop");
            SqlCommand cmd = new SqlCommand("update 用户详细信息表 set 邮编=" + TextBox4.Text + " where 用户名='" + Session["username"].ToString() + "'", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Write("<script>alert('邮编修改成功！');window.location.href=window.location.href;</script>");
        }
        else
        {
            Response.Write("<script>alert('未修改任何内容！')</script>");
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (TextBox5.Text != "")
        {
            SqlConnection con = new SqlConnection("server=.;uid=sa;pwd=123456;database=myshop");
            SqlCommand cmd = new SqlCommand("update 用户详细信息表 set 电话=" + TextBox5.Text + " where 用户名='" + Session["username"].ToString() + "'", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Write("<script>alert('电话修改成功！');window.location.href=window.location.href;</script>");
        }
        else
        {
            Response.Write("<script>alert('未修改任何内容！')</script>");
        }
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        if (TextBox6.Text != "")
        {
            SqlConnection con = new SqlConnection("server=.;uid=sa;pwd=123456;database=myshop");
            SqlCommand cmd = new SqlCommand("update 用户详细信息表 set 电子邮件='" + TextBox6.Text + "' where 用户名='" + Session["username"].ToString() + "'", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Write("<script>alert('电子邮件修改成功！');window.location.href=window.location.href;</script>");
        }
        else
        {
            Response.Write("<script>alert('未修改任何内容！')</script>");
        }
    }
    protected void Button6_Click(object sender, EventArgs e)
    {
        if (TextBox6.Text != "")
        {
            SqlConnection con = new SqlConnection("server=.;uid=sa;pwd=123456;database=myshop");
            SqlCommand cmd = new SqlCommand("update 用户详细信息表 set 地址='" + TextBox7.Text + "' where 用户名='" + Session["username"].ToString() + "'", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Write("<script>alert('地址修改成功！');window.location.href=window.location.href;</script>");
        }
        else
        {
            Response.Write("<script>alert('未修改任何内容！')</script>");
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        if (TextBox2.Text != "" && TextBox3.Text == "")
        {
            Response.Write("<script>alert('请输入两次密码！')</script>");
        }
        else if (TextBox2.Text != "")
        {
            SqlConnection con = new SqlConnection("server=.;uid=sa;pwd=123456;database=myshop");
            SqlCommand cmd = new SqlCommand("update 用户详细信息表 set 密码=" + TextBox3.Text + " where 用户名='" + Session["username"].ToString() + "'", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Write("<script>alert('密码修改成功！');window.location.href=window.location.href;</script>");
        }
        else
        {
            Response.Write("<script>alert('未修改任何内容！')</script>");
        }
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedIndex == 0)
        {
            Response.Write("<script>alert('请选择性别！')</script>");
        }
        else
        {
            SqlConnection con = new SqlConnection("server=.;uid=sa;pwd=123456;database=myshop");
            SqlCommand cmd = new SqlCommand("update 用户详细信息表 set 性别='" + DropDownList1.Text + "' where 用户名='" + Session["username"].ToString() + "'", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Write("<script>alert('性别修改成功！');window.location.href=window.location.href;</script>");
        }
    }
    protected void Button7_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection("server=.;uid=sa;pwd=123456;database=myshop");
        SqlCommand cmd = new SqlCommand("select * from 用户详细信息表 where 用户名='" + Session["username"].ToString() + "'", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
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
            FileUpload1.PostedFile.SaveAs(Server.MapPath("") + "\\images\\user\\" + Label2.Text + ".jpg");
            SqlCommand cmd1 = new SqlCommand("update 用户详细信息表 set 头像='" + "~\\images\\user\\" + Label2.Text + ".jpg' where 用户名='" + Session["username"].ToString() + "'", con);
            con.Open();
            cmd1.ExecuteNonQuery();
            con.Close();
            Response.Write("<script>alert('头像修改成功！');window.location.href=window.location.href;</script>");
        }
    }
}
