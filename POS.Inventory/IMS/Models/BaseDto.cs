using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IMS.Models
{
    public abstract class BaseDto
    {
        public string Id { get; set; }
        public string Description { get; set; }
    }
}