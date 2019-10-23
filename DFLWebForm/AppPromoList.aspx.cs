using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DFLWebForm
{
    public partial class AppPromoList : System.Web.UI.Page
    {
        List<Models.Promo> Promo = new List<Models.Promo>();
        protected void Page_Load(object sender, EventArgs e)
        {
            BindDataSource();
        }

        private void BindDataSource()
        {
            using (Models.DataEntities context = new Models.DataEntities())
            {
                Promo = context.Promo.ToList().OrderBy(row => row.PZTDE).ToList();


                //.Select<Models.PromoDFL>(p => new Models.PromoDFL() 
                //{

                //}).ToList();

                this.Grid.DataSource = Promo;
                this.Grid.DataBind();
            }
        }
    }
}