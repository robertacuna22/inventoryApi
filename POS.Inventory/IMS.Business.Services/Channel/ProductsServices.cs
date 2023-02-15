using IMS.Domain.BusinessContract;
using IMS.Domain.Model;
using IMS.Domain.Model.Dto;
using IMS.Repository.Contract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IMS.Business.Services.Channel
{
    public class ProductsServices : IProductsServices
    {
        private readonly IProductsRepository _repository;
        public ProductsServices(IProductsRepository repository)
        {
            _repository = repository;
        }
        public void Delete(Guid Id)
        {
            _repository.Delete(new { Id });
        }

        public List<ProductsResponse> Get()
        {
           var resultList = _repository.Get();

            return resultList;
        }

        public List<ProductsResponse> ProductSearch(SearchPagination model)
        {
            var resultList = _repository.ProductSearch(model);

            return resultList;
        }

        public void Save(ProductsDto productsDto)
        {
            _repository.Save(productsDto);
        }
    }
}
