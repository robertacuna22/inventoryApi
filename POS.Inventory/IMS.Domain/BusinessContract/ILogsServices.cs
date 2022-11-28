using IMS.Domain.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IMS.Domain.BusinessContract
{
    public interface ILogsServices
    {
        void Create(Logs model);
    }
}
