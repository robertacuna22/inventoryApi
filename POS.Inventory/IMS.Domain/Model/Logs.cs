using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IMS.Domain.Model
{
    public class Logs
    {
        public int Id { get; set; }
        public string CloverId { get; set; }
        public string Description { get; set; }
        public DateTime DateCreated { get; set; }
    }
}
