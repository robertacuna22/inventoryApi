using Dapper;
using IMS.Core.Extensions;
using IMS.Domain.Model;
using IMS.Repository.Contract;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IMS.Repository.Repository
{
    public class UnitOfMeasuresRepository : IUnitOfMeasuresRepository
    {

        private readonly IDapperConnection _connection;
        public UnitOfMeasuresRepository(IDapperConnection connection)
        {
            _connection = connection;

        }
        public void Delete(object parameter)
        {
            using (var db = _connection.DatabaseContent.TryOpen())
            {
                db.Execute("Measures_Delete", parameter, commandType: CommandType.StoredProcedure);
            }
        }

        public List<Measures> Get()
        {
            using (var db = _connection.DatabaseContent.TryOpen())
            {
                var result = db.Query<Measures>("Measures_GetAll", commandType: CommandType.StoredProcedure);

                return result.ToList();
            }
        }

        public void Save(object parameter)
        {
            using (var db = _connection.DatabaseContent.TryOpen())
            {
                db.Execute("Measures_Save", parameter, commandType: CommandType.StoredProcedure);
            }
        }
    }
}
