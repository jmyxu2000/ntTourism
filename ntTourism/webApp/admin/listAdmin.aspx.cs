using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;

public partial class admin_listAdmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            AdminDAL dal = new AdminDAL();
            DataSet ds = dal.GetList();
            this.rpt_list.DataSource = ds;
            this.rpt_list.DataBind();
        }
    }
}