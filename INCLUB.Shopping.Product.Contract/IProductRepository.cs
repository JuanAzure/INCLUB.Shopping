using System.Collections.Generic;
using System.Threading.Tasks;
namespace INCLUB.Shopping.Product.Contract
{
    public interface IProductRepository
    {
        Task<int> Create(Product.Entities.Product product);
        Task<IEnumerable<Product.Entities.Product>> GetAll();
        Task<Product.Entities.Product> GetById(int productId);
        bool Update(Product.Entities.Product product);
        bool Delete(int productId);
    }
}
