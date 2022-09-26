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
    public class CategoryController : ApiController
    {
        private readonly ICategoryServices _services;
        public CategoryController(ICategoryServices services)
        {
            _services = services;
        }

        [HttpPost]
        [Route("api/category")]
        public IHttpActionResult Save([FromBody] CategoryDto model)
        {

            var brandId = (string.IsNullOrEmpty(model.Id) ? Guid.NewGuid() : new Guid(model.Id));

            _services.Save(brandId, model.CategoryName, model.Description);

            return Ok(model);
        }

        [HttpGet]
        [Route("api/category")]
        public IHttpActionResult GetAll()
        {

            var result = _services.Get();

            return Ok(result);
        }

        [HttpDelete]
        [Route("api/category/{Id}")]
        public IHttpActionResult Delete(Guid Id)
        {

            _services.Delete(Id);

            return Ok();
        }
    }
}
