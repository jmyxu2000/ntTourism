using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using System.Data;
using Model;
public partial class admin_listHotel : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            HotelDAL dal = new HotelDAL();
            HotelInfo model = new HotelInfo();
            
            if (Request.QueryString["htname"]!= null){
                model.Hotelname = Request.QueryString["htname"].ToString();
            }
            DataSet ds = dal.GetList(model);
            this.rpt_list.DataSource = ds;
            this.rpt_list.DataBind();
        }
    }
}