using AutoMapper;
using Mall_API.DTOs;
using Mall_API.Entities;

namespace Mall_API.Utilities
{
    public class AutoMapperProfiles: Profile
    {
        public AutoMapperProfiles()
        {
            CreateMap<ProductCreationDTO, Product>()
                .ForMember(x => x.Image, options => options.Ignore());
            
            CreateMap<CategoryCreationDTO, Category>()
                .ForMember(x => x.Image, options => options.Ignore());

            CreateMap<Product, ProductDTO>();
            CreateMap<Category, CategoryDTO>();
        }
    }
}
