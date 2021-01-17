using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Data.DAL {
    public class UserData {
        [Key, DatabaseGenerated(DatabaseGeneratedOption.Identity)] public int Id { get; set; }
        public string UserId { get; set; }
        public string Key { get; set; }

        public string JsonData { get; set; }
    }
}
