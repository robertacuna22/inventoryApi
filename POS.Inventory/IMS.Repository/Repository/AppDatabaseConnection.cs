using IMS.Repository.Contract;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IMS.Repository
{
    public class AppDatabaseConnection : IDapperConnection
    {

        private string _databaseConnectionString;

        public AppDatabaseConnection()
        {
            _databaseConnectionString = ConfigurationManager.ConnectionStrings["IMS"].ConnectionString;
        }

        public IDbConnection Database
        {
            get
            {
                return new SqlConnection(_databaseConnectionString);
            }
        }
        public IDbConnection DatabaseContent
        {
            get
            {
                return new SqlConnection(_databaseConnectionString);
            }
        }

    }
}
