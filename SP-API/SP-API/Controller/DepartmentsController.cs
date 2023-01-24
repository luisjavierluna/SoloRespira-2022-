using Mall_API.Entities;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Mall_API.Controller
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme, Policy = "IsAdmin")]
    public class DepartmentsController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public DepartmentsController(ApplicationDbContext _context)
        {
            this._context = _context;
        }

        [HttpGet]
        [AllowAnonymous]
        public async Task<IActionResult> GetDepartments()
        {
            var departments = await _context.Departments.Select(p =>
            new
            {
                Id = p.Id,
                Name = p.Name
            }).ToListAsync();

            return Ok(departments);
        }

        [HttpGet("navbarMenuItems")]
        [AllowAnonymous]
        public async Task<IActionResult> GetAllMenuItems()
        {
            var departments = await _context.Departments
                .Select(x =>
                new
                {
                    Id = x.Id,
                    Name = x.Name,
                    Categories = x.Categories.Select(x =>
                    new
                    {
                        Id = x.Id,
                        Name = x.Name,
                        Products = x.Products.Select(x =>
                        new {
                            Id = x.Id,
                            Name = x.Name
                        })
                    })
                }).ToListAsync();

            return Ok(departments);
        }

        [HttpPost]
        public async Task<IActionResult> PostDepartment([FromBody] Department department)
        {
            await _context.Departments.AddAsync(department);
            await _context.SaveChangesAsync();

            return Ok(department);
        }

        [HttpGet("{Id:int}")]
        public async Task<IActionResult> GetDepartment(int Id)
        {
            var existingDepartment = await _context.Departments.FirstOrDefaultAsync(x => x.Id == Id);

            if (existingDepartment == null)
            {
                return NotFound("Department not found");
            }

            return Ok(existingDepartment);
        }

        [HttpGet("departmentPage/{Name}")]
        [AllowAnonymous]
        public async Task<IActionResult> GetDepartmentPage(string Name)
        {
            var department = await _context.Departments
                .Include(x => x.Categories)
                .FirstOrDefaultAsync(x => x.Name == Name);

            if (department == null)
            {
                return NotFound("Department not found");
            }

            var pageDepartment = new
            {
                Id = department.Id,
                Name = department.Name,
                Description = department.Description,
                Categories = department.Categories.Select(x =>
                new
                {
                    Id = x.Id,
                    Name = x.Name,
                    Image = x.Image
                })
            };

            return Ok(pageDepartment);
        }

        [HttpPut("{Id:int}")]
        public async Task<IActionResult> PutDepartment([FromBody] Department newDepartment, int Id)
        {
            var departmentToUpdate = await _context.Departments.FirstOrDefaultAsync(x => x.Id == Id);

            if (departmentToUpdate == null)
            {
                return NotFound("Department not found");
            }

            departmentToUpdate.Name = newDepartment.Name;
            departmentToUpdate.Description = newDepartment.Description;

            await _context.SaveChangesAsync();

            return Ok(departmentToUpdate);
        }

        [HttpDelete("{Id:int}")]
        public async Task<IActionResult> DeleteDepartment(int Id)
        {
            var departmentToDelete = await _context.Departments.FirstOrDefaultAsync(x => x.Id == Id);

            if (departmentToDelete == null)
            {
                return NotFound("Department not found");
            }

            _context.Departments.Remove(departmentToDelete);
            await _context.SaveChangesAsync();
            return Ok(departmentToDelete);
        }
    }
}
