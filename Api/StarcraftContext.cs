using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

namespace Api {
    public class StarcraftContext : DbContext {
        public StarcraftContext(DbContextOptions<StarcraftContext> options) : base(options) {
        }
        
        public DbSet<DAL.UserData> UserDatas { get; set; }
    }
}
