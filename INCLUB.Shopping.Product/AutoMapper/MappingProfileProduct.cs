using AutoMapper;
using INCLUB.Shopping.Product.Entities.Dto;

namespace INCLUB.Shopping.Product.Api.AutoMapper
{
    public class MappingProfileProduct : Profile
    {
        public MappingProfileProduct()
        {
            CreateMap<Product.Entities.Product, ProductDTO>();
            CreateMap<ProductForCreateDTO , Product.Entities.Product>();
            CreateMap<ProductForUpdateDTO, Product.Entities.Product>();
        }
    }
}
