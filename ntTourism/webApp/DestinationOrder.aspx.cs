using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DAL;
using Model;

public partial class DestinationOrder : System.Web.UI.Page
{
    public DestinationInfo model = new DestinationInfo();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Request.QueryString["getid"] != null)
            {
                string getid = Request.QueryString["getid"].ToString();
                model = new DestinationDAL().GetDestinationDetails(getid);
                hiddestinationcode.Value = model.Destinationcode;


            }
        }

        if (Session["member"] != null)
        {
            MemberInfo model = (MemberInfo)Session["member"];
            membername.Value = model.mname;
            HidMemberCode.Value = model.code.ToString();
        }
        else
        {
            //
            Response.Redirect("MemberLogin.aspx");
        }
    }
}