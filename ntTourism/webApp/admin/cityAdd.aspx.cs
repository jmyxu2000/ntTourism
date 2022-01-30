using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using Model;
using System.Data;

public partial class admin_cityAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["getid"] != null)
        {
            string citycode = Request.QueryString["getid"].ToString();
            CityDAL dal = new CityDAL();
            DataSet ds = dal.GetList(citycode);
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                Hidcitycode.Value = ds.Tables[0].Rows[0]["citycode"].ToString();
                cityname.Value = ds.Tables[0].Rows[0]["cityname"].ToString();
                seq.Value = ds.Tables[0].Rows[0]["seq"].ToString();
            }

        }
    }
}