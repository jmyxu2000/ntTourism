using DAL;
using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class bookingCar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string citycode = string.Empty;
        DataSet ds = new DataSet();
        CarDAL car = new CarDAL();
        if (Request.QueryString["getid"] != null)
        {
            citycode = Request.QueryString["getid"].ToString();
            ds = car.GetCarList(citycode);
        }
        else
        {
            ds = car.GetList(new CarInfo());
        }
        this.rpt_car.DataSource = ds;
        this.rpt_car.DataBind();

        if (Session["member"] != null)
        {
            MemberInfo model = (MemberInfo)Session["member"];
            HidMemberCode.Value = model.code.ToString();
        }
    }
}