using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;
public partial class admin_index : System.Web.UI.Page
{
    public AdminInfo model = new AdminInfo();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Admin"] != null)
        {
            model = (AdminInfo)Session["Admin"];
        }

        string getid = string.Empty;
        if (Request.QueryString["getid"] != null)
        {
            getid = Request.QueryString["getid"].ToString();
        }

        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.AppSettings["connstr"].ToString();

        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }


        string sqlstr = "select * from menu where parentcode='0' order by seq";
        SqlCommand cmd = new SqlCommand(sqlstr, con);
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        sda.Fill(ds);
        rptFirstMu.DataSource = ds;
        rptFirstMu.DataBind();
    }

    protected void rptFirstMu_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        Repeater rptSecondMu = (Repeater)e.Item.FindControl("rptSecondMu");
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.AppSettings["connstr"].ToString();
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }

        string sqlstr = "select * from menu where parentcode='" + DataBinder.Eval(e.Item.DataItem, "menucode").ToString() + "' order by seq";
        SqlCommand cmd = new SqlCommand(sqlstr, con);
        SqlDataAdapter sda = new SqlDataAdapter(cmd);


        DataSet ds = new DataSet();
        sda.Fill(ds);
        rptSecondMu.DataSource = ds;
        rptSecondMu.DataBind();

    }
}