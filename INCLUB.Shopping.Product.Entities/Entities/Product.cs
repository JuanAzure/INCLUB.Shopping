using INCLUB.Shopping.Product.Entities.Base;

namespace INCLUB.Shopping.Product.Entities
{
    public class Product : Entity
    {
        public int ProductId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public  decimal Price { get; set; }
        public int Stock { get; set; }
             
    } 
}

