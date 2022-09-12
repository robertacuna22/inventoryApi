using IMS.Domain.BusinessContract;
using IMS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace IMS.Controllers
{
    public class BrandsController : ApiController
    {
        private readonly IBrandsServices _services;
        public BrandsController(IBrandsServices services)
        {
            _services = services;
        }

        [HttpPost]
        [Route("api/brands")]
        public IHttpActionResult Save([FromBody] BrandsQuery model) {

            _services.Save(Guid.NewGuid(), model.BrandName, model.Description);

            return Ok(model);
        }

        [HttpGet]
        [Route("api/brands")]
        public IHttpActionResult GetAll()
        {

            var result = _services.Get();

            return Ok(result);
        }

        [HttpDelete]
        [Route("api/brands/{Id}")]
        public IHttpActionResult Delete(Guid Id)
        {

            _services.Delete(Id);

            return Ok();
        }

    }
}
