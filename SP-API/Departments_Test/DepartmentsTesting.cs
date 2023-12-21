using Mall_API;
using Mall_API.Controller;
using Mall_API.Entities;
using Microsoft.AspNetCore.Mvc;

namespace Departments_Test
{
    public class DepartmentsTesting
    {
        //private readonly DepartmentsController _controller;
        //private readonly ApplicationDbContext _context;

        //public DepartmentsTesting()
        //{
        //    _controller = new DepartmentsController(_context);
        //    _context = new ApplicationDbContext();
        //}

        [Fact]
        public void GetDepartments_Ok()
        {
            var departments = new List<Department>()
            {
                new Department { Id = 1, Name = "Test1", Description = "Desc 1"},
                new Department { Id = 2, Name = "Test2", Description = "Desc 2"},
                new Department { Id = 3, Name = "Test3", Description = "Desc 3"},
            };

            var appDbContext = new ApplicationDbContext();
            var _controller = new DepartmentsController(appDbContext);


            var result = _controller.GetDepartments();

            Assert.IsType<OkObjectResult>(result);
        }
    }
}