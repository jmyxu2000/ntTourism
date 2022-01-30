using DAL;
using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class booking : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            string citycode = string.Empty;
            DataSet ds = new DataSet();
            HotelDAL hotel = new HotelDAL();
            if (Request.QueryString["getid"] != null)
            {
                citycode = Request.QueryString["getid"].ToString();
                ds = hotel.GetHotelList(citycode);
            }
            else
            {
                ds = hotel.GetList(new HotelInfo());
            }
            this.rpt_hotel.DataSource = ds;
            this.rpt_hotel.DataBind();
        }
    }
}