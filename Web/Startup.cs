using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Security.Claims;
using System.Security.Principal;
using System.Text.Json;
using Data;
using Microsoft.AspNetCore.Antiforgery;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.DataProtection;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Http.Extensions;
using Microsoft.AspNetCore.SpaServices.AngularCli;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Options;

namespace Web {
    public class Startup {
        public Startup(IConfiguration configuration) {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services) {
            services.AddControllersWithViews();
            // In production, the Angular files will be served from this directory
            services.AddSpaStaticFiles(
                configuration => { configuration.RootPath = "ClientApp/dist/ClientApp/browser"; });
            services.AddOptions<Deployment>()
                .Bind(Configuration.GetSection("Deployment"));

            services.AddAuthentication()
                .AddCookie("AnonCookie", options => {
                    options.Cookie.Path = "/";
                });

            // Add a DbContext to store your Database Keys
            services.AddDbContext<StarcraftContext>(options => {
                var connectionString = Configuration.GetConnectionString("DefaultConnection");
                Console.WriteLine($"-------------Connection String {connectionString}");
                options.UseSqlServer(connectionString);
            });

            services.AddDataProtection()
                .PersistKeysToDbContext<StarcraftContext>()
                .SetApplicationName("TomerFries");
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env) {
            if (env.IsDevelopment()) {
                app.UseDeveloperExceptionPage();
            }
            else {
                app.UseExceptionHandler("/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }

            app.UseAuthentication();

            app.Use(async (context, req) => {
                Console.WriteLine("----------------request");
                var isAuth = await context.AuthenticateAsync("AnonCookie");
                if (!isAuth.Succeeded) {
                    //if (!context.User.Identity?.IsAuthenticated ?? false) {
                    var newGuid = Guid.NewGuid();
                    Console.WriteLine($"----------------not auth {newGuid}");
                    var claims = new List<Claim> {
                        new Claim(ClaimTypes.NameIdentifier, newGuid.ToString())
                    };
                    var identity = new ClaimsIdentity(claims, "AnonCookie");
                    var principal = new ClaimsPrincipal(identity);
                    await context.SignInAsync("AnonCookie", principal);
                }
                else {
                    await context.SignInAsync("AnonCookie", isAuth.Principal);
                    //var id = context.User.FindFirst(ClaimTypes.NameIdentifier).Value;
                    var id = isAuth.Principal.FindFirst(ClaimTypes.NameIdentifier).Value;
                    Console.WriteLine($"----------------auth id {id}");
                }
                await req.Invoke();
            });

            app.Use(async (context, req) => {
                var isAuth = await context.AuthenticateAsync("AnonCookie");
                Console.WriteLine($"----------------request 2 {isAuth.Succeeded}");
                await req.Invoke();
            });

            app.UseHttpsRedirection();
            app.UseStaticFiles();
            //if (!env.IsDevelopment())
            {
                app.UseSpaStaticFiles();
            }

            app.UseRouting();

            app.UseEndpoints(endpoints => {
                endpoints.MapControllerRoute(
                    "default",
                    "{controller}/{action=Index}/{id?}");
            });

            app.UseSsr();

            app.UseSpa(spa => {
                // To learn more about options for serving an Angular SPA from ASP.NET Core,
                // see https://go.microsoft.com/fwlink/?linkid=864501

                spa.Options.SourcePath = "ClientApp";

                //if (env.IsDevelopment()) {
                //    spa.UseAngularCliServer("start");
                //}
            });
        }
    }
}