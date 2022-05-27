namespace INCLUB.Shopping.Product.Entities.Dto
{
    public class ProductForUpdateDTO
    {
        public int ProductId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public decimal Price { get; set; }
        public int UserId { get; set; }
    }
}
