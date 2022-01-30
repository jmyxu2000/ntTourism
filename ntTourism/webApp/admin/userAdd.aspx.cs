using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using Model;
using System.Data;

public partial class userAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["getid"] != null)
        {
            string code = Request.QueryString["getid"];
            MemberDAL dal = new MemberDAL();
            DataSet ds = dal.GetList(code);
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                Hidmembercode.Value = ds.Tables[0].Rows[0]["code"].ToString();
                loginname.Value = ds.Tables[0].Rows[0]["mname"].ToString();
                password.Value = ds.Tables[0].Rows[0]["mpwd"].ToString();
                name.Value = ds.Tables[0].Rows[0]["truename"].ToString();
                phone.Value = ds.Tables[0].Rows[0]["phone"].ToString();
                gender.Value = ds.Tables[0].Rows[0]["gender"].ToString();
            }
        }
    }
}