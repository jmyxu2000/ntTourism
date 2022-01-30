<%@ WebHandler Language="C#" Class="CarOrderHandler" %>

using System;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web.SessionState;
using DAL;
using Model;

public class CarOrderHandler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string action = context.Request.Form["action"].ToString();
        if (action.ToLower() == "carorderadd")
        {
            
            string carcode = context.Request.Form["carcode"].ToString();
            string membercode = context.Request.Form["membercode"].ToString();
            string orderprice = context.Request.Form["orderprice"].ToString();
            string begindate= context.Request.Form["begindate"].ToString();
            string enddate = context.Request.Form["enddate"].ToString();
            string cardnumber = context.Request.Form["cardnumber"].ToString();
            string cvv = context.Request.Form["cvv"].ToString();
            string cardholder = context.Request.Form["cardholder"].ToString();
            string validthru = context.Request.Form["validthru"].ToString();

            CarOrderInfo model = new CarOrderInfo();
            model.carcode = carcode;
            model.membercode = membercode;
            model.orderprice = decimal.Parse(orderprice);
            model.begindate = begindate;
            model.enddate = begindate;
            model.state = "paid";
            model.cardnumber = cardnumber;
            model.cvv = cvv;
            model.cardholdername = cardholder;
            model.validthru = validthru;
            
            CarOrderDAL dal = new CarOrderDAL();
            int res = dal.AddCarOrder(model);
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