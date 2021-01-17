using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Api.Models {
    public class Order {
        public Guid Id { get; set; }
        public Guid UserId { get; set; }
        public string Address { get; set; }
        public string Phone { get; set; }
        public bool IsCrispy { get; set; }
        public string Notes { get; set; }
        public int State { get; set; }
        public DateTime DateCreated { get; set; }
    }
}
