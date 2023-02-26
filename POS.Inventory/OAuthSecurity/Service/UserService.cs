using OAuthSecurity.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OAuthSecurity.Service
{
    public static class UserService
    {
        public static User GetUserByCredentials(string email, string password)
        {
            if (email != "email@domain.com" || password != "password")
            {
                return null;
            }

            User user = new User() { Id = "1", Email = "email@domain.com", Password = "password", Name = "Ole Petter Dahlmann" };

            if (user != null)
            {
                user.Password = string.Empty;
            }

            return user;
        }

    }
}