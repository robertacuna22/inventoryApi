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

namespace IMS.Repository
{
    public class ProductsRepository : IProductsRepository
    {
        private readonly IDapperConnection _connection;
        public ProductsRepository(IDapperConnection connection)
        {
            _connection = connection;

        }

        public void Delete(object parameter)
        {
            using (var db = _connection.DatabaseContent.TryOpen())
            {
                db.Execute("Products_Delete", parameter, commandType: CommandType.StoredProcedure);
            }
        }

        public List<ProductsResponse> Get()
        {
            using (var db = _connection.DatabaseContent.TryOpen())
            {
                var result = db.Query<ProductsResponse>("Products_GetAll", commandType: CommandType.StoredProcedure);
                return result.ToList();
            }
        }

        public List<ProductsResponse> ProductSearch(object parameter)
        {
            using (var db = _connection.DatabaseContent.TryOpen())
            {
                var result = db.Query<ProductsResponse>("Products_SearchPagination", parameter, commandType: CommandType.StoredProcedure);
                return result.ToList();
            }
        }

        public void Save(object parameter)
        {
            using (var db = _connection.DatabaseContent.TryOpen())
            {
                db.Execute("Products_Save", parameter, commandType: CommandType.StoredProcedure);
            }
        }
    }
}
