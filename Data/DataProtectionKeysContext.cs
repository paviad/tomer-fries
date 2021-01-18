using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Data;
using Microsoft.AspNetCore.DataProtection.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace Data {
    public class DataProtectionKeysContext : DbContext, IDataProtectionKeyContext {
        public DataProtectionKeysContext(DbContextOptions<DataProtectionKeysContext> options) : base(options) {
        }

        public DbSet<DataProtectionKey> DataProtectionKeys { get; set; }
    }
}
