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
    public class CarDAL
    {
        public DataSet GetList(CarInfo model)
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
                sql.AppendLine("select A.*,B.cityname from car(nolock) A left join city(nolock) B on A.citycode = B.citycode");
                if (!string.IsNullOrEmpty(model.Cartype))
                {
                    sql.AppendLine("where A.cartype like '%" + model.Cartype + "%'");
                }
                sql.AppendLine("order by seq");
                SqlCommand cmd = new SqlCommand(sql.ToString(), con);

                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.Fill(ds);
            }
            return ds;
        }

        public DataSet GetCarRentalList(string carcode)
        {
            DataSet ds = new DataSet();
            using (SqlConnection con = new SqlConnection())
            {
                con.ConnectionString = ConfigurationManager.AppSettings["connstr"].ToString();
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }
                SqlCommand cmd = new SqlCommand("select * from car where carcode='" + carcode + "'", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.Fill(ds);
            }
            return ds;
        }

        public DataSet GetRandomCar()
        {
            string sql = "select top 3 * from car(nolock) order by NEWID()";
            return SqlDataProvider.GetResultBySql(sql);
        }

        public DataSet GetList(string citycode)
        {
            string sqlstr = "select * from car(nolock) where citycode = @citycode order by seq";
            return SqlDataProvider.GetResultBySql(sqlstr, SqlDataProvider.CreateSqlParameter("@citycode", SqlDbType.VarChar, citycode));
        }
       
      

        
        public DataSet GetCarList(string citycode)
        {
            DataSet ds = new DataSet();
            using (SqlConnection con = new SqlConnection())
            {
                con.ConnectionString = ConfigurationManager.AppSettings["connstr"].ToString();
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }

                SqlCommand cmd = new SqlCommand("select A.*,B.cityname from car(nolock) A left join city(nolock) B on A.citycode = B.citycode where A.citycode='" + citycode + "' order by seq", con);

                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.Fill(ds);
            }
            return ds;
        }
       
        public int DelCar(string id)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.AppSettings["connstr"].ToString();
            if (con.State == ConnectionState.Closed)
            {
                con.Open();

            }
            string sqlstr = "delete from car where carcode='" + id + "'";
            SqlCommand cmd = new SqlCommand(sqlstr, con);
            int res = cmd.ExecuteNonQuery();
            return res;
        }

       
        public int AddCar(CarInfo model)
        {
            string sqlstr = "insert into car(carcode,cartype,budget,describe,location,pic,number,seq,citycode,state)values(@carcode, @cartype, @budget, @describe, @location, @pic, @number, @seq, @citycode,@state)";

            int res = SqlDataProvider.ExecuteBySql(sqlstr,
                SqlDataProvider.CreateSqlParameter("@carcode", SqlDbType.VarChar, model.Carcode),
                SqlDataProvider.CreateSqlParameter("@cartype", SqlDbType.VarChar, model.Cartype),
                SqlDataProvider.CreateSqlParameter("@budget", SqlDbType.Money, model.Budget),
                SqlDataProvider.CreateSqlParameter("@describe", SqlDbType.VarChar, model.Describe),
                SqlDataProvider.CreateSqlParameter("@location", SqlDbType.VarChar, model.Location),
                SqlDataProvider.CreateSqlParameter("@pic", SqlDbType.VarChar, model.Pic),
                SqlDataProvider.CreateSqlParameter("@number", SqlDbType.Int, model.Number),
                SqlDataProvider.CreateSqlParameter("@seq", SqlDbType.Int, model.Seq),
                SqlDataProvider.CreateSqlParameter("@citycode", SqlDbType.VarChar, model.Citycode),
                SqlDataProvider.CreateSqlParameter("@state", SqlDbType.VarChar, model.State));
                
            return res;
        }

        public int UpdateCar(CarInfo model)
        {
           
            string sqlstr = "update car set cartype=@cartype, budget=@budget, describe =@describe, location=@location, pic=@pic, number=@number, seq =@seq, citycode=@citycode, state=@state where carcode =@carcode";
            int res = SqlDataProvider.ExecuteBySql(sqlstr,
                SqlDataProvider.CreateSqlParameter("@cartype", SqlDbType.VarChar, model.Cartype),
                SqlDataProvider.CreateSqlParameter("@budget", SqlDbType.Money, model.Budget),
                SqlDataProvider.CreateSqlParameter("@describe", SqlDbType.VarChar, model.Describe),
                SqlDataProvider.CreateSqlParameter("@location", SqlDbType.VarChar, model.Location),
                SqlDataProvider.CreateSqlParameter("@pic", SqlDbType.VarChar, model.Pic),
                SqlDataProvider.CreateSqlParameter("@number", SqlDbType.Int, model.Number),
                SqlDataProvider.CreateSqlParameter("@seq", SqlDbType.Int, model.Seq),
                SqlDataProvider.CreateSqlParameter("@citycode", SqlDbType.VarChar, model.Citycode),
                SqlDataProvider.CreateSqlParameter("@state", SqlDbType.VarChar, model.State),
                SqlDataProvider.CreateSqlParameter("@carcode", SqlDbType.VarChar, model.Carcode));
            return res;
        }

        public CarInfo GetCarDetails(string carcode)
        {
            DataSet ds = new DataSet();
            string sqlstr = "select * from car(nolock) where carcode=@carcode";
            ds = SqlDataProvider.GetResultBySql(sqlstr,
                SqlDataProvider.CreateSqlParameter("@carcode", SqlDbType.VarChar, carcode));
            CarInfo model = new CarInfo();
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                model.Carcode = ds.Tables[0].Rows[0]["carcode"].ToString();
                model.Cartype = ds.Tables[0].Rows[0]["cartype"].ToString();
                model.Budget = decimal.Parse(ds.Tables[0].Rows[0]["budget"].ToString());
                model.Describe = ds.Tables[0].Rows[0]["describe"].ToString();
                model.Location = ds.Tables[0].Rows[0]["location"].ToString();
                model.Pic = ds.Tables[0].Rows[0]["pic"].ToString();
                model.Number = int.Parse(ds.Tables[0].Rows[0]["number"].ToString());
                model.Seq = int.Parse(ds.Tables[0].Rows[0]["seq"].ToString());
                model.Citycode = ds.Tables[0].Rows[0]["citycode"].ToString();




                model.State = ds.Tables[0].Rows[0]["state"].ToString();
            }
            return model;
        }
        //public DataSet GetCarDetails(string carcode)
        //{
        //    DataSet ds = new DataSet();
        //    string sqlstr = "select t1.* from car(nolock) t1 where carcode=@carcode";
        //    ds = SqlDataProvider.GetResultBySql(sqlstr,
        //        SqlDataProvider.CreateSqlParameter("@hotelcode", SqlDbType.VarChar, carcode));
        //    return ds;
        //}
    }
}
