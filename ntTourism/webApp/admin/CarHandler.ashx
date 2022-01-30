<%@ WebHandler Language="C#" Class="CarHandler" %>

using System;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using DAL;
using Model;
public class CarHandler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string action = context.Request.Form["action"].ToString();

        if (action.ToLower() == "del")
        {
            string id = context.Request.Form["id"].ToString();

            CarDAL dal = new CarDAL();
            int res = dal.DelCar(id);

            if (res > 0)
            {
                context.Response.Write("1");
            }
            else
            {
                context.Response.Write("0");
            }
        }

        if (action.ToLower() == "caradd")
        {
            bool dataflag = false;
            string carcode = string.Empty;
            carcode = context.Request.Form["carcode"].ToString();
            if (string.IsNullOrEmpty(carcode))
            {
                carcode = Guid.NewGuid().ToString();
                dataflag = true;
            }
            string cartype = context.Request.Form["cartype"].ToString();
            decimal budget = decimal.Parse(context.Request.Form["budget"]);
            string describe = context.Request.Form["describe"];
            string location = context.Request.Form["location"].ToString();
            string pic = context.Request.Form["imgfile"];
            int number = int.Parse(context.Request.Form["number"]);
            int seq = int.Parse(context.Request.Form["seq"]);
            string citycode = context.Request.Form["citycode"].ToString();
            string state = context.Request.Form["state"].ToString();
            CarDAL dal = new CarDAL();
            CarInfo model = new CarInfo();
            model.Carcode = carcode;
            model.Cartype = cartype;
            model.Citycode = citycode;
            model.Location = location;
            model.Number = number;
            model.Budget = budget;
            model.Seq = seq;
            model.Describe = describe;
            model.Pic = pic;
            model.State = state;
            int res = -1;
            if (dataflag)
            {
                res = dal.AddCar(model);
            }
            else
            {
                res = dal.UpdateCar(model);
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