using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IMS.Domain.Model
{
    public class Users : BaseDomain
    {
        public Guid UserId { get; set; }
        public string FirstName { get; set; }
        public string Password { get; set; }
        public string LastName { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        // public UserStatus Status { get; set; }
        public long Permissions { get; set; }
        public Guid Token { get; set; }
        public DateTime CreatedOn { get; set; }
        public DateTime UpdatedOn { get; set; }
        public int Attempt { get; set; }

        public bool VerifyPassword(string password)
        {
            if (string.IsNullOrEmpty(Password))
                Password = string.Empty;
            return Password == password;
        }
        public void SetPassword(string password)
        {
            Password = password;
        }
    }
}
