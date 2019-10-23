using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(DFLWebForm.Startup))]
namespace DFLWebForm
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
