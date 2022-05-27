using System;

namespace INCLUB.Shopping.Product.Entities.Base
{
    public class Entity
    {
        public int UserId { get; set; } 
        public DateTime CreatedDate { get; set; }
        public DateTime ModifiedDate { get; set; }
        public bool IsDeleted { get; set; }
    }
}
