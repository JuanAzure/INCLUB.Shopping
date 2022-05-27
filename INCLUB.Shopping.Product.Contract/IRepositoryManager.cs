using System.Threading.Tasks;

namespace INCLUB.Shopping.Product.Contract
{
    public interface IRepositoryManager
    {
        IProductRepository Product { get; }        
        Task SaveAsync();
    }
}
