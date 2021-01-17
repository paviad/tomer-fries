using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Data.DAL {
    [Table("Is4_AspNetUserClaims")]
    public class AppUser {
        [Key] public int Id { get; set; }

        public string UserId { get; set; }
        public string ClaimType { get; set; }
        public string ClaimValue { get; set; }
    }
}
