using System.ComponentModel.DataAnnotations;

namespace Mall_API.Entities
{
    public class Department
    {
        public int Id { get; set; }
        [Required]
        public string Name { get; set; }
        public string Description { get; set; }
        public ICollection<Category> Categories { get; set; }
        public ICollection<Product> Products { get; set; }
    }
}
