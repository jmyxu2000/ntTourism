using DAL;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Model;

public partial class userControl_Head : System.Web.UI.UserControl
{
    public string membername = "friends";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            CityDAL city = new CityDAL();
            DataSet ds = new DataSet();
            ds = city.GetList(new CityInfo());
            rptHotel.DataSource = ds;
            rptHotel.DataBind();

            rptCar.DataSource = ds;
            rptCar.DataBind();

            rpt_destination.DataSource = ds;
            rpt_destination.DataBind();
        }

        if (Session["member"] != null)
        {
            //已登录
            MemberInfo member = (MemberInfo)Session["member"];
            this.li_login.Visible = false;
            this.li_reg.Visible = false;
            this.li_logined.Visible = true;
            this.li_close.Visible = true;
            membername = string.IsNullOrEmpty(member.truename) ? member.mname : member.truename;
        }
        else
        {
            //未登录
            this.li_login.Visible = true;
            this.li_reg.Visible = true;
            this.li_logined.Visible = false;
            this.li_close.Visible = false;
        }
    }
}