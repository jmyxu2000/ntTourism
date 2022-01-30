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
    public class DestinationDAL
    {
        public DataSet GetList(DestinationInfo model)
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
                sql.AppendLine("select A.*,B.cityname from Destination(nolock) A left join city(nolock) B on A.citycode = B.citycode");
                if (!string.IsNullOrEmpty(model.Destinationname))
                {
                    sql.AppendLine("where A.destinationname like '%" + model.Destinationname + "%'");
                }
                sql.AppendLine("order by seq");
                SqlCommand cmd = new SqlCommand(sql.ToString(), con);

                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.Fill(ds);
            }
            return ds;
        }

        public DataSet GetList(string destinationcode)
        {
            DataSet ds = new DataSet();
            using (SqlConnection con = new SqlConnection())
            {
                con.ConnectionString = ConfigurationManager.AppSettings["connstr"].ToString();
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }
                SqlCommand cmd = new SqlCommand("select * from Destination where destinationcode='" + destinationcode + "'", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.Fill(ds);
            }
            return ds;
        }


        public DataSet GetRandomDestination()
        {
            string sql = "select top 3 * from Destination(nolock) order by NEWID()";
            return SqlDataProvider.GetResultBySql(sql);
        }

        public DataSet GetDestinationList(string citycode)
        {
            DataSet ds = new DataSet();
            using (SqlConnection con = new SqlConnection())
            {
                con.ConnectionString = ConfigurationManager.AppSettings["connstr"].ToString();
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }

                SqlCommand cmd = new SqlCommand("select A.*,B.cityname from Destination(nolock) A left join city(nolock) B on A.citycode = B.citycode where A.citycode='" + citycode + "' order by seq", con);

                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.Fill(ds);
            }
            return ds;
        }

       

        public int DelDestination(string id)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.AppSettings["connstr"].ToString();
            if (con.State == ConnectionState.Closed)
            {
                con.Open();

            }
            string sqlstr = "delete from Destination where destinationcode='" + id + "'";
            SqlCommand cmd = new SqlCommand(sqlstr, con);
            int res = cmd.ExecuteNonQuery();
            return res;
        }

      
        public int AddDestination(DestinationInfo model)
        {
            string sqlstr = "insert into Destination(destinationcode, destinationname,citycode,needmoney,describe, seq,pic)values(@destinationcode, @destinationname,@citycode,@needmoney,@describe, @seq,@pic)";

            int res = SqlDataProvider.ExecuteBySql(sqlstr,
                SqlDataProvider.CreateSqlParameter("@destinationcode", SqlDbType.VarChar, model.Destinationcode),
                SqlDataProvider.CreateSqlParameter("@destinationname", SqlDbType.VarChar, model.Destinationname),
                SqlDataProvider.CreateSqlParameter("@citycode", SqlDbType.VarChar, model.Citycode),
                SqlDataProvider.CreateSqlParameter("@needmoney", SqlDbType.Money, model.Needmoney),
                SqlDataProvider.CreateSqlParameter("@describe", SqlDbType.VarChar, model.Describe),
                SqlDataProvider.CreateSqlParameter("@seq", SqlDbType.VarChar, model.Seq),
                SqlDataProvider.CreateSqlParameter("@pic", SqlDbType.VarChar, model.Pic)
                );
            return res;
        }

        public int UpdateDestination(DestinationInfo model)
        {
            string sqlstr = "update Destination set destinationname=@destinationname, citycode=@citycode, needmoney =@needmoney, describe=@describe, seq=@seq, pic =@pic where destinationcode =@destinationcode";
            int res = SqlDataProvider.ExecuteBySql(sqlstr,
                
                SqlDataProvider.CreateSqlParameter("@destinationname", SqlDbType.VarChar, model.Destinationname),
                SqlDataProvider.CreateSqlParameter("@citycode", SqlDbType.VarChar, model.Citycode),
                SqlDataProvider.CreateSqlParameter("@needmoney", SqlDbType.Money, model.Needmoney),
                SqlDataProvider.CreateSqlParameter("@describe", SqlDbType.VarChar, model.Describe),
                SqlDataProvider.CreateSqlParameter("@seq", SqlDbType.VarChar, model.Seq),
                SqlDataProvider.CreateSqlParameter("@pic", SqlDbType.VarChar, model.Pic),
                SqlDataProvider.CreateSqlParameter("@destinationcode", SqlDbType.VarChar, model.Destinationcode)
                );
            return res;
        }

        public DestinationInfo GetDestinationDetails(string destinationcode)
        {
            DataSet ds = new DataSet();
            string sqlstr = "select * from Destination(nolock) where destinationcode=@destinationcode";
            ds = SqlDataProvider.GetResultBySql(sqlstr,
                SqlDataProvider.CreateSqlParameter("@destinationcode", SqlDbType.VarChar, destinationcode));
            DestinationInfo model = new DestinationInfo();
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                model.Destinationcode = ds.Tables[0].Rows[0]["destinationcode"].ToString();
                model.Destinationname = ds.Tables[0].Rows[0]["destinationname"].ToString();
                model.Citycode = ds.Tables[0].Rows[0]["citycode"].ToString();
                model.Needmoney = decimal.Parse(ds.Tables[0].Rows[0]["needmoney"].ToString());
                model.Describe = ds.Tables[0].Rows[0]["describe"].ToString();
                model.Seq = int.Parse(ds.Tables[0].Rows[0]["seq"].ToString());
                model.Pic = ds.Tables[0].Rows[0]["pic"].ToString();
                
            }
            return model;
        }
    }
}
