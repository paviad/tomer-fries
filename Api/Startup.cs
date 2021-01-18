using System;
using System.Collections.Generic;
using System.Diagnostics.Tracing;
using System.Security.Claims;
using System.Threading.Tasks;
using Data;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.DataProtection;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.IdentityModel.Logging;
using Microsoft.IdentityModel.Protocols;
using Microsoft.IdentityModel.Protocols.OpenIdConnect;
using Microsoft.IdentityModel.Tokens;
using Newtonsoft.Json;

namespace Api {
    public class Startup {
        public Startup(IConfiguration configuration) {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services) {
            services.AddControllers();

            IdentityModelEventSource.Logger.LogLevel = EventLevel.LogAlways;
            IdentityModelEventSource.ShowPII = true;

            services.AddAuthentication("JwtThenAnon")
                .AddPolicyScheme("JwtThenAnon", "Jwt if available, Anon otherwise", options => {
                    options.ForwardDefaultSelector = context => {
                        var isAuthJwt = context.AuthenticateAsync(JwtBearerDefaults.AuthenticationScheme).Result;
                        Console.WriteLine($"-----------JwtThenAnon {isAuthJwt.Succeeded}");
                        return isAuthJwt.Succeeded ? JwtBearerDefaults.AuthenticationScheme : "AnonCookie";
                    };
                })
                .AddCookie("AnonCookie", options => {
                    options.Cookie.Path = "/";
                })
                .AddJwtBearer(config => {
                    config.Authority = "http://auth/auth";
                    config.MetadataAddress = "http://auth/auth/.well-known/openid-configuration";

                    config.Configuration = new OpenIdConnectConfiguration {
                        Issuer = "http://auth/auth",
                        JwksUri = "http://auth/auth/.well-known/openid-configuration/jwks",
                        AuthorizationEndpoint = "http://auth/auth/connect/authorize",
                        TokenEndpoint = "http://auth/auth/connect/token",
                        UserInfoEndpoint = "http://auth/auth/connect/userinfo",
                        IntrospectionEndpoint = "http://auth/auth/connect/introspect",
                        EndSessionEndpoint = "http://auth/auth/connect/endsession",
                        TokenEndpointAuthSigningAlgValuesSupported = { "RS256" },
                        IdTokenSigningAlgValuesSupported = { "RS256" },
                    };
                    config.RequireHttpsMetadata = false;
                    config.TokenValidationParameters = new TokenValidationParameters {
                        ValidateAudience = false,
                        IssuerSigningKeyResolver = KeyResolver,
                    };

                    config.IncludeErrorDetails = true;

                    config.Events = new JwtBearerEvents {
                        OnMessageReceived = context => {
                            var accessToken = context.Request.Query["access_token"];

                            // If the request is for our hub...
                            var path = context.HttpContext.Request.Path;
                            if (!string.IsNullOrEmpty(accessToken) &&
                                (path.StartsWithSegments("/api/ws"))) {
                                // Read the token out of the query string
                                context.Token = accessToken;
                                Console.WriteLine($"-------------Access token {accessToken}");
                            }
                            return Task.CompletedTask;
                        },
                        OnTokenValidated = context => {
                            ((ClaimsIdentity)context.Principal?.Identity)?.AddClaim(new Claim("LoggedIn", "True"));
                            return Task.CompletedTask;
                        },
                    };
                });

            services.AddCors(config => {
                config.AddPolicy("defaultAng", builder => {
                    builder.AllowAnyHeader();
                    builder.AllowAnyMethod();
                    builder.WithOrigins("http://localhost:4200");
                    builder.WithOrigins("https://localhost:8081");
                    builder.WithOrigins("https://tomer-fries.azurewebsites.net");
                    builder.WithOrigins("https://tomerfries.com");
                    builder.WithOrigins("http://auth");
                    builder.WithOrigins("https://localhost:44314");
                });
            });

            var connectionString = Configuration.GetConnectionString("DefaultConnection");

            services.AddDbContext<StarcraftContext>(
                config => config
                    .EnableSensitiveDataLogging()
                    .UseSqlServer(connectionString, b => b.MigrationsAssembly("Api"))
            );

            services.AddDbContext<DataProtectionKeysContext>(
                config => config.UseSqlServer(connectionString)
            );

            services.AddScoped<UsersAdapter>();

            services.AddAuthorization(options => {
                options.AddPolicy("Admin", policy => policy.RequireClaim("Admin", "True"));
            });

            services.AddDataProtection()
                .PersistKeysToDbContext<DataProtectionKeysContext>()
                .SetApplicationName("TomerFries");

            services.AddSignalR(options => {
                options.EnableDetailedErrors = true;
            });
        }

        private IEnumerable<SecurityKey> KeyResolver(string token, SecurityToken securitytoken, string kid, TokenValidationParameters validationparameters) {
            var docRetriever = new HttpDocumentRetriever { RequireHttps = false };
            var keysJson = docRetriever.GetDocumentAsync("http://auth/auth/.well-known/openid-configuration/jwks", default)
                .Result;
            var keys = JsonConvert.DeserializeObject<JsonWebKeySet>(keysJson).GetSigningKeys();
            return keys;
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env) {
            if (env.IsDevelopment()) {
                app.UseDeveloperExceptionPage();
            }

            app.UseAuthentication();

            app.UseHttpsRedirection();

            app.UseCors("defaultAng");
            app.UsePathBase("/api");

            app.UseRouting();
            app.UseAuthentication();
            app.UseAuthorization();

            app.UseEndpoints(endpoints => {
                endpoints.MapControllers();
                endpoints.MapHub<OrderHub>("/ws");
            });
        }
    }
}
