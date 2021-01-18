using System;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.SignalR;

namespace Api {
    public class OrderHub : Hub<IOrderUpdate> {
        public override async Task OnConnectedAsync() {
            var claims = string.Join(", ", Context.User.Claims.Select(x => $"{x.Type}={x.Value}"));
            Console.WriteLine($"Websocket connected '{Context.User}', {claims}");
            var admin = Context.User?.FindFirst("admin")?.Value == "True";
            if (admin) {
                Console.WriteLine("Websocket connected - admin");
                await Groups.AddToGroupAsync(Context.ConnectionId, "admin");
            }
            await base.OnConnectedAsync();
        }
    }
}