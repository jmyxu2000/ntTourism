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
    public class HotelDAL
    {

        public DataSet GetList(HotelInfo model)
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
                sql.AppendLine("select A.*,B.cityname from hotel(nolock) A left join city(nolock) B on A.citycode = B.citycode");
                if (!string.IsNullOrEmpty(model.Hotelname))
                {
                    sql.AppendLine("where A.hotelname like '%" + model.Hotelname + "%'");
                }
                sql.AppendLine("order by seq");

                SqlCommand cmd = new SqlCommand(sql.ToString(), con);
                
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.Fill(ds);
            }
            return ds;
        }

        public DataSet GetList(string hotelcode){

            DataSet ds = new DataSet();
            using (SqlConnection con = new SqlConnection())
            {
                con.ConnectionString = ConfigurationManager.AppSettings["connstr"].ToString();
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }
                SqlCommand cmd = new SqlCommand("select * from hotel where hotelcode='" + hotelcode + "'", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.Fill(ds);
            }
            return ds;
        }

        public DataSet GetHotelList(){
                DataSet ds = new DataSet();
                string sql = ("select * from hotel(nolock) order by seq");
                ds = SqlDataProvider.GetResultBySql(sql);
                return ds;
            }
           
           
        
       
        public DataSet GetRandomHotel()
        {
            string sql = "select top 3 * from hotel(nolock) order by NEWID()";
            return SqlDataProvider.GetResultBySql(sql);
        }

       
        public DataSet GetHotelList(string citycode)
        {
            DataSet ds = new DataSet();
            using (SqlConnection con = new SqlConnection())
            {
                con.ConnectionString = ConfigurationManager.AppSettings["connstr"].ToString();
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }

                SqlCommand cmd = new SqlCommand("select A.*,B.cityname from hotel(nolock) A left join city(nolock) B on A.citycode = B.citycode where A.citycode='" + citycode + "' order by seq", con);

                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.Fill(ds);
            }
            return ds;
        }
        
        public int DelHotel(string id)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.AppSettings["connstr"].ToString();
            if (con.State == ConnectionState.Closed)
            {
                con.Open();

            }
            string sqlstr = "delete from hotel where hotelcode='" + id + "'";
            SqlCommand cmd = new SqlCommand(sqlstr, con);
            int res = cmd.ExecuteNonQuery();
            return res;
        }

       
        public int AddHotel(HotelInfo model)
        {            
            string sqlstr = "insert into hotel(hotelcode,citycode,hotelname,describe,roomNum,hotelpic,seq)values(@hotelcode,@citycode,@hotelname,@describe,@roomnumber,@hotelpic,@seq)";
            int res = SqlDataProvider.ExecuteBySql(sqlstr,
               SqlDataProvider.CreateSqlParameter("@hotelcode", SqlDbType.VarChar, model.Hotelcode),
               SqlDataProvider.CreateSqlParameter("@citycode", SqlDbType.VarChar, model.Citycode),
               SqlDataProvider.CreateSqlParameter("@hotelname", SqlDbType.VarChar, model.Hotelname),
               SqlDataProvider.CreateSqlParameter("@describe", SqlDbType.VarChar, model.Describe),
               SqlDataProvider.CreateSqlParameter("@roomnumber", SqlDbType.Int, model.RoomNum),
               SqlDataProvider.CreateSqlParameter("@hotelpic", SqlDbType.VarChar, model.Hotelpic),
               SqlDataProvider.CreateSqlParameter("@seq", SqlDbType.VarChar, model.Seq)
               
               );
            return res;
        }

        public int UpdateHotel(HotelInfo model)
        {
            string sqlstr = "update hotel set citycode=@citycode, hotelname=@hotelname, describe =@describe, roomNum=@roomnumber, hotelpic=@hotelpic,seq=@seq where hotelcode =@hotelcode";
            int res = SqlDataProvider.ExecuteBySql(sqlstr,
                SqlDataProvider.CreateSqlParameter("@citycode", SqlDbType.VarChar, model.Citycode),
                SqlDataProvider.CreateSqlParameter("@hotelname", SqlDbType.VarChar, model.Hotelname),
                SqlDataProvider.CreateSqlParameter("@describe", SqlDbType.VarChar, model.Describe),
                SqlDataProvider.CreateSqlParameter("@roomnumber", SqlDbType.Int, model.RoomNum),
                SqlDataProvider.CreateSqlParameter("@hotelpic", SqlDbType.VarChar, model.Hotelpic),
                SqlDataProvider.CreateSqlParameter("@seq", SqlDbType.VarChar, model.Seq),
                SqlDataProvider.CreateSqlParameter("@hotelcode", SqlDbType.VarChar, model.Hotelcode)
                );
            return res;
        }

        public DataSet GetHotelDetails(string hotelcode)
        {
            DataSet ds = new DataSet();
            string sqlstr = "select t1.* from hotel(nolock) t1 where hotelcode=@hotelcode";
            ds = SqlDataProvider.GetResultBySql(sqlstr,
                SqlDataProvider.CreateSqlParameter("@hotelcode", SqlDbType.VarChar, hotelcode));
            return ds;
        }
    }
}
