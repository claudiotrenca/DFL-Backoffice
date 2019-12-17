using Newtonsoft.Json;
using Syncfusion.JavaScript.Web;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web.UI.WebControls;

namespace DFLWebForm
{
    public partial class DFLProductList : System.Web.UI.Page
    {
        private List<Models.ProdottiDFL> Promo = new List<Models.ProdottiDFL>();
       

        protected void Page_Load(object sender, EventArgs e)
        {

           

            if (!IsPostBack)
            {
                BindDataSource();
            }
        }

        private void BindDataSource()
        {
            using (Models.DataEntities context = new Models.DataEntities())
            {
                //public string DescrizionePromo { get; set; }
                //public string DescrizioneGruppoMerceologico { get; set; }
                //public string DescrizioneSottoGruppoMerceologico { get; set; }
                Promo = context.Product
                    .GroupBy(row => new
                    {
                        row.CDART, row.DEART, row.FRETIT, row.FREDES, row.NMDIS,  row.PZTDE, row.PZTID,
                        row.DescrizioneGruppoMerceologico, row.DescrizioneSottoGruppoMerceologico
                    })
                    .AsEnumerable().Select(a => a.First()).Select(p => new Models.ProdottiDFL()
                    {
                        CDART = p.CDART,
                        DEART = p.DEART,
                        FRETIT = p.FRETIT,
                        FREDES = p.FREDES,
                        NMDIS = p.NMDIS,
                        DescrizionePromo = p.PZTDE,
                        PZTID =  p.PZTID,
                        Attivo = p.CodiceProdottoApp == null ? false : true
                    }).OrderBy(x => x.DEART).ToList();

              

                this.Grid.DataSource = Promo;
                this.Grid.DataBind();
            }
        }

        protected void Grid_OnServerCommandButtonClick(object sender, GridEventArgs e)
        {
            var obj = e.Arguments;
            string codiceArticolo = string.Empty;
            bool attivo = false;
            Models.ProdottiDFL prod = new Models.ProdottiDFL();

            foreach (KeyValuePair<string, object> item in obj)
            {
                Console.WriteLine("Key: {0}, Value: {1}", item.Key, item.Value);
                if (item.Key == "data")
                {
                    var json = JsonConvert.SerializeObject(item.Value);
                    prod = JsonConvert.DeserializeObject<Models.ProdottiDFL>(json);
                }
            }

            using (Models.DataEntities context = new Models.DataEntities())
            {
                Models.ProdottiApp row =
                    context.ProdottiApp.SingleOrDefault(r => r.CodiceProdottoApp == prod.CDART);
                if (prod.Attivo == true)
                {
                    // rimuove
                    context.Entry(row).State = EntityState.Deleted;
                    context.SaveChanges();
                }
                else
                {
                    if (row == null)
                    {
                        row = new Models.ProdottiApp
                        {
                            CodiceProdottoApp = prod.CDART ,
                            CodicePromo = prod.PZTID
                        };
                        context.ProdottiApp.Add(row);
                        context.SaveChanges();
                    }
                }
            }

            BindDataSource();
        }
    }
}