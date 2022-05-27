using INCLUB.Shopping.Product.Entities.Dto;
using INCLUB.Shopping.Product.Services;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace INCLUB.Shopping.Product.Api.Controllers
{
    [Route("api/product")]
    [ApiController]
    public class ProductController : ControllerBase
    {
        IProductService _productService;

        public ProductController(IProductService productService)
        {
            _productService = productService;
        }
        
        [HttpGet("{productId:int}")]
        public async Task<IActionResult> GetByIdProduct(int id)
        {
            var result = await _productService.GetById(id);
            if (!string.IsNullOrEmpty(result.message))
            {
                return BadRequest(result.message);
            }
            return Ok(result.productDTO);
        }

        [HttpPost("createProduct")]
        public async Task<IActionResult> CreateProduct([FromBody]  ProductForCreateDTO productForCreateDTO)
        {
            var result = await _productService.Create(productForCreateDTO);
            if (!string.IsNullOrEmpty(result.message))
            {
                return BadRequest(result.message);
            }
            return Ok($"{result.result}");
        }


        [HttpPut("updateProduct")]
        public async Task<IActionResult> UpdateProduct([FromBody] ProductForUpdateDTO  productForUpdateDTO)
        {
            var result = await _productService.Update(productForUpdateDTO);
            if (!string.IsNullOrEmpty(result))
            {
                return BadRequest(result);
            }
            return NoContent();
        }
        [HttpDelete("{productId:int}")]
        public async Task<IActionResult> DeleteProduct(int productId)
        {
            var result = await _productService.Delete(productId);
            if (!string.IsNullOrEmpty(result))
            {
                return BadRequest(result);
            }
            return NoContent();
        }
    }
}
