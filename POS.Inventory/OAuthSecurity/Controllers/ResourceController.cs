using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace OAuthSecurity.Controllers
{
    public class ResourceController : ApiController
    {
        [Authorize]
        [HttpGet]
        public IHttpActionResult Ping()
        {

            return Ok("Pong");
        }
    }
}
