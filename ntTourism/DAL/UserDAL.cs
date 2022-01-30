using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Model;
using MicroSoft.EnterpriseLibrary.Data;


namespace DAL
{
    public class UserDAL
    {
        public DataSet GetList()
        {
            DataSet ds = new DataSet();
            using (SqlConnection con = new SqlConnection())
            {
                con.ConnectionString = ConfigurationManager.AppSettings["connstr"].ToString();
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }

                SqlCommand cmd = new SqlCommand("select * from dbo.Users order memberinfo", con);

                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.Fill(ds);
            }
            return ds;
        }
       
        public DataSet GetRandomUser()
        {
            string sql = "select top 3 * from users(nolock) order by NEWID()";
            return SqlDataProvider.GetResultBySql(sql);
        }

        
        public int DelUser(string id)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.AppSettings["connstr"].ToString();
            if (con.State == ConnectionState.Closed)
            {
                con.Open();

            }
            string sqlstr = "delete from membercode where code='" + id + "'";
            SqlCommand cmd = new SqlCommand(sqlstr, con);
            int res = cmd.ExecuteNonQuery();
            return res;
        }

     
        //public int AddUser(MemberInfo model)
        //{
        //    SqlConnection con = new SqlConnection();
        //    con.ConnectionString = ConfigurationManager.AppSettings["connstr"].ToString();
        //    if (con.State == ConnectionState.Closed)
        //    {
        //        con.Open();

        //    }

        //    string sqlstr = "insert into Users(code, loginname, password, firstname, middlename, surname, phone, title)values('" + model.Usercode + "','" + model.Loginname + "','" + model.Password + "','" + model.Firstname + "'," + model.Middlename + ",'" + model.Surname + "'," + model.Phone + "," + model.Title + ")";
        //    SqlCommand cmd = new SqlCommand(sqlstr, con);
        //    int res = cmd.ExecuteNonQuery();
        //    return res;
        //}

        public MemberInfo UserLogin(string loginname,string pwd)
        {
            string sqlstr = "select * from memberinfo where mname=@loginname and mpwd = @password";
            DataSet ds = new DataSet();
            ds= SqlDataProvider.GetResultBySql(sqlstr,
                SqlDataProvider.CreateSqlParameter("@loginname",SqlDbType.VarChar,loginname),
                SqlDataProvider.CreateSqlParameter("@password", SqlDbType.VarChar, pwd));
            MemberInfo model = new MemberInfo();
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                model.code = int.Parse(ds.Tables[0].Rows[0]["code"].ToString());
                model.mname = ds.Tables[0].Rows[0]["mname"].ToString();
                model.mpwd = ds.Tables[0].Rows[0]["mpwd"].ToString();
                model.truename = ds.Tables[0].Rows[0]["truename"].ToString();
                model.phone = ds.Tables[0].Rows[0]["phone"].ToString();
                model.gender = ds.Tables[0].Rows[0]["gender"].ToString();
            }
            return model;
        }
    }
}
