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
    public class BrandsRepository : IBrandsRepository
    {

        private readonly IDapperConnection _connection;
        public BrandsRepository(IDapperConnection connection)
        {
            _connection = connection;

        }
        public void Delete(object parameter)
        {
            using (var db = _connection.DatabaseContent.TryOpen())
            {              
               db.Execute("Brands_Delete", parameter, commandType: CommandType.StoredProcedure);
            }
        }

        public List<Brands> Get()
        {
            using (var db = _connection.DatabaseContent.TryOpen())
            {
                var result = db.Query<Brands>("Brands_GetAll", commandType: CommandType.StoredProcedure);
                return result.ToList();
            }
        }

        public void Save(object parameter)
        {
            using (var db = _connection.DatabaseContent.TryOpen())
            {
                db.Execute("Brands_Save", parameter, commandType: CommandType.StoredProcedure);
            }
        }
    }
}
