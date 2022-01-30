<%@ WebHandler Language="C#" Class="HotelHandler" %>

using System;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using DAL;
using Model;
public class HotelHandler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";

        string action = context.Request.Form["action"].ToString();

        if (action.ToLower() == "del")
        {
            string id = context.Request.Form["id"].ToString();

            HotelDAL dal = new HotelDAL();
            int res = dal.DelHotel(id);

            if (res > 0)
            {
                context.Response.Write("1");
            }
            else
            {
                context.Response.Write("0");
            }
        }

        if (action.ToLower() == "hoteladd")
        {
            bool dataflag = false;
            string hotelcode = string.Empty;
            hotelcode = context.Request.Form["hotelcode"].ToString();
            if (string.IsNullOrEmpty(hotelcode))
            {
                hotelcode = Guid.NewGuid().ToString();
                dataflag = true;
            }
            string hotelname = context.Request.Form["hotelname"].ToString();
            string citycode = context.Request.Form["citycode"].ToString();
            int roomnum = int.Parse(context.Request.Form["roomnum"]); 
            int seq = int.Parse(context.Request.Form["seq"]);
            string describe = context.Request.Form["describe"];
            string hotelpic = context.Request.Form["imgfile"];
           
            HotelDAL dal = new HotelDAL();
            HotelInfo model = new HotelInfo();
            model.Hotelcode = hotelcode;
            model.Citycode = citycode;
            model.RoomNum = roomnum;
            model.Seq = seq;
            model.Describe = describe;
            model.Hotelpic = hotelpic;
            model.Hotelname = hotelname;
            
            int res = -1;
            if (dataflag){
                res = dal.AddHotel(model);
            }
            else
            {
                res = dal.UpdateHotel(model);
            }
            
            if (res > 0)
            {
                context.Response.Write("1");
            }
            else
            {
                context.Response.Write("0");
            }
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}