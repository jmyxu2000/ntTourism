using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using Model;
using System.Data;

public partial class admin_carAdd : System.Web.UI.Page
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
//"carcode": carcode, "cartype": cartype, "citycode": citycode, "number": number, "location": location, "budget": budget, "seq": seq, "describe": describe, "imgfile": imgfile
        if (Request.QueryString["getid"] != null)
        {
            string carcode = Request.QueryString["getid"].ToString();
            CarDAL dal = new CarDAL();
            DataSet ds = dal.GetCarRentalList(carcode);
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                Hiddencarcode.Value = ds.Tables[0].Rows[0]["carcode"].ToString();
                cartype.Value = ds.Tables[0].Rows[0]["cartype"].ToString();
                citycode.SelectedValue = ds.Tables[0].Rows[0]["citycode"].ToString();
                number.Value = ds.Tables[0].Rows[0]["number"].ToString();
                location.Value = ds.Tables[0].Rows[0]["location"].ToString();
                budget.Value = ds.Tables[0].Rows[0]["budget"].ToString();
                seq.Value = ds.Tables[0].Rows[0]["seq"].ToString();
                describe.InnerText = ds.Tables[0].Rows[0]["describe"].ToString();
                hidImgFile.Value = ds.Tables[0].Rows[0]["pic"].ToString();
                state.Value = ds.Tables[0].Rows[0]["state"].ToString();
            }
        }

    }
    protected void btnImgUp_Click(object sender, EventArgs e)
    {
        try
        {
            string filename = this.FileUpload1.FileName;
            string filepath = Server.MapPath("carImage");
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