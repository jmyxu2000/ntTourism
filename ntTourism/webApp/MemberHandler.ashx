<%@ WebHandler Language="C#" Class="MemberHandler" %>

using System;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web.SessionState;
using DAL;
using Model;

public class MemberHandler : IHttpHandler,IRequiresSessionState {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
       
        string action = context.Request.Form["action"].ToString();
            if (action.ToLower() == "login")
            {
                string loginname = context.Request.Form["loginname"];
                string pwd = context.Request.Form["password"];
                MemberInfo model = new UserDAL().UserLogin(loginname, pwd);

                if (model != null)
                {
                    HttpContext.Current.Session["member"] = model;
                    context.Response.Write("1");    //login success
                }
                else
                {
                    context.Response.Write("0");      //fail
                }
               
            }
        
            if (action.ToLower() == "register")
            {
                //"loginname": loginname, "password": password, "name": name, "phone": phone, "gender": gender, "action": "register"
                
                
                
                string loginname = context.Request.Form["loginname"].ToString();
                string password = context.Request.Form["password"].ToString();
                string name = context.Request.Form["name"].ToString();
                string phone = context.Request.Form["phone"].ToString();
                string gender = context.Request.Form["gender"].ToString();

                
                
                MemberInfo model = new MemberInfo();
                model.mname = loginname;
                model.mpwd = password;
                model.truename = name;
                model.phone = phone;
                model.gender = gender;

                MemberDAL dal = new MemberDAL();
                //int res = dal.AddMember(model);
                int res =dal.ChangeMember(loginname);
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
    
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}