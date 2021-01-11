using System;
using System.Collections.Generic;
using System.Diagnostics.Tracing;
using System.IdentityModel.Tokens.Jwt;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
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

            var g = new MyEventListener();
            g.EnableEvents(IdentityModelEventSource.Logger, EventLevel.LogAlways);

            services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
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
                    // config.Events = new MyEvents();
                    config.IncludeErrorDetails = true;
                });

            services.AddCors(config => {
                config.AddPolicy("defaultAng", builder => {
                    builder.AllowAnyHeader();
                    builder.AllowAnyMethod();
                    builder.WithOrigins("http://localhost:4200");
                    builder.WithOrigins("https://localhost:8081");
                    builder.WithOrigins("https://starcraft-rpg.azurewebsites.net");
                    builder.WithOrigins("http://auth");
                    builder.WithOrigins("https://localhost:44314");
                });
            });

            var connectionString = Configuration.GetConnectionString("DefaultConnection");

            services.AddDbContext<StarcraftContext>(
                config => config
                    .EnableSensitiveDataLogging()
                    .UseSqlServer(connectionString)
            );

            services.AddScoped<UsersAdapter>();
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

            app.UseHttpsRedirection();

            app.UseCors("defaultAng");
            app.UsePathBase("/api");

            app.UseRouting();
            app.UseAuthentication();
            app.UseAuthorization();

            app.UseEndpoints(endpoints => { endpoints.MapControllers(); });
        }
    }

    public class MyEventListener : EventListener {
        protected override void OnEventWritten(EventWrittenEventArgs e) {
            foreach (object payload in e.Payload) {
                Console.WriteLine($"[{e.EventName}] {e.Message} | {payload}");
            }
            base.OnEventWritten(e);
        }
    }

    public class MyEvents : JwtBearerEvents {
        public override Task MessageReceived(MessageReceivedContext context) {
            var token = context.HttpContext.Request.Headers["Authorization"].ToString();
            context.Token = token.Substring(7);
            Console.WriteLine($"MessageReceived--------------------------\n{token}\n\n");
            return base.MessageReceived(context);
        }

        public override Task AuthenticationFailed(AuthenticationFailedContext context) {
            Console.WriteLine($"AuthenticationFailed--------------------------\n{context.Exception}\n\n");
            return base.AuthenticationFailed(context);
        }

        public override Task Challenge(JwtBearerChallengeContext context) {
            Console.WriteLine("Challenge--------------------------");
            return base.Challenge(context);
        }

        public override Task Forbidden(ForbiddenContext context) {
            Console.WriteLine("Forbidden--------------------------");
            return base.Forbidden(context);
        }
        public override Task TokenValidated(TokenValidatedContext context) {
            Console.WriteLine("TokenValidated--------------------------");
            return base.TokenValidated(context);
        }
    }
}
