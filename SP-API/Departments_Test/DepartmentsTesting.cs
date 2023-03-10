using Mall_API;
using Mall_API.Controller;
using Microsoft.AspNetCore.Mvc;

namespace Departments_Test
{
    public class DepartmentsTesting
    {
        //private readonly DepartmentsController _controller;
        //private readonly ApplicationDbContext _context;

        //public DepartmentsTesting(
        //    DepartmentsController controller,
        //    ApplicationDbContext context)
        //{
        //    _controller = new DepartmentsController(_context);
        //    _context = new ApplicationDbContext();
        //}

        [Fact]
        public void GetDepartments_Ok()
        {
            var _context = new ApplicationDbContext();
            var _controller = new DepartmentsController(_context);

            var result = _controller.GetDepartments();

            Assert.IsType<OkObjectResult>(result);
        }
    }
}