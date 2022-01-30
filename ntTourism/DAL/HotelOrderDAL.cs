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
    public class HotelOrderDAL
    {
        public int AddHotelOrder(HotelOrderInfo model)
        {
            string sqlstr = "insert into hotelOrder(roomcode, membercode, orderprice, state, begindate, enddate, CardNumber, cvv, CardholderName, ValidThru, adultNum)values(@roomcode, @membercode, @orderprice, @state, @begindate, @enddate,@CardNumber, @cvv, @CardholderName, @ValidThru,  @adultNum)";

            int res = SqlDataProvider.ExecuteBySql(sqlstr,
                SqlDataProvider.CreateSqlParameter("@roomcode", SqlDbType.VarChar, model.roomcode),
                SqlDataProvider.CreateSqlParameter("@membercode", SqlDbType.VarChar, model.membercode),
                SqlDataProvider.CreateSqlParameter("@orderprice", SqlDbType.VarChar, model.orderprice),
                SqlDataProvider.CreateSqlParameter("@state", SqlDbType.VarChar, model.state),
                SqlDataProvider.CreateSqlParameter("@begindate", SqlDbType.VarChar, model.begindate),
                SqlDataProvider.CreateSqlParameter("@enddate", SqlDbType.VarChar, model.enddate),
                SqlDataProvider.CreateSqlParameter("@CardNumber", SqlDbType.VarChar, model.cardnumber),
                SqlDataProvider.CreateSqlParameter("@cvv", SqlDbType.VarChar, model.cvv),
                SqlDataProvider.CreateSqlParameter("@CardholderName", SqlDbType.VarChar, model.cardholdername),
                SqlDataProvider.CreateSqlParameter("@ValidThru", SqlDbType.VarChar, model.validthru),
                SqlDataProvider.CreateSqlParameter("@adultNum", SqlDbType.VarChar, model.adultnum));
            return res;
        }

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
                sql.AppendLine("select t1.*, t2.roomname, t3.mname from hotelOrder t1 left join room t2 on t1.roomcode = t2.roomcode left join memberinfo t3 on t1.membercode = t3.code");
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

        public DataSet GetList(string ordercode)
        {
            DataSet ds = new DataSet();
            using (SqlConnection con = new SqlConnection())
            {
                con.ConnectionString = ConfigurationManager.AppSettings["connstr"].ToString();
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }
                SqlCommand cmd = new SqlCommand("select * from hotelOrder where ordercode='" + ordercode + "'", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.Fill(ds);
            }
            return ds;
        }

        public int EditState(HotelOrderInfo model)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.AppSettings["connstr"].ToString();
            if (con.State == ConnectionState.Closed)
            {
                con.Open();

            }
            string sqlstr = "update hotelOrder set state = '"+ model.state+"' where ordercode = '"+ model.ordercode+"'";
            SqlCommand cmd = new SqlCommand(sqlstr, con);
            int res = cmd.ExecuteNonQuery();
            return res;
        }


    }
}
