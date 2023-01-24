﻿using System.ComponentModel.DataAnnotations;

namespace Mall_API.DTOs
{
    public class UserCredentials
    {
        [EmailAddress]
        [Required]
        public string Email { get; set; }
        [Required]
        public string Password { get; set; }
    }
}
