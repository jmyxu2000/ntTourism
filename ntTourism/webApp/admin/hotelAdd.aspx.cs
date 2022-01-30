using DAL;
using Model;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class admin_hotelAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            CityDAL dal = new CityDAL();
            citycode.DataSource = dal.GetCTList();
            citycode.DataTextField = "cityname";
            citycode.DataValueField = "citycode";
            citycode.DataBind();
        }
        if (Request.QueryString["getid"] != null)
        {
            string hotelcode = Request.QueryString["getid"].ToString();
            HotelDAL dal = new HotelDAL();
            DataSet ds = dal.GetList(hotelcode);
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                HidHotelCode.Value = ds.Tables[0].Rows[0]["hotelcode"].ToString();
                hidImgFile.Value = ds.Tables[0].Rows[0]["hotelpic"].ToString();
                hotelname.Value = ds.Tables[0].Rows[0]["hotelname"].ToString();
                citycode.SelectedValue = ds.Tables[0].Rows[0]["citycode"].ToString();
                roomnum.Value = ds.Tables[0].Rows[0]["roomNum"].ToString();
                seq.Value = ds.Tables[0].Rows[0]["seq"].ToString();
                describe.InnerText = ds.Tables[0].Rows[0]["describe"].ToString();
            }
        }
        

    }
    protected void btnImgUp_Click(object sender, EventArgs e)
    {
        try
        {
            string filename = this.FileUpload1.FileName;
            string filepath = Server.MapPath("hotelImage");
            string newfile = DateTime.Now.ToString("yyyyMMddhhssmm") + filename;
            this.FileUpload1.SaveAs(filepath + "\\" + newfile);
            lbl_result.Text = "upload success";
            hidImgFile.Value = newfile;
        }
        catch
        {
            lbl_result.Text = "upload fail";
        }
    }
}