using IMS.Domain.BusinessContract;
using IMS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;

namespace IMS.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class UnitOfMeasuresController : ApiController
    {
        private readonly IUnitOfMeasureServices _services;
        public UnitOfMeasuresController(IUnitOfMeasureServices services)
        {
            _services = services;
        }

        [HttpPost]
        [Route("api/measures")]
        public IHttpActionResult Save([FromBody] MeasuresDto model)
        {

            var brandId = (string.IsNullOrEmpty(model.Id) ? Guid.NewGuid() : new Guid(model.Id));

            _services.Save(brandId, model.UnitOfMeasure, model.Description);

            return Ok(model);
        }

        [HttpGet]
        [Route("api/measures")]
        public IHttpActionResult GetAll()
        {

            var result = _services.Get();

            return Ok(result);
        }

        [HttpDelete]
        [Route("api/measures/{Id}")]
        public IHttpActionResult Delete(Guid Id)
        {

            _services.Delete(Id);

            return Ok();
        }
    }
}
