using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.DAL {
    public class Order {
        [Key]
        public Guid Id { get; set; }
        public string UserId { get; set; }
        public int Size { get; set; }
        public string Address { get; set; }
        public string Phone { get; set; }
        public bool IsCrispy { get; set; }
        public string Notes { get; set; }
        public int State { get; set; }
        public int TrackingState { get; set; }
        public DateTimeOffset DateCreated { get; set; }
    }
}
