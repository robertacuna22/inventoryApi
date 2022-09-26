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
    public class UnitOfMeasureServices : IUnitOfMeasureServices
    {
        private readonly IUnitOfMeasuresRepository _repository;
        public UnitOfMeasureServices(IUnitOfMeasuresRepository repository)
        {
            _repository = repository;
        }
        public void Delete(Guid Id)
        {
            _repository.Delete(new { Id });
        }

        public List<Measures> Get()
        {
            var result = _repository.Get();

            return result;
        }

        public void Save(Guid Id, string UnitOfMeasure, string Description)
        {
            _repository.Save(new { Id, UnitOfMeasure, Description });
        }
    }
}
