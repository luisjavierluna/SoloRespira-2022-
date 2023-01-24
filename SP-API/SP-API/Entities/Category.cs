using System.ComponentModel.DataAnnotations;

namespace Mall_API.Entities
{
    public class Category
    {
        public int Id { get; set; }
        [Required]
        public string Name { get; set; }
        public string Image { get; set; }
        [Required]
        [Range(1, int.MaxValue, ErrorMessage = "You must select a {0} from the list")]
        [Display(Name = "Department")]
        public int DepartmentId { get; set; }
        public Department Department { get; set; }
        public ICollection<Product> Products { get; set; }
    }
}
