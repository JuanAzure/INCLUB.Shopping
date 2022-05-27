using Dapper;
using INCLUB.Shopping.Prioduct.Common;
using INCLUB.Shopping.Product.Contract;
using Microsoft.Extensions.Configuration;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;

namespace INCLUB.Shopping.Product.Repository
{
    public class ProductRepository : IProductRepository
    {
        private readonly IDbConnection dbConection;
        public ProductRepository(IConfiguration configuration)
        {
            dbConection = new SqlConnection(configuration[Constants.ConextionBD.providers.SqlServer]);
        }


        public async Task<int> Create(Product.Entities.Product product)
        {
            var @param = string.Join("|", product.Name, product.Description,
                product.Price, product.Stock, product.UserId);
            var parameters = new DynamicParameters();
            var sp = Constants.StoreProcedure.ManagementProduct;
            parameters.Add("@pOpcion", Constants.OperationType.Insert);
            parameters.Add("@parameter", @param);            
            var result = await dbConection.QueryFirstOrDefaultAsync<dynamic>(sp, parameters, commandType: CommandType.StoredProcedure);
            return (int)result.productId;

        }

        public bool Delete(int productId)
        {
            var parameters = new DynamicParameters();
            var sp = Constants.StoreProcedure.ManagementProduct;
            parameters.Add("@pOpcion", Constants.OperationType.Delete);
            parameters.Add("@parameter", string.Join("|", productId));
            var result = dbConection.Execute(sp, parameters, commandType: CommandType.StoredProcedure);
            if (result > 0)
                return true;
            return false;
        }

        public async Task<IEnumerable<Entities.Product>> GetAll()
        {
            var parameters = new DynamicParameters();
            var sp = Constants.StoreProcedure.ManagementProduct;
            parameters.Add("@pOpcion", Constants.OperationType.GetAll);
            var result = await dbConection.QueryAsync<Entities.Product>(sp, parameters, commandType: CommandType.StoredProcedure);
            dbConection.Close();
            return result;
        }

        public async Task<Entities.Product> GetById(int productId)
        {
            var parameters = new DynamicParameters();
            var sp = Constants.StoreProcedure.ManagementProduct;
            parameters.Add("@pOpcion", Constants.OperationType.GetById);
            parameters.Add("@parameter", string.Join("|", productId));
            var result = await dbConection.QueryFirstOrDefaultAsync<dynamic>(sp, parameters, commandType: CommandType.StoredProcedure);
            dbConection.Close();
            if (result is null)            
               return null ;
            
            var product = new Entities.Product()
            {
                ProductId = result.N_ProductId,
                Name = result.V_Name,
                Description = result.V_Description,
                Price = result.D_Price,
                Stock = result.N_Stock,
            };

            return product;
        }

        public bool Update(Product.Entities.Product product)
        {
            var @param = string.Join("|", product.ProductId, product.Name, product.Description,
                                        product.Price, product.UserId);
            var parameters = new DynamicParameters();
            var sp = Constants.StoreProcedure.ManagementProduct;
            parameters.Add("@pOpcion", Constants.OperationType.Update);
            parameters.Add("@parameter", @param);
            var result = dbConection.Execute(sp, parameters, commandType: CommandType.StoredProcedure);
            if (result > 0)
                return true;
            return false;
        }
    }
}
