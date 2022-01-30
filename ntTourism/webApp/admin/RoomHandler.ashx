<%@ WebHandler Language="C#" Class="RoomHandler" %>
using System;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using DAL;
using Model;

public class RoomHandler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string action = context.Request.Form["action"].ToString();
        if (action.ToLower() == "del")
        {
            string id = context.Request.Form["id"].ToString();

            RoomDAL dal = new RoomDAL();
            int res = dal.DelRoom(id);

            if (res > 0)
            {
                context.Response.Write("1");
            }
            else
            {
                context.Response.Write("0");
            }
        }

        if (action.ToLower() == "roomadd")
        {
            bool dataflag = false;
            string roomcode = string.Empty;
            roomcode = context.Request.Form["roomcode"].ToString();
            if (string.IsNullOrEmpty(roomcode))
            {
                roomcode = Guid.NewGuid().ToString();
                dataflag = true;
            }

            
            string roomname = context.Request.Form["roomname"].ToString();
            string hotelcode = context.Request.Form["hotelcode"].ToString();
            string roomtype = context.Request.Form["roomtype"].ToString();
            decimal price = decimal.Parse(context.Request.Form["price"]);
            int seq = int.Parse(context.Request.Form["seq"]);
            string describe = context.Request.Form["describe"];

            

            RoomDAL dal = new RoomDAL();
            RoomInfo model = new RoomInfo();
            model.Roomcode = roomcode;
            model.Roomname = roomname;
            model.Hotelcode = hotelcode;
            model.Roomtype = roomtype;
            model.Price = price;
            model.Seq = seq;
            model.Describe = describe;
            int res = -1;

            if (dataflag)
            {
                res = dal.AddRoom(model);
            }
            else
            {
                res = dal.UpdateRoom(model);
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