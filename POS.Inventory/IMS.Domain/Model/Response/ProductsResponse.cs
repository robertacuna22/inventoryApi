using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IMS.Domain.Model
{
    public class ProductsResponse : ProductBase
    {
        public string ProductName { get; set; }
        public int Quantity { get; set; }
        public string SKU { get; set; }
        public string Brand { get; set; }
        public string Category { get; set; }
        public string UnitOfMeasure { get; set; }
        public decimal UnitPrice { get; set; }
        public Guid CategoryId { get; set; }
        public Guid BrandId { get; set; }
        public Guid UOMId { get; set; }
    }
}
