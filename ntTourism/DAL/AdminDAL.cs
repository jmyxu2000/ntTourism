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
    public class AdminDAL
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

                SqlCommand cmd = new SqlCommand("select * from dbo.adminUser(nolock)", con);

                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.Fill(ds);
            }
            return ds;
        }


      
        public DataSet GetRandomAdmin()
        {
            string sql = "select top 3 * from adminUser(nolock) order by NEWID()";
            return SqlDataProvider.GetResultBySql(sql);
        }
        public int DelAdmin(string id)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.AppSettings["connstr"].ToString();
            if (con.State == ConnectionState.Closed)
            {
                con.Open();

            }
            string sqlstr = "delete from adminUser where userid='" + id + "'";
            SqlCommand cmd = new SqlCommand(sqlstr, con);
            int res = cmd.ExecuteNonQuery();
            return res;
        }

        public int AddAdmin(AdminInfo model)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.AppSettings["connstr"].ToString();
            if (con.State == ConnectionState.Closed)
            {
                con.Open();

            }

            string sqlstr = "insert into adminUser(userid,account,password)values('" + model.Userid + "','" + model.Account + "'," + model.Password + ")";
            SqlCommand cmd = new SqlCommand(sqlstr, con);
            int res = cmd.ExecuteNonQuery();
            return res;
        }

        public DataSet AdminUserLogin(string account, string pwd)
        {
            string sqlstr = "select * from adminUser where account=@account and password = @password";

            return SqlDataProvider.GetResultBySql(sqlstr,
                SqlDataProvider.CreateSqlParameter("@account", SqlDbType.VarChar, account),
                SqlDataProvider.CreateSqlParameter("@password", SqlDbType.VarChar, pwd));
        }

    }
}
