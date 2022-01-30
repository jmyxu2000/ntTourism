using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using Model;


public partial class admin_listAttraction : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            DestinationDAL dal = new DestinationDAL();
            DestinationInfo model = new DestinationInfo();
            if (Request.QueryString["destinationname"]!=null){
                model.Destinationname = Request.QueryString["destinationname"].ToString();
            }
            DataSet ds = dal.GetList(model);
            this.rpt_list.DataSource = ds;
            this.rpt_list.DataBind();
        }
    }
}