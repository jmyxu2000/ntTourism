using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using Model;
using System.Data;

public partial class admin_destinationAdd : System.Web.UI.Page
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
 //"destinationcode": destinationcode, "destinationname": destinationname, "citycode": citycode, "budget": budget, "seq": seq, "describe": describe, "imgfile": imgfile,
        if (Request.QueryString["getid"] != null)
        {
            string destinationcode = Request.QueryString["getid"].ToString();
            DestinationDAL dal = new DestinationDAL();
            DataSet ds = dal.GetList(destinationcode);
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                Hiddestinationcode.Value = ds.Tables[0].Rows[0]["destinationcode"].ToString();
                destinationname.Value = ds.Tables[0].Rows[0]["destinationname"].ToString();
                citycode.SelectedValue = ds.Tables[0].Rows[0]["citycode"].ToString();
                budget.Value = ds.Tables[0].Rows[0]["needmoney"].ToString();
                seq.Value = ds.Tables[0].Rows[0]["seq"].ToString();
                describe.InnerText = ds.Tables[0].Rows[0]["describe"].ToString();
                hidImgFile.Value = ds.Tables[0].Rows[0]["pic"].ToString();
            }
            
        }
    }
    protected void btnImgUp_Click(object sender, EventArgs e)
    {
        try
        {
            string filename = this.FileUpload1.FileName;
            string filepath = Server.MapPath("destinationImage");
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