using DAL;
using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class bookingDestination : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string citycode = string.Empty;
        DataSet ds = new DataSet();
        DestinationDAL destination = new DestinationDAL();
        if (Request.QueryString["getid"] != null)
        {
            citycode = Request.QueryString["getid"].ToString();
            ds = destination.GetDestinationList(citycode);
        }
        else
        {
            ds = destination.GetList(new DestinationInfo());
        }
        this.rpt_destination.DataSource = ds;
        this.rpt_destination.DataBind();

        if (Session["member"] != null)
        {
            MemberInfo model = (MemberInfo)Session["member"];
            HidMemberCode.Value = model.code.ToString();
        }
    }
}