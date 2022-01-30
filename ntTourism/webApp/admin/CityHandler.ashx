<%@ WebHandler Language="C#" Class="CityHandler" %>

using System;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using DAL;
using Model;

public class CityHandler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
         string action = context.Request.Form["action"].ToString();

        if (action.ToLower() == "del")
        {
            string id = context.Request.Form["id"].ToString();

            CityDAL dal = new CityDAL();
            int res = dal.DelCity(id);

            if (res > 0)
            {
                context.Response.Write("1");
            }
            else
            {
                context.Response.Write("0");
            }
        }

        if (action.ToLower() == "cityadd")
        {

            bool dataflag = false;
            string citycode = string.Empty;
            citycode = context.Request.Form["citycode"].ToString();
            if (string.IsNullOrEmpty(citycode))
            {
                citycode = Guid.NewGuid().ToString();
                dataflag = true;
            }
           
            string cityname = context.Request.Form["cityname"].ToString();
            int seq = int.Parse(context.Request.Form["seq"]);
            
            CityDAL dal = new CityDAL();
            CityInfo model = new CityInfo();
            model.Cityname = cityname;
            model.Citycode = citycode;
            model.Seq = seq;
            int res = -1;

            if (dataflag)
            {
                res = dal.AddCity(model);
            }
            else
            {
                res = dal.UpdateCity(model);
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