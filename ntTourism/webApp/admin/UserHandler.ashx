<%@ WebHandler Language="C#" Class="UserHandler" %>

using System;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using DAL;
using Model;

public class UserHandler : IHttpHandler {

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";

        string action = context.Request.Form["action"].ToString();

        if (action.ToLower() == "del")
        {
            string id = context.Request.Form["id"].ToString();

            MemberDAL dal = new MemberDAL();
            int res = dal.DelUser(id);

            if (res > 0)
            {
                context.Response.Write("1");
            }
            else
            {
                context.Response.Write("0");
            }
        }

        if (action.ToLower() == "useradd")
        {
            
            string loginname = context.Request.Form["loginname"].ToString();
            string password = context.Request.Form["password"].ToString();
            string name = context.Request.Form["name"].ToString();
            string phone = context.Request.Form["phone"].ToString();
            string gender = context.Request.Form["gender"].ToString();
            
            MemberDAL dal = new MemberDAL();
            MemberInfo model = new MemberInfo();

            model.mname = loginname;
            model.mpwd = password;
            model.truename = name;
            model.phone = phone;
            model.gender = gender;

            int res = dal.ChangeMember(loginname);
            if (res > 0)
            {
                context.Response.Write("-99");
            }
            else
            {
                res = dal.AddMember(model);
                if (res > 0)
                {
                    model = dal.GetMember(loginname);
                    HttpContext.Current.Session["member"] = model;
                    context.Response.Write("1");
                }
                else
                {
                    context.Response.Write("0");
                }
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