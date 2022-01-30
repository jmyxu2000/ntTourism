using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DAL;
using Model;
public partial class MemberCenter : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
        MemberInfo model = (MemberInfo)Session["member"];
        string membercode = model.code.ToString();

        DataSet hotelDs = new DataSet();
        hotelDs = new MemberDAL().GetHotelOrderList(membercode);
        rpt_hotelorder.DataSource = hotelDs;
        rpt_hotelorder.DataBind();

        DataSet carDs = new DataSet();
        carDs = new MemberDAL().GetCarOrderList(membercode);
        rpt_carorder.DataSource = carDs;
        rpt_carorder.DataBind();

        DataSet destinationDs = new DataSet();
        destinationDs = new MemberDAL().GetDestinationOrderList(membercode);
        rpt_destinationorder.DataSource = destinationDs;
        rpt_destinationorder.DataBind();



    }
}