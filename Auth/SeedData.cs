// Copyright (c) Brock Allen & Dominick Baier. All rights reserved.
// Licensed under the Apache License, Version 2.0. See LICENSE in the project root for license information.


using System;
using System.Linq;
using System.Security.Claims;
using Auth.Data;
using Auth.Models;
using IdentityModel;
using IdentityServer4.EntityFramework.DbContexts;
using IdentityServer4.EntityFramework.Mappers;
using IdentityServer4.EntityFramework.Options;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Serilog;

namespace Auth {
    public class SeedData {
        public static void EnsureSeedData(string connectionString) {
            var services = new ServiceCollection();
            services.AddLogging();
            services.AddDbContext<ApplicationDbContext>(options =>
                options.UseSqlServer(connectionString));

            services.AddDbContext<PersistedGrantDbContext>(options =>
                options.UseSqlServer(connectionString));

            services.AddDbContext<ConfigurationDbContext>(options =>
                options.UseSqlServer(connectionString));

            services
                .AddIdentityServer()
                .AddConfigurationStore<ConfigurationDbContext>(options => {
                    options.ConfigureDbContext = builder => builder.UseSqlServer(connectionString,
                        sql => sql.MigrationsAssembly(typeof(Startup).Assembly.FullName));
                    var tableConfigs = options.GetType().GetProperties()
                        .Where(x => x.PropertyType == typeof(TableConfiguration)).ToList();
                    tableConfigs.ForEach(x => {
                        var cv = (TableConfiguration)x.GetValue(options);
                        cv.Name = "Is4_" + cv.Name;
                    });
                })
                // this adds the operational data from DB (codes, tokens, consents)
                .AddOperationalStore<PersistedGrantDbContext>(options => {
                    options.ConfigureDbContext = builder => builder.UseSqlServer(connectionString,
                        sql => sql.MigrationsAssembly(typeof(Startup).Assembly.FullName));
                    var tableConfigs = options.GetType().GetProperties()
                        .Where(x => x.PropertyType == typeof(TableConfiguration)).ToList();
                    tableConfigs.ForEach(x => {
                        var cv = (TableConfiguration)x.GetValue(options);
                        cv.Name = "Is4_" + cv.Name;
                    });

                    // this enables automatic token cleanup. this is optional.
                    options.EnableTokenCleanup = true;
                });


            services.AddIdentity<ApplicationUser, IdentityRole>()
                .AddEntityFrameworkStores<ApplicationDbContext>()
                .AddDefaultTokenProviders();

            using var serviceProvider = services.BuildServiceProvider();
            using var scope = serviceProvider.GetRequiredService<IServiceScopeFactory>().CreateScope();

            var scopeServiceProvider = scope.ServiceProvider;

            InitializeIdentityServer(scopeServiceProvider);
            InitializeIdentity(scopeServiceProvider);
        }

        private static void InitializeIdentity(IServiceProvider scopeServiceProvider) {
            var context = scopeServiceProvider.GetService<ApplicationDbContext>();
            context.Database.Migrate();

            var userMgr = scopeServiceProvider.GetRequiredService<UserManager<ApplicationUser>>();
            var alice = userMgr.FindByNameAsync("alice").Result;
            if (alice == null) {
                alice = new ApplicationUser {
                    UserName = "alice",
                    Email = "AliceSmith@email.com",
                    EmailConfirmed = true
                };
                var result = userMgr.CreateAsync(alice, "Pass123$").Result;
                if (!result.Succeeded) {
                    throw new Exception(result.Errors.First().Description);
                }

                result = userMgr.AddClaimsAsync(alice, new[] {
                    new Claim(JwtClaimTypes.Name, "Alice Smith"),
                    new Claim(JwtClaimTypes.GivenName, "Alice"),
                    new Claim(JwtClaimTypes.FamilyName, "Smith"),
                    new Claim(JwtClaimTypes.WebSite, "http://alice.com")
                }).Result;
                if (!result.Succeeded) {
                    throw new Exception(result.Errors.First().Description);
                }

                Log.Debug("alice created");
            }
            else {
                Log.Debug("alice already exists");
            }

            var bob = userMgr.FindByNameAsync("bob").Result;
            if (bob == null) {
                bob = new ApplicationUser {
                    UserName = "bob",
                    Email = "BobSmith@email.com",
                    EmailConfirmed = true
                };
                var result = userMgr.CreateAsync(bob, "Pass123$").Result;
                if (!result.Succeeded) {
                    throw new Exception(result.Errors.First().Description);
                }

                result = userMgr.AddClaimsAsync(bob, new[] {
                    new Claim(JwtClaimTypes.Name, "Bob Smith"),
                    new Claim(JwtClaimTypes.GivenName, "Bob"),
                    new Claim(JwtClaimTypes.FamilyName, "Smith"),
                    new Claim(JwtClaimTypes.WebSite, "http://bob.com"),
                    new Claim("location", "somewhere")
                }).Result;
                if (!result.Succeeded) {
                    throw new Exception(result.Errors.First().Description);
                }

                Log.Debug("bob created");
            }
            else {
                Log.Debug("bob already exists");
            }
        }

        private static void InitializeIdentityServer(IServiceProvider svcp) {
            using var serviceScope = svcp.GetService<IServiceScopeFactory>().CreateScope();
            serviceScope.ServiceProvider.GetRequiredService<PersistedGrantDbContext>().Database.Migrate();

            var context = serviceScope.ServiceProvider.GetRequiredService<ConfigurationDbContext>();
            context.Database.Migrate();
            if (!context.Clients.Any()) {
                foreach (var client in Config.Clients) {
                    context.Clients.Add(client.ToEntity());
                }
                context.SaveChanges();
            }

            if (!context.IdentityResources.Any()) {
                foreach (var resource in Config.IdentityResources) {
                    context.IdentityResources.Add(resource.ToEntity());
                }
                context.SaveChanges();
            }

            if (!context.ApiScopes.Any()) {
                foreach (var resource in Config.ApiScopes) {
                    context.ApiScopes.Add(resource.ToEntity());
                }
                context.SaveChanges();
            }

            if (!context.ApiResources.Any()) {
                foreach (var resource in Config.ApiResources) {
                    context.ApiResources.Add(resource.ToEntity());
                }
                context.SaveChanges();
            }
        }
    }
}