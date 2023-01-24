using Mall_API.Entities;
using System.ComponentModel.DataAnnotations;

namespace Mall_API.DTOs
{
    public class CategoryDTO
    {
        public int Id { get; set; }
        [Required]
        public string Name { get; set; }
        public string Image { get; set; }
        [Required]
        [Range(1, int.MaxValue, ErrorMessage = "You must select a {0} from the list")]
        [Display(Name = "Department")]
        public int DepartmentId { get; set; }
        public string DepartmentName { get; set; }
    }
}
