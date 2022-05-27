using AutoMapper;
using INCLUB.Shopping.Product.Contract;
using INCLUB.Shopping.Product.Entities.Dto;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace INCLUB.Shopping.Product.Services
{
    public class ProductService : IProductService
    {
        IProductRepository _productRepository;
        private readonly IMapper _mapper;
        public ProductService(IProductRepository productRepository, IMapper mapper)
        {
            this._productRepository = productRepository;
            this._mapper = mapper;

        }

        public async Task<(string message, int? result)> Create(ProductForCreateDTO productForCreateDTO)
        {
            var product = _mapper.Map<Entities.Product>(productForCreateDTO);
            var result = await _productRepository.Create(product);
            if (result <= 0)
                return (message: "An error occurred while created the product.", result: null);
            return (message: string.Empty, result: result);
        }

        public async Task<string> Delete(int productId)
        {
            var queryProduct = await _productRepository.GetById(productId);
            if (queryProduct is null)
                return "Product not exists.";

            var result = _productRepository.Delete(productId);
            if (!result)
                return"An error occurred while deleted the product";
            return string.Empty;
        }

        public async Task<(string message, IEnumerable<ProductDTO> productDTO)> GetAll()
        {
            var queryProduct = await _productRepository.GetAll();
            if (queryProduct is null)
                return (message: "Product not exists.", productDTO: null);
            var productAllDto = _mapper.Map<IEnumerable<ProductDTO>>(queryProduct);
            return (message: string.Empty, productDTO: productAllDto);
        }

        public async Task<(string message, ProductDTO productDTO)> GetById(int productId)
        {
            var queryProduct = await _productRepository.GetById(productId);
            if (queryProduct is null)
                return (message: "Product not exists.", productDTO: null);
            var productDto = _mapper.Map<ProductDTO>(queryProduct);
            return (message: string.Empty, productDTO: productDto);
        }

        public async Task<string> Update(ProductForUpdateDTO productForUpdateDTO)
        {
            var queryProduct = await _productRepository.GetById(productForUpdateDTO.ProductId);
            if (queryProduct is null)
                return "Product not exists.";

            var product = _mapper.Map<Entities.Product>(productForUpdateDTO);

            var result = _productRepository.Update(product);
            if (!result)
                throw new Exception("An error occurred while updating the product");

            return string.Empty;

        }
    }
}
