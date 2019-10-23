using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

namespace DFLWebForm
{
    public partial class DFLPromoList : System.Web.UI.Page
    {
        private List<Models.PromoDFL> Promo = new List<Models.PromoDFL>();

        protected void Page_Load(object sender, EventArgs e)
        {
            BindDataSource();
        }

        private void BindDataSource()
        {
            using (Models.DataEntities context = new Models.DataEntities())
            {
                Promo = context.Promozioni_PRS2F
                    .GroupBy(row => new { row.PZTCD, row.PZTDE, row.PZTD1, row.PZTDI, row.PZTDF, row.PZTID })
                    .AsEnumerable().Select(a => a.First()).Select(p => new Models.PromoDFL()
                    {
                        PZTCD = p.PZTCD,
                        PZTID = p.PZTID,
                        PZTD1 = p.PZTD1,
                        PZTDE = p.PZTDE,
                        PZTDF = p.PZTDF,
                        PZTDI = p.PZTDI
                    }).ToList();

                //.Select<Models.PromoDFL>(p => new Models.PromoDFL()
                //{
                //}).ToList();

                this.Grid.DataSource = Promo;
                this.Grid.DataBind();
            }
        }
    }
}