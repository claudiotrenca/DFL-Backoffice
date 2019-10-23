//INSTANT C# NOTE: Formerly VB project-level imports:
using System;
using System.Data;
using System.Linq;
using System.Web.UI.WebControls;

namespace DFLWebForm
{
    
        public partial class Login : System.Web.UI.Page
        {
            protected void Page_Load(object sender, System.EventArgs e)
            {
                if (!IsPostBack)
                {
                    LoginError.Visible = false;
                }
            }

            private void BtnLogin_Click(object sender, EventArgs e)
            {
             //   Models.Admin row = null;
                bool result = false;

                //using (Models.DataEntities context = new Models.DataEntities())
                //{
                //    row = (
                //        from p in context.Admin
                //        where p.Username == AdminUsername.Text.Trim() && p.Password == AdminPassword.Text.Trim()
                //        select p).FirstOrDefault();
                //}

                if (AdminUsername.Text.Trim() == "admin" && AdminPassword.Text.Trim() == "dflgroup")
                {
                    Session["UserAdmin"] = "admin";
                    result = true;
                    Response.Redirect("default.aspx");
                }

                
            }

            override protected void OnInit(EventArgs e)
            {
                //INSTANT C# NOTE: Converted event handler wireups:
                this.Load += Page_Load;
                BtnLogin.Click += BtnLogin_Click;

                base.OnInit(e);
            }
        }
     
}