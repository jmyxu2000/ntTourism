<%@ WebHandler Language="C#" Class="DestinationOrderHandler" %>

using System;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web.SessionState;
using DAL;
using Model;


public class DestinationOrderHandler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        //"destinationcode": destinationcode, "membercode": membercode, "orderprice": orderprice, "date": date, "adultnum": adultnum, "cardnumber": cardnumber, "cvv": cvv, "cardholder": cardholder, "validthru": validthru, "action": "destinationorderadd"
        string action = context.Request.Form["action"].ToString();
        if (action.ToLower() == "destinationorderadd")
        {

            string destinationcode = context.Request.Form["destinationcode"].ToString();
            string membercode = context.Request.Form["membercode"].ToString();
            string orderprice = context.Request.Form["orderprice"].ToString();
            string date = context.Request.Form["date"].ToString();
            string adultnum = context.Request.Form["adultnum"].ToString();
            string cardnumber = context.Request.Form["cardnumber"].ToString();
            string cvv = context.Request.Form["cvv"].ToString();
            string cardholder = context.Request.Form["cardholder"].ToString();
            string validthru = context.Request.Form["validthru"].ToString();

            DestinationOrderInfo model = new DestinationOrderInfo();
            model.destinationcode = destinationcode;
            model.membercode = membercode;
            model.orderprice = decimal.Parse(orderprice);
            model.date = date;
            model.adultnum = int.Parse(adultnum);
            model.state = "paid";
            model.cardnumber = cardnumber;
            model.cvv = cvv;
            model.cardholdername = cardholder;
            model.validthru = validthru;

            DestinationOrderDAL dal = new DestinationOrderDAL();
            int res = dal.AddDestinationOrder(model);
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
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}