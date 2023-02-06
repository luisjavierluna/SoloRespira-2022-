using System.ComponentModel.DataAnnotations;

namespace Mall_API.Entities
{
    public class Product
    {
        public int Id { get; set; }
        [Required]
        public string Name { get; set; }
        public string Image { get; set; }
        public decimal Price { get; set; }
        [Range(0, 1)]
        public decimal Discount { get; set; }
        public decimal PriceWithDiscount => Price - (Price * Discount);
        public string Description { get; set; }
        public int Weight { get; set; }
        public decimal Height { get; set; }
        public decimal Width { get; set; }
        public decimal Length { get; set; }
        [Required]
        [Range(1, int.MaxValue, ErrorMessage = "You must select a {0} from the list")]
        [Display(Name = "Category")]
        public int CategoryId { get; set; }
        public Category Category { get; set; }
        [Required]
        [Range(1, int.MaxValue, ErrorMessage = "You must select a {0} from the list")]
        [Display(Name = "Department")]
        public int DepartmentId { get; set; }
        public Department Department { get; set; }
    }
}
