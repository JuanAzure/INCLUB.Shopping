using INCLUB.Shopping.Product.Entities.Dto;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace INCLUB.Shopping.Product.Services
{
    public interface IProductService
    {
        Task<(string message, int? result)> Create(ProductForCreateDTO  productForCreateDTO);
        Task<(string message, IEnumerable<ProductDTO> productDTO)> GetAll();
        Task<(string message, ProductDTO productDTO)> GetById(int productId);
        Task<string> Update(ProductForUpdateDTO productForUpdateDTO);
        Task<string>Delete(int productId);
    }
}
