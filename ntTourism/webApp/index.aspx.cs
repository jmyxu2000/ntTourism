using DAL;
using Model;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            rpt_hotel.DataSource = new HotelDAL().GetRandomHotel();
            rpt_hotel.DataBind();

            rpt_car.DataSource = new CarDAL().GetRandomCar();
            rpt_car.DataBind();

            rpt_destination.DataSource = new DestinationDAL().GetRandomDestination();
            rpt_destination.DataBind();
        }
    }
}