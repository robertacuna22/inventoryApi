using IMS.Domain.Model;
using IMS.Domain.Model.Dto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IMS.Domain.BusinessContract
{
    public interface IProductsServices
    {
        List<ProductsResponse> Get();

        void Save(ProductsDto productsDto);

        void Delete(Guid Id);
    }
}
