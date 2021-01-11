using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
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
    }
}
