using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using DAL;
using Model;
public partial class admin_listMember : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            MemberDAL dal = new MemberDAL();
            MemberInfo model = new MemberInfo();
            if (Request.QueryString["membername"] != null)
            {
                model.mname = Request.QueryString["membername"].ToString();
            }

            DataSet ds = dal.GetList(model);
            this.rpt_list.DataSource = ds;
            this.rpt_list.DataBind();
        }
    }
}