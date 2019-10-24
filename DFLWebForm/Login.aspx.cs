//INSTANT C# NOTE: Formerly VB project-level imports:

using System;
using System.Data;
using System.Linq;
using System.Web.UI.WebControls;

namespace DFLWebForm
{
    public partial class Login : System.Web.UI.Page
    {
        public Login()
        {
            Load += Page_Load;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            LoginError.Visible = false;
        }

        protected void BtnLogin_OnClick(object sender, EventArgs e)
        {
            Models.AdminApp row = null;
            bool result = false;

            using (Models.DataEntities context = new Models.DataEntities())
            {
                row = (
                    from p in context.AdminApp
                    where p.Username == AdminUsername.Text.Trim() && p.Password == AdminPassword.Text.Trim()
                    select p).FirstOrDefault();
            }

            if (row != null)
            {
                LoginError.Visible = false;
                Session["UserAdmin"] = "admin";
                result = true;
                Response.Redirect("default.aspx");
            }
            else
            {
                LoginError.Visible = true;
            }
        }
    }
}