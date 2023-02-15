using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IMS.Domain.Model.Dto
{
    public class SearchPagination
    {
        public string Keyword { get; set; }
        public int PageNo { get; set; }
        public int PageSize { get; set; }
    }
}
