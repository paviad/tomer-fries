using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Api.DAL;
using Api.Models;
using Microsoft.EntityFrameworkCore;

namespace Api {
    public class UsersAdapter {
        private readonly StarcraftContext _dc;

        public UsersAdapter(StarcraftContext dc) {
            _dc = dc;
        }

        public async Task<DAL.UserData> EnsureGetUserData(Guid guid, string key) {
            var userData = await _dc.UserDatas.SingleOrDefaultAsync(x => x.UserId == guid.ToString() && x.Key == key);

            if (userData != null) {
                return userData;
            }

            userData = new DAL.UserData {
                UserId = guid.ToString(),
                Key = key,
            };
            await _dc.UserDatas.AddAsync(userData);
            await _dc.SaveChangesAsync();

            return userData;
        }

        public async Task EnsureSetUserData(Guid guid, string data, string key) {
            var userData = await _dc.UserDatas.SingleOrDefaultAsync(x => x.UserId == guid.ToString() && x.Key == key);

            if (userData == null) {
                userData = new DAL.UserData {
                    UserId = guid.ToString(),
                    Key = key,
                };
                await _dc.UserDatas.AddAsync(userData);
                await _dc.SaveChangesAsync();
            }

            userData.JsonData = data;
            await _dc.SaveChangesAsync();
        }

        public async Task<IEnumerable<User>> GetUsers() {
            var userIds = await _dc.UserDatas.Select(x => x.UserId).Distinct().ToListAsync();

            var names = await _dc.AppUsers
                .Where(x => x.ClaimType == "name")
                .Where(x => userIds.Contains(x.UserId))
                .ToDictionaryAsync(x => Guid.Parse(x.UserId), x => x.ClaimValue);

            var rc = userIds.Select(x => new User {
                Id = Guid.Parse(x),
                Name = names[Guid.Parse(x)]
            });

            return rc;
        }
    }
}
