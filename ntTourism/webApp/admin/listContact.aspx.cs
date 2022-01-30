using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using System.Data;

public partial class admin_listContact : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ContactUsDAL dal = new ContactUsDAL();
            DataSet ds = dal.GetList();
            this.rpt_list.DataSource = ds;
            this.rpt_list.DataBind();
        }
    }
}