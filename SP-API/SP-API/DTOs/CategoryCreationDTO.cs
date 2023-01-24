using Mall_API.Entities;
using System.ComponentModel.DataAnnotations;

namespace Mall_API.DTOs
{
    public class CategoryCreationDTO
    {
        [Required]
        public string Name { get; set; }
        public IFormFile Image { get; set; }
        [Required]
        [Range(1, int.MaxValue, ErrorMessage = "You must select a {0} from the list")]
        [Display(Name = "Department")]
        public int DepartmentId { get; set; }
    }
}
