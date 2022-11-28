using IMS.Domain.BusinessContract;
using IMS.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace IMS.Controllers
{
    public class ProductsController : ApiController
    {
        private readonly IProductsServices _services;
        public ProductsController(IProductsServices services)
        {
            _services = services;
        }

        [HttpPost]
        [Route("api/product")]
        public IHttpActionResult Save([FromBody] ProductsDto model)
        {
            var serializeMappedResult = JsonConvert.SerializeObject(model);
            var mappedProductsResult = JsonConvert.DeserializeObject<IMS.Domain.Model.Dto.ProductsDto>(serializeMappedResult);
            mappedProductsResult.Id = Guid.NewGuid();

            _services.Save(mappedProductsResult);

            return Ok(model);
        }

        [HttpPut]
        [Route("api/product/{Id}")]
        public IHttpActionResult Update(Guid Id, [FromBody] ProductsDto model)
        {
            var serializeMappedResult = JsonConvert.SerializeObject(model);
            var mappedProductsResult = JsonConvert.DeserializeObject<IMS.Domain.Model.Dto.ProductsDto>(serializeMappedResult);
            mappedProductsResult.Id = Id;

            _services.Save(mappedProductsResult);

            return Ok(mappedProductsResult);
        }

        [HttpGet]
        [Route("api/products")]
        public IHttpActionResult GetAll()
        {
            var result = _services.Get();

            return Ok(result);
        }

        [HttpDelete]
        [Route("api/product/{Id}")]
        public IHttpActionResult Delete(Guid Id)
        {
            _services.Delete(Id);

            return Ok();
        }
    }
}
