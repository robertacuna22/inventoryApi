using Dapper;
using IMS.Core.Extensions;
using IMS.Repository.Contract;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IMS.Repository.Repository
{
    public class LogsRepository : ILogsRepository
    {


        private readonly IDapperConnection _connection;
        public LogsRepository(IDapperConnection connection)
        {
            _connection = connection;

        }
        public void Create(object parameter)
        {
            using (var db = _connection.DatabaseContent.TryOpen())
            {
                db.Execute("Logs_Create", parameter, commandType: CommandType.StoredProcedure);
            }
        }
    }
}
