using IMS.Domain.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IMS.Repository.Contract
{
    public interface IProductsRepository : IBaseRepository
    {
        List<ProductsResponse> Get();
        List<ProductsResponse> ProductSearch(object parameter);
    }
}
