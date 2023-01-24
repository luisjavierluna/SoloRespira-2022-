namespace Mall_API.Utilities
{
    public class LocalFileStorage : IFileStorage
    {
        private readonly IWebHostEnvironment webHost;
        private readonly IHttpContextAccessor httpContext;

        public LocalFileStorage(
            IWebHostEnvironment webHost,
            IHttpContextAccessor httpContext)
        {
            this.webHost = webHost;
            this.httpContext = httpContext;
        }

        public async Task<string> SaveFile(string container, IFormFile file)
        {
            var extension = Path.GetExtension(file.FileName);
            var fileName = $"{Guid.NewGuid()}{extension}";
            string folder = Path.Combine(webHost.WebRootPath, container);

            if (!Directory.Exists(folder))
            {
                Directory.CreateDirectory(folder);
            }

            string route = Path.Combine(folder, fileName);
            using (var memoryStream = new MemoryStream())
            {
                await file.CopyToAsync(memoryStream);
                var content = memoryStream.ToArray();
                await File.WriteAllBytesAsync(route, content);
            }

            var currentUrl = $"{httpContext.HttpContext.Request.Scheme}://{httpContext.HttpContext.Request.Host}";
            var routeForDB = Path.Combine(currentUrl, container, fileName).Replace("\\", "/");
            return routeForDB;
        }

        public Task DeleteFile(string route, string container)
        {
            if (string.IsNullOrEmpty(route))
            {
                return Task.CompletedTask;
            }

            var fileName = Path.GetFileName(route);
            var fileDirectory = Path.Combine(webHost.WebRootPath, container, fileName);

            if (File.Exists(fileDirectory))
            {
                File.Delete(fileDirectory);
            }

            return Task.CompletedTask;
        }

        public async Task<string> EditFile(string container, IFormFile file, string route)
        {
            await DeleteFile(route, container);
            return await SaveFile(container, file);
        }
    }
}

