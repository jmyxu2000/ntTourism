<%@ WebHandler Language="C#" Class="EditOrderHandler" %>

using System;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using DAL;
using Model;

public class EditOrderHandler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string action = context.Request.Form["action"].ToString();
        if (action.ToLower() == "hotelorderedit")
        {
            
            string ordercode = context.Request.Form["ordercode"].ToString();
            string state = context.Request.Form["state"].ToString();

            HotelOrderDAL dal = new HotelOrderDAL();
            HotelOrderInfo model = new HotelOrderInfo();
            model.ordercode = int.Parse(ordercode);
            model.state = state;
            int res = dal.EditState(model);
            if (res > 0)
            {
                context.Response.Write("1");
            }
            else
            {
                context.Response.Write("0");
            }
           
            
        }

        if (action.ToLower() == "carorderedit")
        {

            string ordercode = context.Request.Form["ordercode"].ToString();
            string state = context.Request.Form["state"].ToString();

            CarOrderDAL dal = new CarOrderDAL();
            CarOrderInfo model = new CarOrderInfo();
            model.ordercode = int.Parse(ordercode);
            model.state = state;
            int res = dal.EditState(model);
            if (res > 0)
            {
                context.Response.Write("1");
            }
            else
            {
                context.Response.Write("0");
            }


        }

        if (action.ToLower() == "destinationorderedit")
        {

            string ordercode = context.Request.Form["ordercode"].ToString();
            string state = context.Request.Form["state"].ToString();

            DestinationOrderDAL dal = new DestinationOrderDAL();
            DestinationOrderInfo model = new DestinationOrderInfo();
            model.ordercode = int.Parse(ordercode);
            model.state = state;
            int res = dal.EditState(model);
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