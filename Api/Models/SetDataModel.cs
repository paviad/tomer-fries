using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Api.Models
{
    public class SetDataModel
    {
        public Guid? UserId { get; set; }
        public string Key { get; set; }
        public string Data { get; set; }
    }
}
