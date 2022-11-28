using IMS.Domain.BusinessContract;
using IMS.Domain.Model;
using IMS.Repository.Contract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Unity;

namespace IMS.Business.Services.Channel
{
    public class LogsServices : ILogsServices
    {

        private readonly ILogsRepository _repository;

        [InjectionConstructor]
        public LogsServices(ILogsRepository repository)
        {
            _repository = repository;
        }
        public void Create(Logs model)
        {
            _repository.Create(new { model.CloverId, model.Description });
        }
    }
}
