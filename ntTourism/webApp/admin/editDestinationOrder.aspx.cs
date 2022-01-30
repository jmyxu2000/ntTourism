using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using Model;
using System.Data;
public partial class admin_editDestinationOrder : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["getid"] != null)
        {
            string ordercode = Request.QueryString["getid"].ToString();
            DestinationOrderDAL dal = new DestinationOrderDAL();
            DataSet ds = dal.GetList(ordercode);
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                Hidordercode.Value = ds.Tables[0].Rows[0]["ordercode"].ToString();
                state.Value = ds.Tables[0].Rows[0]["state"].ToString();

            }

        }
    }
}