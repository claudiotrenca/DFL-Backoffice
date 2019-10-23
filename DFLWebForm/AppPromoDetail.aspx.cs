using Syncfusion.JavaScript.Web;
using System;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Linq;

namespace DFLWebForm
{
    public partial class AppPromoDetail : System.Web.UI.Page
    {
        private string _codicePromo;

        protected void Page_Load(object sender, EventArgs e)
        {
            _codicePromo = Request.QueryString["codicePromo"];

            if (!IsPostBack)
            {
                BindData();
            }
        }

        private void BindData()
        {
            using (Models.DataEntities context = new Models.DataEntities())
            {
                //row.PZTCD , row.PZTDE , row.PZTD1, row.PZTDI, row.PZTDF, row.PZTID
                //var row = context.Promozioni_PRS2F.Where(x => x.PZTID == codicePromo).SingleOrDefault();

                var promo = context.Promozioni_PRS2F
                    .GroupBy(row => new { row.PZTCD, row.PZTDE, row.PZTD1, row.PZTDI, row.PZTDF, row.PZTID })
                    .AsEnumerable().Select(a => a.First()).Select(p => new Models.PromoDFL()
                    {
                        PZTCD = p.PZTCD,
                        PZTID = p.PZTID,
                        PZTD1 = p.PZTD1,
                        PZTDE = p.PZTDE,
                        PZTDF = p.PZTDF,
                        PZTDI = p.PZTDI
                    }).SingleOrDefault(x => x.PZTID == _codicePromo);
                if (promo != null)
                {
                    PZTID.Text = promo.PZTID;
                    PZTCD.Text = promo.PZTCD;
                    PZTDE.Text = promo.PZTDE;
                    PZTD1.Text = promo.PZTD1;
                    PZTDI.Text = promo.PZTDI.ToString();
                    PZTDF.Text = promo.PZTDF.ToString();

                    Models.PromoApp promoApp = context.PromoApp.SingleOrDefault(p => p.CodicePromo == promo.PZTID);

                    if (promoApp != null)
                    {
                         DescrizionePromo.Text = promoApp.DescrizionePromo;
                        SottotitoloPromo.Text = promoApp.DescrizionePromo;
                        TestoPromo.Text = promoApp.TestoPromo;
                        PercorsoImmagine.Text = promoApp.PercorsoImmagine;
                        PercorsoLogo.Text = promoApp.PercorsoLogo;

                        ShowProductPromoList.NavigateUrl = "/AppProductList.aspx?codicepromo=" + _codicePromo;
                    }
                    else
                    {
                        ShowProductPromoList.Enabled = false;
                    }
                }
            }
        }


        protected void SavePromo_OnClick(object _sender, EventArgs _e)
        {
            using (Models.DataEntities context = new Models.DataEntities())
            {
                Models.PromoApp row = context.PromoApp.Where(x => x.CodicePromo == PZTID.Text).SingleOrDefault();

                if (row == null)
                {
                    row = new Models.PromoApp();
                    row.CodicePromo = PZTID.Text;
                    row.Attiva = true;
                    row.DescrizionePromo = DescrizionePromo.Text;
                    row.SottotitoloPromo = SottotitoloPromo.Text;
                    row.TestoPromo = TestoPromo.Text;
                    row.PercorsoImmagine = PercorsoImmagine.Text;
                    row.PercorsoLogo = PercorsoLogo.Text;
                    context.PromoApp.Add(row);
                    context.SaveChanges();
                }
            }
        }

        protected void UploadCopertina_OnComplete(object sender, UploadBoxCompleteEventArgs e)
        {
            PercorsoImmagine.Text = e.Name.ToLower();
        }

        protected void UploadLogo_OnComplete(object sender, UploadBoxCompleteEventArgs e)
        {
            PercorsoLogo.Text = e.Name.ToLower();
        }

        protected void DisablePromo_OnClick(object sender, EventArgs e)
        {
            using (Models.DataEntities context = new Models.DataEntities())
            {
                Models.PromoApp row =
                    context.PromoApp.SingleOrDefault(r => r.CodicePromo == _codicePromo);
                if (row.Attiva == true)
                {
                    // rimuove
                    row.Attiva = false;
                    context.SaveChanges();
                }
            }
        }

        protected void DeletePromo_OnClick(object sender, EventArgs e)
        {
            using (Models.DataEntities context = new Models.DataEntities())
            {
                Models.PromoApp row =
                    context.PromoApp.SingleOrDefault(r => r.CodicePromo == _codicePromo);
                context.Entry(row).State = EntityState.Deleted;
                context.SaveChanges();

                context.Database.ExecuteSqlCommand("DELETE FROM ProdottiApp WHERE CodicePromo = '" + _codicePromo + "'");
            }
        }

        protected void InsertAllProduct_OnClick(object sender, EventArgs e)
        {
            using (Models.DataEntities context = new Models.DataEntities())
            {
                SqlParameter param1 = new SqlParameter("@promoid", _codicePromo);

                context.Database.ExecuteSqlCommand("ActivateAllPromoProduct @promoid", param1);
            }
        }
    }
}