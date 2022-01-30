<%@ WebHandler Language="C#" Class="DestinationHandler" %>

using System;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using DAL;
using Model;

public class DestinationHandler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string action = context.Request.Form["action"].ToString();

        if (action.ToLower() == "del")
        {
            string id = context.Request.Form["id"].ToString();

            DestinationDAL dal = new DestinationDAL();
            int res = dal.DelDestination(id);

            if (res > 0)
            {
                context.Response.Write("1");
            }
            else
            {
                context.Response.Write("0");
            }
        }

        if (action.ToLower() == "destinationadd")
        {
            bool dataflag = false;
            string destinationcode = string.Empty;
            destinationcode = context.Request.Form["destinationcode"].ToString();
            if (string.IsNullOrEmpty(destinationcode))
            {
               destinationcode = Guid.NewGuid().ToString();
               dataflag = true;
            }
            
            string destinationname = context.Request.Form["destinationname"];
            string citycode = context.Request.Form["citycode"].ToString();
            decimal budget = decimal.Parse(context.Request.Form["budget"]);
            int seq = int.Parse(context.Request.Form["seq"]);
            string describe = context.Request.Form["describe"];
            string pic = context.Request.Form["imgfile"];
            DestinationDAL dal = new DestinationDAL();
            DestinationInfo model = new DestinationInfo();
            model.Destinationcode = destinationcode ;
            model.Citycode = citycode;
            model.Destinationname = destinationname;
            model.Needmoney = budget;
            model.Seq = seq;
            model.Describe = describe;
            model.Pic = pic;
            int res = -1;

            if (dataflag)
            {
                res = dal.AddDestination(model);
            }
            else
            {
                res = dal.UpdateDestination(model);
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