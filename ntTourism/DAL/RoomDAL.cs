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
    public class RoomDAL
    {
        public DataSet GetList(RoomInfo model)
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
                sql.AppendLine("select A.*,B.hotelname from room(nolock) A left join hotel(nolock) B on A.hotelcode = B.hotelcode");
                if (!string.IsNullOrEmpty(model.Roomname))
                {
                    sql.AppendLine("where A.roomname like '%" + model.Roomname + "%'");
                }

                sql.AppendLine("order by seq");
                SqlCommand cmd = new SqlCommand(sql.ToString(), con);

                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.Fill(ds);
            }
            return ds;
        }

        public DataSet GetList(string roomcode)
        {
            DataSet ds = new DataSet();
            using (SqlConnection con = new SqlConnection())
            {
                con.ConnectionString = ConfigurationManager.AppSettings["connstr"].ToString();
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }
                SqlCommand cmd = new SqlCommand("select * from room where roomcode='" + roomcode + "'", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.Fill(ds);
            }
            return ds;
        }
        
       
        public DataSet GetRoomList(string hotelcode)
        {
            DataSet ds = new DataSet();
            string sqlstr = "select A.*,B.hotelname from room(nolock) A left join hotel(nolock) B on A.hotelcode = B.citycode where A.hotelcode=@hotelcode order by seq";
            ds = SqlDataProvider.GetResultBySql(sqlstr,
                SqlDataProvider.CreateSqlParameter("@hotelcode", SqlDbType.VarChar, hotelcode)
               );
            return ds;
        }

        public DataSet GetRandomRoom()
        {
            string sql = "select top 3 * from room(nolock) order by NEWID()";
            return SqlDataProvider.GetResultBySql(sql);
        }

        public int DelRoom(string id)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.AppSettings["connstr"].ToString();
            if (con.State == ConnectionState.Closed)
            {
                con.Open();

            }
            string sqlstr = "delete from room where roomcode='" + id + "'";
            SqlCommand cmd = new SqlCommand(sqlstr, con);
            int res = cmd.ExecuteNonQuery();
            return res;
        }

        
        public int AddRoom(RoomInfo model)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.AppSettings["connstr"].ToString();
            if (con.State == ConnectionState.Closed)
            {
                con.Open();

            }

            string sqlstr = "insert into room(roomcode,roomname,hotelcode,roomtype,price,describe,seq)values('" + model.Roomcode + "','" + model.Roomname + "','" + model.Hotelcode + "','" + model.Roomtype + "'," + model.Price + ",'" + model.Describe + "'," + model.Seq + ")";
            SqlCommand cmd = new SqlCommand(sqlstr, con);
            int res = cmd.ExecuteNonQuery();
            return res;
        }

        public int UpdateRoom(RoomInfo model)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.AppSettings["connstr"].ToString();
            if (con.State == ConnectionState.Closed)
            {
                con.Open();

            }
            string sqlstr = "update room set roomname='" + model.Roomname + "', hotelcode='" + model.Hotelcode + "', roomtype ='" + model.Roomtype + "', price='" + model.Price + "', describe='" + model.Describe + "', seq='" + model.Seq + "', state = '"+ model.State+"' where roomcode ='" + model.Roomcode + "'";
            SqlCommand cmd = new SqlCommand(sqlstr, con);
            int res = cmd.ExecuteNonQuery();
            return res;
        }

        public RoomInfo GetRoomDetails(string roomcode)
        {
            DataSet ds = new DataSet();
            string sqlstr = "select * from room(nolock) where roomcode=@roomcode";
            ds = SqlDataProvider.GetResultBySql(sqlstr,
                SqlDataProvider.CreateSqlParameter("@roomcode", SqlDbType.VarChar, roomcode));
            RoomInfo model = new RoomInfo();
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                model.Roomcode = ds.Tables[0].Rows[0]["roomcode"].ToString();
                model.Roomname = ds.Tables[0].Rows[0]["roomname"].ToString();
                model.Hotelcode = ds.Tables[0].Rows[0]["hotelcode"].ToString();
                model.Roomtype = ds.Tables[0].Rows[0]["roomtype"].ToString();
                model.Price = decimal.Parse(ds.Tables[0].Rows[0]["price"].ToString());
                model.Describe = ds.Tables[0].Rows[0]["describe"].ToString();
                model.Seq = int.Parse(ds.Tables[0].Rows[0]["seq"].ToString());
                model.State = ds.Tables[0].Rows[0]["state"].ToString();
            }
            return model;
        }
    }
}
