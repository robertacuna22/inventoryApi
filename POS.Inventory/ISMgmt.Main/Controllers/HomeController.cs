using IMS.Domain.BusinessContract;
using IMS.Domain.Model;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ISMgmt.Main.Controllers
{
    public class HomeController : Controller
    {     
        public ActionResult Index()
        {

            return View();
        }

    }

    public class Merchants
    {
        public List<Y964D51FQZAF1> Y964D51FQZAF1 { get; set; }
    }

    public class CloverResponse
    {
        public string appId { get; set; }
        public Merchants merchants { get; set; }
    }

    public class Y964D51FQZAF1
    {
        public string objectId { get; set; }
        public string type { get; set; }
        public long ts { get; set; }
    }


}
