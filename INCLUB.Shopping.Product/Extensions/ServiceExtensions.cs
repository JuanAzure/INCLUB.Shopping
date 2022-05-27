
using INCLUB.Shopping.Product.Contract;
using INCLUB.Shopping.Product.Repository;
using INCLUB.Shopping.Product.Services;
using Microsoft.Extensions.DependencyInjection;
namespace INCLUB.Shopping.Product.Api.Extensions
{
    public static class ServiceExtensions
    {
        public static void ConfigureServicesManager(this IServiceCollection services)
        {
            services.AddSingleton<IProductRepository, ProductRepository>();
            services.AddSingleton<IRepositoryManager, RepositoryManager>();
            services.AddSingleton<IProductService, ProductService>();

        }
    }
}
