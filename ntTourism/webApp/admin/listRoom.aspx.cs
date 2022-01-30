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

public partial class admin_listRoom : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            RoomDAL dal = new RoomDAL();
            RoomInfo model = new RoomInfo();
            if (Request.QueryString["roomname"] != null)
            {
                model.Roomname = Request.QueryString["roomname"].ToString();
            }
            DataSet ds = dal.GetList(model);
            this.rpt_list.DataSource = ds;
            this.rpt_list.DataBind();
        }
    }
}