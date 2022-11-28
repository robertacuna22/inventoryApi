using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IMS.Models
{
    public class ProductsDto
    {
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