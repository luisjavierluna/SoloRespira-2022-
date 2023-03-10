using Mall_API.Entities;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace Mall_API
{
    public class ApplicationDbContext : IdentityDbContext
    {
        public DbSet<Department> Departments { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<Product> Products { get; set; }

        public ApplicationDbContext(DbContextOptions options) : base(options) { }

        public ApplicationDbContext()
        {
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Department>(department =>
            {
                department.ToTable("Departments");

                department.HasKey(d => d.Id);

                department.Property(d => d.Name).IsRequired();

                department.Property(d => d.Description).IsRequired();
            });

            modelBuilder.Entity<Category>(category =>
            {
                category.ToTable("Categories");

                category.HasKey(c => c.Id);

                category.Property(c => c.Name).IsRequired();

                category.Property(c => c.Image);

                category.HasOne(c => c.Department)
                    .WithMany(d => d.Categories)
                    .HasForeignKey(c => c.DepartmentId)
                    .IsRequired()
                    .OnDelete(DeleteBehavior.Restrict);
            });

            modelBuilder.Entity<Product>(product =>
            {
                product.ToTable("Products");

                product.HasKey(p => p.Id);

                product.Property(p => p.Name).IsRequired();

                product.Property(p => p.Image);

                product.Property(p => p.Price)
                .HasPrecision(10, 2)
                .IsRequired();

                product.Property(p => p.Discount)
                .HasPrecision(2, 1)
                .IsRequired();

                product.Ignore(p => p.PriceWithDiscount);

                product.Property(p => p.Description)
                .IsRequired();

                product.Property(p => p.Height)
                .HasPrecision(3,1);

                product.Property(p => p.Width)
                .HasPrecision(3,1);

                product.Property(p => p.Length)
                .HasPrecision(3,1);

                product.HasOne(p => p.Category)
                .WithMany(c => c.Products)
                .HasForeignKey(p => p.CategoryId)
                .IsRequired()
                .OnDelete(DeleteBehavior.Restrict);

                product.HasOne(p => p.Department)
                .WithMany(d => d.Products)
                .HasForeignKey(p => p.DepartmentId)
                .IsRequired()
                .OnDelete(DeleteBehavior.Restrict);
            });

            base.OnModelCreating(modelBuilder);
        }
    }
}
