using INCLUB.Shopping.Product.Contract;
using Microsoft.Extensions.Configuration;
using System.Threading.Tasks;

namespace INCLUB.Shopping.Product.Repository
{
    public class RepositoryManager : IRepositoryManager
    {

        private readonly IConfiguration _configuration;
        public RepositoryManager(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public IProductRepository _productRepository;

        public IProductRepository Product
        {
            get
            {
                if (_productRepository == null)
                    _productRepository = new ProductRepository(_configuration);

                return _productRepository;
            }
        }

        public Task SaveAsync()
        {
            throw new System.NotImplementedException();
        }
    }
}
