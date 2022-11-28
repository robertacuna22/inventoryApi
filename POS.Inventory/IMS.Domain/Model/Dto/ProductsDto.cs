using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IMS.Domain.Model.Dto
{
    public class ProductsDto
    {
        public Guid Id { get; set; }
        public string Description { get; set; }
        public string ProductName { get; set; }
        public int Quantity { get; set; }
        public string SKU { get; set; }
        public Guid Brand { get; set; }
        public Guid Category { get; set; }
        public Guid UnitOfMeasure { get; set; }
        public decimal UnitPrice { get; set; }
    }
}
