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

namespace IMS.Controllers
{
    public class HomeController : Controller
    {

        private readonly ILogsServices _services;
        public HomeController(ILogsServices services)
        {
            _services = services;
        }
        public ActionResult Index()
        {

            //Stream s = HttpContext.Request.InputStream;
            //s.Position = 0;
            //StreamReader reader = new StreamReader(s);
            //string jsonText = reader.ReadToEnd();

            ////var logs = new Logs() { CloverId = "sampleId", Description = "yeah" };
            ////_services.Create(logs);

            //if (!string.IsNullOrEmpty(jsonText))
            //{

            //    var cloverHelloWorldStore = JsonConvert.DeserializeObject<CloverResponse>(jsonText);
            //    var appId = cloverHelloWorldStore.appId;

            //    cloverHelloWorldStore.merchants.Y964D51FQZAF1.ForEach(x =>
            //    {
            //        var eventType = "";
            //        var id = "";
            //        var objectIdArr = x.objectId.Split(':');

            //        if (objectIdArr != null)
            //        {
            //            eventType = objectIdArr[0];
            //            id = objectIdArr[1];
            //        }

            //        switch (eventType)
            //        {
            //            case "I": //Inventory
            //                var logs = new Logs() { CloverId = id, Description = jsonText };
            //                _services.Create(logs);
            //            break;

            //            case "O": //Orders
            //            break;

            //            case "E": //Employees
            //            break;

            //            case "C": //Customers
            //            break;

            //            case "IC": // Inventory Category
            //            break;

            //            case "M": //Merchants
            //            break;

            //            case "P": //Payments
            //            break;

            //            default:
            //                break;
            //        }

            //    });

            //}

            //ViewBag.ResultHook = jsonText;

            //string cs = ConfigurationManager.ConnectionStrings["IMS"].ConnectionString;
            //ViewBag.Title = "jsonText";

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
