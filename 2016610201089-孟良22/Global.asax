<%@ Application Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
        //在应用程序启动时运行的代码
        if (Application["onlineuser"] == null)
        {
            Application["onlineuser"] = 0;
        }
        SqlConnection con = new SqlConnection("server=.;uid=sa;pwd=123456;database=myshop");
        SqlCommand cmd = new SqlCommand("select 网站访问量 from 网站访问信息统计表 order by 编号 desc", con);
        con.Open();
        Application["usertotal"] = Convert.ToInt32(cmd.ExecuteScalar());
        con.Close();
    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //在应用程序关闭时运行的代码
        SqlConnection con = new SqlConnection("server=.;uid=sa;pwd=123456;database=myshop");
        SqlCommand cmd = new SqlCommand("insert into 网站访问信息统计表(网站访问量,存取时间) values(" + Convert.ToInt32(Application["usertotal"]) + ",'" + DateTime.Now.ToString() + "')", con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        //在出现未处理的错误时运行的代码

    }

    void Session_Start(object sender, EventArgs e) 
    {
        //在新会话启动时运行的代码
        if (Application["onlineuser"] != null)
        {
            Application.Lock();
            Application["onlineuser"] = Convert.ToInt32(Application["onlineuser"].ToString()) + 1;
            Application.UnLock();
        }
        if (Application["usertotal"] != null)
        {
            Application.Lock();
            Application["usertotal"] = Convert.ToInt32(Application["usertotal"]) + 1;
            Application.UnLock();
        }
    }

    void Session_End(object sender, EventArgs e) 
    {
        //在会话结束时运行的代码。 
        // 注意: 只有在 Web.config 文件中的 sessionstate 模式设置为
        // InProc 时，才会引发 Session_End 事件。如果会话模式 
        //设置为 StateServer 或 SQLServer，则不会引发该事件。
        if (Application["onlineuser"] != null)
        {
            Application.Lock();
            Application["onlineuser"] = Convert.ToInt32(Application["onlineuser"].ToString()) - 1;
            Application.UnLock();
        }
    }
       
</script>
