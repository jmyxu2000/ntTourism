<%@ WebHandler Language="C#" Class="ContactUsHandler" %>
using System;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using DAL;
using Model;

public class ContactUsHandler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string action = context.Request.Form["action"].ToString();

        if (action.ToLower() == "del")
        {
            string id = context.Request.Form["id"].ToString();

            ContactUsDAL dal = new ContactUsDAL();
            int res = dal.DelContactUs(id);

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