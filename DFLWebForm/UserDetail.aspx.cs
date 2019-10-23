using DFLWebForms;
using System;

namespace DFLWebForm
{
    public partial class UserDetail : System.Web.UI.Page
    {
        private int id;

        protected void Page_Load(object sender, EventArgs e)
        {
            id = int.Parse(Request.QueryString["id"]);

            if (!IsPostBack)
            {
                using (Models.DataEntities context = new Models.DataEntities())
                {
                    var user = context.Customers.Find(id);
                    name.Text = user.FirstName;
                    surname.Text = user.LastName;
                    email.Text = user.Email;
                    username.Text = user.Username;
                }
            }
        }

        protected void savePass_OnClick(object _sender, EventArgs _e)
        {
            using (Models.DataEntities context = new Models.DataEntities())
            {
                var user = context.Customers.Find(id);

                if (user == null)
                    throw new Exception();

                if (!string.IsNullOrWhiteSpace(password.Text))
                {
                    byte[] passwordHash, passwordSalt;
                    Crypto.CreateHash(password.Text.Trim(), out passwordHash, out passwordSalt);

                    user.PasswordHash = passwordHash;
                    user.PasswordSalt = passwordSalt;
                }

                user.LastName = surname.Text.Trim();
                user.FirstName = name.Text.Trim();
                user.Username = username.Text.Trim();
                user.Email = email.Text.Trim();

                context.SaveChanges();
            }
        }
    }
}