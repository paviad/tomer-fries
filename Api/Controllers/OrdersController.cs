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
using Microsoft.AspNetCore.SignalR;
using Microsoft.EntityFrameworkCore;

namespace Api.Controllers {
    [ApiController]
    [Route("[controller]/[action]")]
    public class OrdersController : ControllerBase {
        private readonly StarcraftContext _dc;
        private readonly IHubContext<OrderHub, IOrderUpdate> _hub;

        public OrdersController(StarcraftContext dc, IHubContext<OrderHub, IOrderUpdate> hub) {
            _dc = dc;
            _hub = hub;
        }

        [Authorize(Policy = "Admin")]
        [HttpGet]
        public async Task<IEnumerable<Order>> GetAllOrders() {
            var orders = await _dc.Orders.Where(x => x.State == 3 && x.TrackingState < 3).ToListAsync();
            var rc = orders.Select(ConvertFromDb);
            return rc;
        }

        [Authorize]
        [HttpGet]
        public async Task<Order> GetOrder(Guid? id = null) {
            var userIdStr = User.FindFirst(ClaimTypes.NameIdentifier)!.Value;
            var userId = Guid.Parse(userIdStr);
            var loggedIn = User.FindFirst("LoggedIn") != null;

            Data.DAL.Order order;
            bool created = false;
            if (id == null) {
                (order, created) = await EnsureGetOrder(userId);
            }
            else {
                order = await GetExistingOrder(userId, id.Value);
            }

            var rc = ConvertFromDb(order);

            if (created) {
                await _hub.Clients.User(order.UserId).UpdateOrder(rc);
            }

            return rc;
        }

        [Authorize]
        [HttpPost]
        public async Task<Order> SetSize(int size) {
            var userIdStr = User.FindFirst(ClaimTypes.NameIdentifier)!.Value;
            var userId = Guid.Parse(userIdStr);
            var loggedIn = User.FindFirst("LoggedIn") != null;
            var (order, _) = await EnsureGetOrder(userId);
            order.Size = size;
            order.State = 1;
            await _dc.SaveChangesAsync();
            var rc = ConvertFromDb(order);

            await _hub.Clients.User(order.UserId).UpdateOrder(rc);

            return rc;
        }

        [Authorize]
        [HttpPost]
        public async Task<Order> SetData(OrderData data) {
            var userIdStr = User.FindFirst(ClaimTypes.NameIdentifier)!.Value;
            var userId = Guid.Parse(userIdStr);
            var loggedIn = User.FindFirst("LoggedIn") != null;
            var (order, _) = await EnsureGetOrder(userId);
            order.Address = data.Address;
            order.Phone = data.PhoneNumber;
            order.IsCrispy = data.Crispiness == 1;
            order.Notes = data.Notes;
            order.State = 2;
            await _dc.SaveChangesAsync();
            var rc = ConvertFromDb(order);

            await _hub.Clients.User(order.UserId).UpdateOrder(rc);

            return rc;
        }

        [Authorize]
        [HttpPost]
        public async Task<Order> ConfirmOrder() {
            var userIdStr = User.FindFirst(ClaimTypes.NameIdentifier)!.Value;
            var userId = Guid.Parse(userIdStr);
            var loggedIn = User.FindFirst("LoggedIn") != null;
            var (order, _) = await EnsureGetOrder(userId);
            order.State = 3;
            await _dc.SaveChangesAsync();
            var rc = ConvertFromDb(order);

            await _hub.Clients.User(order.UserId).UpdateOrder(rc);
            await _hub.Clients.Group("admin").UpdateOrderTracking(rc);

            return rc;
        }

        [Authorize]
        [HttpPost]
        public async Task ResetOrder() {
            var userId = Guid.Parse(User.FindFirst(ClaimTypes.NameIdentifier)!.Value);
            var loggedIn = User.FindFirst("LoggedIn") != null;
            var id = await ResetOrder(userId);
            if (id.HasValue) {
                await _hub.Clients.All.ResetOrder(id.Value);
            }
        }

        [Authorize(Policy = "Admin")]
        [HttpPost]
        public async Task<Order> StartPreparing(Guid id) {
            var order = await GetOrderForAdmin(id);
            if (order.TrackingState == 0) {
                order.TrackingState = 1;
                await _dc.SaveChangesAsync();
            }

            var rc = ConvertFromDb(order);

            await _hub.Clients.Group("admin").UpdateOrderTracking(rc);
            await _hub.Clients.User(order.UserId).UpdateOrderTracking(rc);

            return rc;
        }

        [Authorize(Policy = "Admin")]
        [HttpPost]
        public async Task<Order> StartDelivery(Guid id) {
            var order = await GetOrderForAdmin(id);
            if (order.TrackingState == 1) {
                order.TrackingState = 2;
                await _dc.SaveChangesAsync();
            }

            var rc = ConvertFromDb(order);

            await _hub.Clients.Group("admin").UpdateOrderTracking(rc);
            await _hub.Clients.User(order.UserId).UpdateOrderTracking(rc);

            return rc;
        }

        [Authorize(Policy = "Admin")]
        [HttpPost]
        public async Task<Order> PaymentReceived(Guid id) {
            var order = await GetOrderForAdmin(id);
            if (order.TrackingState == 2) {
                order.TrackingState = 3;
                await _dc.SaveChangesAsync();
            }

            var rc = ConvertFromDb(order);

            await _hub.Clients.Group("admin").UpdateOrderTracking(rc);
            await _hub.Clients.User(order.UserId).UpdateOrderTracking(rc);

            return rc;
        }

        [Authorize(Policy = "Admin")]
        [HttpPost]
        public async Task CancelOrder(Guid id) {
            var order = await GetOrderForAdmin(id);

            if (order == null) {
                return;
            }

            _dc.Orders.Remove(order);
            await _dc.SaveChangesAsync();

            await _hub.Clients.All.ResetOrder(id);
        }

        private static Order ConvertFromDb(Data.DAL.Order order) {
            if (order == null) {
                return null;
            }

            var rc = new Order {
                UserId = Guid.Parse(order.UserId),
                State = order.State,
                TrackingState = order.TrackingState,
                Notes = order.Notes,
                DateCreated = order.DateCreated,
                Address = order.Address,
                Id = order.Id,
                IsCrispy = order.IsCrispy,
                Phone = order.Phone,
                Size = order.Size,
            };
            return rc;
        }

        private async Task<(Data.DAL.Order, bool)> EnsureGetOrder(Guid userId) {
            var userIdStr = userId.ToString();
            var order = await _dc.Orders
                .Where(x => x.UserId == userIdStr && x.TrackingState < 3)
                .OrderByDescending(x => x.DateCreated)
                .FirstOrDefaultAsync();
            var created = false;

            if (order == null) {
                order = new Data.DAL.Order {
                    Id = Guid.NewGuid(),
                    UserId = userId.ToString(),
                    State = 0,
                    TrackingState = 0,
                    DateCreated = DateTimeOffset.Now,
                };

                await _dc.Orders.AddAsync(order);
                await _dc.SaveChangesAsync();

                created = true;
            }

            return (order, created);
        }

        private async Task<Guid?> ResetOrder(Guid userId) {
            var userIdStr = userId.ToString();
            var order = await _dc.Orders.Where(x => x.UserId == userIdStr && x.State < 3).SingleOrDefaultAsync();

            if (order == null) {
                return null;
            }

            _dc.Orders.Remove(order);
            await _dc.SaveChangesAsync();

            return order.Id;
        }

        private async Task<Data.DAL.Order> GetExistingOrder(Guid userId, Guid id) {
            var userIdStr = userId.ToString();
            var order = await _dc.Orders.Where(x => x.UserId == userIdStr && x.Id == id).SingleOrDefaultAsync();
            return order;
        }

        private async Task<Data.DAL.Order> GetOrderForAdmin(Guid id) {
            var order = await _dc.Orders.Where(x => x.Id == id).SingleOrDefaultAsync();
            return order;
        }
    }
}
