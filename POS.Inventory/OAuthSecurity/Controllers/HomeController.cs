using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;

namespace OAuthSecurity.Controllers
{
    public class HomeController : Controller
    {
        public string Index()
        {
            var result = new
            {
                message = "Not Found"
            };

            return JsonConvert.SerializeObject(result);
        }
    }
}
