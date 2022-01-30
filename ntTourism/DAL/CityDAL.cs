using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;
using MicroSoft.EnterpriseLibrary.Data;

namespace DAL
{
    public class CityDAL
    {
        public DataSet GetList(CityInfo model)
        {
            DataSet ds = new DataSet();
            StringBuilder sql = new StringBuilder();
            sql.AppendLine("select * from dbo.city(nolock)");
            if (!string.IsNullOrEmpty(model.Cityname))
            {
                sql.AppendLine("where cityname like '%" + model.Cityname + "%' ");
            }
            sql.AppendLine("order by seq");
            ds = SqlDataProvider.GetResultBySql(sql.ToString());
            return ds;
        }

        public DataSet GetCTList()
        {
            DataSet ds = new DataSet();
            string sql = ("select * from city(nolock) order by seq");
            ds = SqlDataProvider.GetResultBySql(sql);
            return ds;
        }

        public DataSet GetList(string citycode)
        {
            DataSet ds = new DataSet();
            using (SqlConnection con = new SqlConnection())
            {
                con.ConnectionString = ConfigurationManager.AppSettings["connstr"].ToString();
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }
                SqlCommand cmd = new SqlCommand("select * from city where citycode='" + citycode + "'", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.Fill(ds);
            }
            return ds;
        }

        public DataSet GetRandomCity()
        {
            string sql = "select top 3 * from city(nolock) order by NEWID()";
            return SqlDataProvider.GetResultBySql(sql);
        }

        public int DelCity(string id)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.AppSettings["connstr"].ToString();
            if (con.State == ConnectionState.Closed)
            {
                con.Open();

            }
            string sqlstr = "delete from city where citycode='" + id + "'";
            SqlCommand cmd = new SqlCommand(sqlstr, con);
            int res = cmd.ExecuteNonQuery();
            return res;
        }

        public int AddCity(CityInfo model)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.AppSettings["connstr"].ToString();
            if (con.State == ConnectionState.Closed)
            {
                con.Open();

            }

            string sqlstr = "insert into city(citycode,cityname,seq)values('" + model.Citycode + "','" + model.Cityname + "'," + model.Seq + ")";
            SqlCommand cmd = new SqlCommand(sqlstr, con);
            int res = cmd.ExecuteNonQuery();
            return res;
        }

        public int UpdateCity(CityInfo model)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.AppSettings["connstr"].ToString();
            if (con.State == ConnectionState.Closed)
            {
                con.Open();

            }
            string sqlstr = "update city set cityname='" + model.Cityname + "',  seq='" + model.Seq + "' where citycode ='" + model.Citycode + "'";
            SqlCommand cmd = new SqlCommand(sqlstr, con);
            int res = cmd.ExecuteNonQuery();
            return res;
        }


    }
}
