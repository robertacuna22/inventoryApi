using IMS.Domain.BusinessContract;
using IMS.Domain.Model;
using IMS.Repository.Contract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IMS.Business.Services.Channel
{
    public class BrandsServices : IBrandsServices
    {
        private readonly IBrandsRepository _repository;
        public BrandsServices(IBrandsRepository repository) {

            _repository = repository;
        }
        public void Delete(Guid Id)
        {
            _repository.Delete(new { Id });
        }

        public List<Brands> Get()
        {
            var result = _repository.Get();

            return result;
        }

        public void Save(Guid Id, string BrandName, string Description)
        {
            _repository.Save(new { Id, BrandName, Description });
        }
    }
}
