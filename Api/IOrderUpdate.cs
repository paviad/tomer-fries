using System;
using System.Threading.Tasks;
using Api.Models;

namespace Api {
    public interface IOrderUpdate {
        Task UpdateOrder(Order order);
        Task UpdateOrderTracking(Order order);
        Task ResetOrder(Guid id);
    }
}
