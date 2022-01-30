using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using Model;
using System.Data;

public partial class admin_roomAdd : System.Web.UI.Page
{
        protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            HotelDAL dal = new HotelDAL();
            hotelcode.DataSource = dal.GetHotelList();
            hotelcode.DataTextField = "hotelname";
            hotelcode.DataValueField = "hotelcode";
            hotelcode.DataBind();
             
        }
//"roomcode":roomcode, "roomname": roomname, "hotelcode": hotelcode, "roomtype": roomtype, "price": price, "seq": seq, "describe": describe,
        if (Request.QueryString["getid"] != null)
        {
            string roomcode = Request.QueryString["getid"].ToString();
            RoomDAL dal = new RoomDAL();
            DataSet ds = dal.GetList(roomcode);
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                Hidroomcode.Value = ds.Tables[0].Rows[0]["roomcode"].ToString();
                roomname.Value = ds.Tables[0].Rows[0]["roomname"].ToString();
                hotelcode.SelectedValue = ds.Tables[0].Rows[0]["hotelcode"].ToString();
                roomtype.Value = ds.Tables[0].Rows[0]["roomtype"].ToString();
                price.Value = ds.Tables[0].Rows[0]["price"].ToString();
                seq.Value = ds.Tables[0].Rows[0]["seq"].ToString();
                describe.InnerText = ds.Tables[0].Rows[0]["describe"].ToString();
                
            }
        }
    }
   
}