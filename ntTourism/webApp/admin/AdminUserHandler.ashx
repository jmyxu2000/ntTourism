<%@ WebHandler Language="C#" Class="AdminUserHandler" %>

using System;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using DAL;
using Model;

public class AdminUserHandler : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        string action = context.Request.Form["action"].ToString();

        if (action.ToLower() == "del")
        {
            string id = context.Request.Form["id"].ToString();

            AdminDAL dal = new AdminDAL();
            int res = dal.DelAdmin(id);

            if (res > 0)
            {
                context.Response.Write("1");
            }
            else
            {
                context.Response.Write("0");
            }
        }

        if (action.ToLower() == "adminadd")
        {


            string userid = Guid.NewGuid().ToString();
            string account = context.Request.Form["account"].ToString();
            string password = context.Request.Form["password"].ToString();

            AdminDAL dal = new AdminDAL();
            AdminInfo model = new AdminInfo();
            model.Userid = userid;
            model.Account = account;
            model.Password = password;


            int res = dal.AddAdmin(model);
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

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}