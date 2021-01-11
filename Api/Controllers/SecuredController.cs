using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using Api.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace Api.Controllers {
    [ApiController]
    [Route("[controller]/[action]")]
    [Authorize]
    public class SecuredController : ControllerBase {
        private ILogger<SecuredController> _logger;
        private readonly UsersAdapter _usersAdapter;

        public SecuredController(ILogger<SecuredController> logger, UsersAdapter usersAdapter) {
            _logger = logger;
            _usersAdapter = usersAdapter;
        }

        public async Task<string> GetData(string key = "general") {
            var currentUser = User.FindFirst(ClaimTypes.NameIdentifier)!.Value;
            var guid = Guid.Parse(currentUser);
            var rc = await _usersAdapter.EnsureGetUserData(guid, key);
            return rc.JsonData;
        }

        [HttpPost]
        public async Task SetData([FromBody] SetDataModel model) {
            var currentUser = User.FindFirst(ClaimTypes.NameIdentifier)!.Value;
            var guid = Guid.Parse(currentUser);
            await _usersAdapter.EnsureSetUserData(guid, model.Data, model.Key ?? "general");
        }
    }
}
