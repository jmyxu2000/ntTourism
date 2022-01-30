<%@ WebHandler Language="C#" CodeBehind="ContactHandler.ashx.cs" Class="ntTourism.ContactHandler" %>
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.Data;

namespace ntTourism
{
    /// <summary>
    /// Summary description for ContactHandler
    /// </summary>
    public class ContactHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string username = context.Request.Form["username"];
            string useremail = context.Request.Form["useremail"];
            string usermobile = context.Request.Form["usermobile"];
            string usermsg = context.Request.Form["usermsg"];

            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.AppSettings["connstr"].ToString();
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            string sqlstr = "insert into contactus ([code], [name], [email], [mobile], [subject]) values (NEWID(),'" +username+  "','" + useremail+ "','" +usermobile+ "','" +usermsg+"')";
            SqlCommand cmd = new SqlCommand(sqlstr, con);
            int res = cmd.ExecuteNonQuery();
            
            context.Response.Write(res.ToString());
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