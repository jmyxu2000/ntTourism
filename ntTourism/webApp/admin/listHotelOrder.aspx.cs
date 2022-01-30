using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using System.Data;
using Model;

public partial class admin_listHotelOrder : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            HotelOrderDAL dal = new HotelOrderDAL();
            MemberInfo model = new MemberInfo();
            if ((Request.QueryString["membername"] != null))
            {
                model.mname = Request.QueryString["membername"].ToString();
            }
            DataSet ds = dal.GetList(model);
            this.rpt_list.DataSource = ds;
            this.rpt_list.DataBind();
        }
    }
}