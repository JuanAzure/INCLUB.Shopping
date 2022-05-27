namespace INCLUB.Shopping.Product.Entities.Dto
{
    public class ProductForCreateDTO
    {        
        public string Name { get; set; }
        public string Description { get; set; }
        public decimal Price { get; set; }
        public int Stock { get; set; }
        public int UserId { get; set; }
    }
}
