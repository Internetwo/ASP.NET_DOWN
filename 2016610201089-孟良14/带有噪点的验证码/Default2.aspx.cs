using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text.ToUpper() == Request.Cookies["validateCookie"]["ChkCode"].ToString().ToUpper())
        {
            Response.Write("验证码正确！");
        }
        else
        {
            Response.Write("验证码错误！");
        }

    }
}
