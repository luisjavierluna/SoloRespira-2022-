using Mall_API.DTOs;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace Mall_API.Controller
{
    [Route("api/[controller]")]
    [ApiController]
    public class AccountsController : ControllerBase
    {
        private readonly UserManager<IdentityUser> userManager;
        private readonly SignInManager<IdentityUser> signInManager;
        private readonly IConfiguration configuration;

        public AccountsController(
            UserManager<IdentityUser> userManager,
            SignInManager<IdentityUser> signInManager,
            IConfiguration configuration)
        {
            this.userManager = userManager;
            this.signInManager = signInManager;
            this.configuration = configuration;
        }

        [HttpPost("signin")]
        public async Task<IActionResult> SignIn([FromBody] UserCredentials credentials)
        {
            var user = new IdentityUser { UserName = credentials.Email, Email = credentials.Email };
            var result = await userManager.CreateAsync(user, credentials.Password);

            if (result.Succeeded)
            {
                return await BuilToken(credentials);
            }
            else
            {
                return BadRequest(result.Errors);
            }
        }

        [HttpPost("login")]
        public async Task<IActionResult> Login([FromBody] UserCredentials credentials)
        {
            var result = await signInManager.PasswordSignInAsync(credentials.Email, credentials.Password,
                isPersistent: false, lockoutOnFailure: false);

            if (result.Succeeded)
            {
                return await BuilToken(credentials);
            }
            else
            {
                return BadRequest("Wrong Authentication");
            }
        }

        private async Task<IActionResult> BuilToken(UserCredentials credentials)
        {
            var claims = new List<Claim>()
            {
                new Claim("email", credentials.Email)
            };

            var user = await userManager.FindByEmailAsync(credentials.Email);
            var claimsDB = await userManager.GetClaimsAsync(user);

            claims.AddRange(claimsDB);

            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(configuration["jwtKey"]));
            var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

            var expiration = DateTime.UtcNow.AddYears(1);

            var token = new JwtSecurityToken(issuer: null, audience: null, claims,
                expires: expiration, signingCredentials: creds);

            var authenticationResponse = new AuthenticationResponse()
            {
                Token = new JwtSecurityTokenHandler().WriteToken(token),
                Expiration = expiration
            };

            return Ok(authenticationResponse);
        }
    }
}
