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
using Microsoft.EntityFrameworkCore;

namespace Api.Controllers {
    [ApiController]
    [Route("[controller]/[action]")]
    public class OrdersController : ControllerBase {
        private readonly StarcraftContext _dc;

        public OrdersController(StarcraftContext dc) {
            _dc = dc;
        }

        [Authorize(Policy = "Admin")]
        [HttpGet]
        public async Task<IEnumerable<Order>> GetAllOrders() {
            var ord = new Order {
            };
            return new List<Order> { ord };
        }

        [Authorize]
        [HttpGet]
        public async Task<Order> GetOrder(Guid? id = null) {
            var userId = Guid.Parse(User.FindFirst(ClaimTypes.NameIdentifier)!.Value);
            var loggedIn = User.FindFirst("LoggedIn") != null;

            Data.DAL.Order order;
            if (id == null) {
                order = await EnsureGetOrder(userId);
            }
            else {
                order = await GetExistingOrder(userId, id.Value);
            }

            var rc = ConvertFromDb(order);

            return rc;
        }

        private static Order ConvertFromDb(Data.DAL.Order order) {
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

        private async Task<Data.DAL.Order> EnsureGetOrder(Guid userId) {
            var userIdStr = userId.ToString();
            var order = await _dc.Orders.Where(x => x.UserId == userIdStr && x.State < 3).SingleOrDefaultAsync();

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
            }

            return order;
        }

        private async Task ResetOrder(Guid userId) {
            var userIdStr = userId.ToString();
            var order = await _dc.Orders.Where(x => x.UserId == userIdStr && x.State < 3).SingleOrDefaultAsync();

            if (order == null) {
                return;
            }

            _dc.Orders.Remove(order);
            await _dc.SaveChangesAsync();
        }

        private async Task<Data.DAL.Order> GetExistingOrder(Guid userId, Guid id) {
            var userIdStr = userId.ToString();
            var order = await _dc.Orders.Where(x => x.UserId == userIdStr && x.Id == id).SingleOrDefaultAsync();
            return order;
        }

        [Authorize]
        [HttpPost]
        public async Task<Order> SetSize(int size) {
            var userId = Guid.Parse(User.FindFirst(ClaimTypes.NameIdentifier)!.Value);
            var loggedIn = User.FindFirst("LoggedIn") != null;
            var order = await EnsureGetOrder(userId);
            order.Size = size;
            order.State = 1;
            await _dc.SaveChangesAsync();
            var rc = ConvertFromDb(order);
            return rc;
        }

        [Authorize]
        [HttpPost]
        public async Task<Order> SetData(OrderData data) {
            var userId = Guid.Parse(User.FindFirst(ClaimTypes.NameIdentifier)!.Value);
            var loggedIn = User.FindFirst("LoggedIn") != null;
            var order = await EnsureGetOrder(userId);
            order.Address = data.Address;
            order.Phone = data.PhoneNumber;
            order.IsCrispy = data.Crispiness == 1;
            order.Notes = data.Notes;
            order.State = 2;
            await _dc.SaveChangesAsync();
            var rc = ConvertFromDb(order);
            return rc;
        }

        [Authorize]
        [HttpPost]
        public async Task<Order> ConfirmOrder() {
            var userId = Guid.Parse(User.FindFirst(ClaimTypes.NameIdentifier)!.Value);
            var loggedIn = User.FindFirst("LoggedIn") != null;
            var order = await EnsureGetOrder(userId);
            order.State = 3;
            await _dc.SaveChangesAsync();
            var rc = ConvertFromDb(order);
            return rc;
        }


        [Authorize]
        [HttpPost]
        public async Task ResetOrder() {
            var userId = Guid.Parse(User.FindFirst(ClaimTypes.NameIdentifier)!.Value);
            var loggedIn = User.FindFirst("LoggedIn") != null;
            await ResetOrder(userId);
        }
    }
}
