using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Api.Models;
using Data;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers {
    [ApiController]
    [Route("[controller]/[action]")]
    public class OrdersController: ControllerBase {
        private readonly StarcraftContext _dc;

        public OrdersController(StarcraftContext dc) {
            _dc = dc;
        }

        public async Task<Order> NewOrder() {
            return new Order();
        }
    }
}
