using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DAL;
using Model;

public partial class HotelDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Request.QueryString["getid"] != null)
            {
                string getid = Request.QueryString["getid"].ToString();
                DataSet ds = new DataSet();
                ds = new HotelDAL().GetHotelDetails(getid);
                rpt_hotelDetails.DataSource = ds;
                rpt_hotelDetails.DataBind();

                ds = new DataSet();
                ds = new RoomDAL().GetRoomList(getid);
                rpt_room.DataSource = ds;
                rpt_room.DataBind();
            }
            
        }

        if (Session["member"] != null)
        {
            MemberInfo model = (MemberInfo)Session["member"];
            HidMemberCode.Value = model.code.ToString();
        }
        
    }
}