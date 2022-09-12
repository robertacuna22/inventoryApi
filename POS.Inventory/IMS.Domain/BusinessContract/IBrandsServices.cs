using IMS.Domain.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IMS.Domain.BusinessContract
{
    public interface IBrandsServices
    {
        List<Brands> Get();

        void Save(Guid Id, string BrandName, string Description);

        void Delete(Guid Id);
    }
}
