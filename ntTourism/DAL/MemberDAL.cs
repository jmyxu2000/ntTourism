using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MicroSoft.EnterpriseLibrary.Data;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
namespace DAL
{
    public class MemberDAL
    {
        public DataSet GetList(MemberInfo model)
        {
            DataSet ds = new DataSet();
            using (SqlConnection con = new SqlConnection())
            {
                con.ConnectionString = ConfigurationManager.AppSettings["connstr"].ToString();
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }
                StringBuilder sql = new StringBuilder();
                sql.AppendLine("select * from memberinfo");
                if (!string.IsNullOrEmpty(model.mname))
                {
                    sql.AppendLine("where mname like '%" + model.mname + "%'");
                }
                SqlCommand cmd = new SqlCommand(sql.ToString(), con);

                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.Fill(ds);
            }
            return ds;
        }

        public DataSet GetList(string code)
        {
           
           
                DataSet ds = new DataSet();
                using (SqlConnection con = new SqlConnection())
                {
                    con.ConnectionString = ConfigurationManager.AppSettings["connstr"].ToString();
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();

                    }
                    SqlCommand cmd = new SqlCommand("select * from memberinfo where code='" + code + "'", con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    sda.Fill(ds);
                }
                return ds;
           
        }

        public int AddMember(MemberInfo model)
        {
            string sqlstr = "insert into memberinfo(mname, mpwd, truename, phone, gender)values(@mname, @mpwd, @truename, @phone, @gender)";
            
            int res = SqlDataProvider.ExecuteBySql(sqlstr,
                SqlDataProvider.CreateSqlParameter("@mname",SqlDbType.VarChar,model.mname),
                SqlDataProvider.CreateSqlParameter("@mpwd", SqlDbType.VarChar, model.mpwd),
                SqlDataProvider.CreateSqlParameter("@truename", SqlDbType.VarChar, model.truename),
                SqlDataProvider.CreateSqlParameter("@phone", SqlDbType.VarChar, model.phone),
                SqlDataProvider.CreateSqlParameter("@gender", SqlDbType.VarChar, model.gender));
            return res;
        }

        public int UpdateMember(MemberInfo model)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.AppSettings["connstr"].ToString();
            if (con.State == ConnectionState.Closed)
            {
                con.Open();

            }
            string sqlstr = "update memberinfo set mname='" + model.mname + "', mpwd='" + model.mpwd + "', truename ='" + model.truename + "', phone='" + model.phone + "', gender='" + model.gender + "' where code ='" + model.code + "'";
            SqlCommand cmd = new SqlCommand(sqlstr, con);
            int res = cmd.ExecuteNonQuery();
            return res;
        }

        public MemberInfo GetMember(string loginname)
        {
            string sqlstr = "select * from memberinfo where mname=@mname";

            DataSet ds = SqlDataProvider.GetResultBySql(sqlstr,
                SqlDataProvider.CreateSqlParameter("@mname", SqlDbType.VarChar, loginname));
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

        public int ChangeMember(string loginname)
        {
            string sqlstr = "select count(1) from memberinfo where mname=@mname";

            object obj = SqlDataProvider.GetScalarBySql(sqlstr,
                SqlDataProvider.CreateSqlParameter("@mname", SqlDbType.VarChar, loginname));
            return Convert.ToInt32(obj);
        }

        public int DelUser(string id)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.AppSettings["connstr"].ToString();
            if (con.State == ConnectionState.Closed)
            {
                con.Open();

            }
            string sqlstr = "delete from memberinfo where code='" + id + "'";
            SqlCommand cmd = new SqlCommand(sqlstr, con);
            int res = cmd.ExecuteNonQuery();
            return res;
        }

        public DataSet GetHotelOrderList (string membercode)
        {
            string sqlstr = "select t1.*,t2.roomname,roomtype from dbo.hotelOrder t1 left join dbo.room t2 on t1.roomcode = t2.roomcode where membercode=@membercode";
            DataSet ds = SqlDataProvider.GetResultBySql(sqlstr, 
                SqlDataProvider.CreateSqlParameter("@membercode", SqlDbType.Int, membercode));
            return ds;
        }

        public DataSet GetCarOrderList(string membercode)
        {
            string sqlstr = "select t1.*,t2.cartype,location from dbo.carOrder t1 left join dbo.car t2 on t1.carcode = t2.carcode where membercode=@membercode";
            DataSet ds = SqlDataProvider.GetResultBySql(sqlstr,
                SqlDataProvider.CreateSqlParameter("@membercode", SqlDbType.Int, membercode));
            return ds;
        }

        public DataSet GetDestinationOrderList(string membercode)
        {
            string sqlstr = "select t1.*,t2.destinationname from dbo.destinationOrder t1 left join dbo.Destination t2 on t1.destinationcode = t2.destinationcode where membercode=@membercode";
            DataSet ds = SqlDataProvider.GetResultBySql(sqlstr,
                SqlDataProvider.CreateSqlParameter("@membercode", SqlDbType.Int, membercode));
            return ds;
        }
    }
}
