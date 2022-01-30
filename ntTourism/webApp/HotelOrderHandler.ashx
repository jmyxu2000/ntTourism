<%@ WebHandler Language="C#" Class="HotelOrderHandler" %>

using System;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web.SessionState;
using DAL;
using Model;

public class HotelOrderHandler : IHttpHandler, IRequiresSessionState
{
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string action = context.Request.Form["action"].ToString();
        if (action.ToLower() == "hotelorderadd")
        {
            //"roomcode": roomcode, "membercode": membercode, "orderprice": orderprice, "begindate": begindate, "enddate": enddate, "adultnum": adultnum, "cardnumber": cardnumber, "cvv": cvv, "cardholder": cardholder, "validthru": validthru, "action": "hotelorderadd"
            string roomcode = context.Request.Form["roomcode"].ToString();
            string membercode = context.Request.Form["membercode"].ToString();
            string orderprice = context.Request.Form["orderprice"].ToString();
            string begindate= context.Request.Form["begindate"].ToString();
            string enddate = context.Request.Form["enddate"].ToString();
            string adultnum = context.Request.Form["adultnum"].ToString();
            string cardnumber = context.Request.Form["cardnumber"].ToString();
            string cvv = context.Request.Form["cvv"].ToString();
            string cardholder = context.Request.Form["cardholder"].ToString();
            string validthru = context.Request.Form["validthru"].ToString();

            HotelOrderInfo model = new HotelOrderInfo();
            model.roomcode = roomcode;
            model.membercode = membercode;
            model.orderprice = decimal.Parse(orderprice);
            model.begindate = begindate;
            model.enddate = begindate;
            model.state = "paid";
            model.adultnum = int.Parse(adultnum);
            model.cardnumber = cardnumber;
            model.cvv = cvv;
            model.cardholdername = cardholder;
            model.validthru = validthru;
            
            HotelOrderDAL dal = new HotelOrderDAL();
            int res = dal.AddHotelOrder(model);
            if (res > 0)
            {
                model.state = "finish payment";
                context.Response.Write("1");
                
            }
            else
            {
                context.Response.Write("0");
            }
               
            
        }
        
        if (action.ToLower() == "getprice")
        {
            string price = context.Request.Form["price"].ToString();
            int begindate = int.Parse(context.Request.Form["begindate"].ToString());
            int enddate = int.Parse(context.Request.Form["enddate"].ToString());
            int date = begindate - enddate;
            decimal pricedes = Convert.ToDecimal(price);
            decimal res = date * pricedes;
            context.Response.Write(res);
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}