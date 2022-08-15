using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace POS.Inventory.Domain.Model
{
    public abstract class BaseDomain
    {
        public Guid InstallationId { get; set; }
    }
}
