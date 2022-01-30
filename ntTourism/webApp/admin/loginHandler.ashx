<%@ WebHandler Language="C#" CodeBehind="loginHandler.ashx.cs" Class="ntTourism.admin.loginHandler" %>
using System;
using System.Collections.Generic;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web.SessionState;
using DAL;
using Model;
namespace ntTourism.admin
{
    /// <summary>
    /// Summary description for loginHandler
    /// </summary>
    public class loginHandler : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string account = context.Request.Form["account"];
            string pwd = context.Request.Form["pwd"];
            string verification = context.Request.Form["verification"];
            string ranStr = HttpContext.Current.Session["random"].ToString();
            if (ranStr.Equals(verification))
            {
                DataSet ds = new AdminDAL().AdminUserLogin(account, pwd);

                if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    AdminInfo model = new AdminInfo();
                    model.Userid = ds.Tables[0].Rows[0]["userid"].ToString();
                    model.Account = ds.Tables[0].Rows[0]["account"].ToString();
                    model.Password = ds.Tables[0].Rows[0]["password"].ToString();
                    HttpContext.Current.Session["Admin"] = model;
                    
                    context.Response.Write("1");   
                }
                else
                {
                    context.Response.Write("0");    
                }
            }
            else
            {
                context.Response.Write("-99");      
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
}