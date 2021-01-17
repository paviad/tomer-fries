using Data.DAL;
using Microsoft.AspNetCore.DataProtection.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace Data {
    public class StarcraftContext : DbContext, IDataProtectionKeyContext {
        public StarcraftContext(DbContextOptions<StarcraftContext> options) : base(options) {
        }
        
        public DbSet<UserData> UserDatas { get; set; }
        public DbSet<AppUser> AppUsers { get; set; }
        public DbSet<DataProtectionKey> DataProtectionKeys { get; set; }
    }
}
