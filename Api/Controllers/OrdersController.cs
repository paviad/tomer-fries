using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using Api.Models;
using Data;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers {
    [ApiController]
    [Route("[controller]/[action]")]
    public class OrdersController : ControllerBase {
        private readonly StarcraftContext _dc;

        public OrdersController(StarcraftContext dc) {
            _dc = dc;
        }

        [Authorize(Policy = "Admin")]
        public async Task<IEnumerable<Order>> GetAllOrders() {
            var ord = new Order {
            };
            return new List<Order> { ord };
        }

        [Authorize]
        public async Task<Order> NewOrder() {
            var userId = Guid.Parse(User.FindFirst(ClaimTypes.NameIdentifier).Value);
            var loggedIn = User.FindFirst("LoggedIn") != null;
            return new Order {
                UserId = userId,
                Notes = loggedIn ? "Logged In" : "Anonymous",
            };
        }
    }
}
