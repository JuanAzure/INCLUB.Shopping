using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Ocelot.DependencyInjection;
using Ocelot.Middleware;

namespace INCLUB.Shopping.Gateway
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }
        readonly string MyPolicy = "_myPolicy";
        public void ConfigureServices(IServiceCollection services)
        {
            /*Start - Cors*/
            services.AddCors(o => o.AddPolicy(MyPolicy, builder =>
            {
                builder.AllowAnyOrigin()
                       .AllowAnyMethod()
                       .AllowAnyHeader();

            }));
            services.AddRouting(r => r.SuppressCheckForUnhandledSecurityMetadata = true);
            /*End - Cors*/

            services.AddOcelot();

        }

        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            /*Start - Cors*/
            app.UseCors(MyPolicy);
            app.Use((context, next) =>
            {
                context.Items["__CorsMiddlewareInvoked"] = true;
                return next();
            });
            /*End - Cors*/

            app.UseOcelot().Wait();
        }
    }
}
