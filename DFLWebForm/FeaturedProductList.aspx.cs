﻿using Newtonsoft.Json;
using Syncfusion.JavaScript.Web;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web.UI.WebControls;

namespace DFLWebForm
{
    public partial class FeaturedProductList : System.Web.UI.Page
    {
        private List<Models.ProdottiDFL> Promo = new List<Models.ProdottiDFL>();
        private string codicePromo = string.Empty;


        protected void Page_Load(object sender, EventArgs e)
        {
            codicePromo = Request.QueryString["codicePromo"];

            if (!IsPostBack)
            {
                BindDataSource();
            }
        }

        private void BindDataSource()
        {
            using (Models.DataEntities context = new Models.DataEntities())
            {
                Promo = context.Product.Where(x => x.CodiceProdottoApp != null && x.Vetrina != null)
                    .GroupBy(row => new { row.CDART, row.DEART, row.FRETIT, row.FREDES, row.NMDIS, row.DescrizionePromo, row.DescrizioneGruppoMerceologico, row.DescrizioneSottoGruppoMerceologico })
                    .AsEnumerable().Select(a => a.First()).Select(p => new Models.ProdottiDFL()
                    {
                        CDART = p.CDART,
                        DEART = p.DEART,
                        FRETIT = p.FRETIT,
                        FREDES = p.FREDES,
                        NMDIS = p.NMDIS,
                        DescrizionePromo = p.DescrizionePromo,
                        PZTID = p.PZTID,
                        Attivo = p.CodiceProdottoApp == null ? false : true,
                        Vetrina = p.Vetrina == null ? false : true
                    }).OrderBy(x => x.DEART).ToList();

                if (!string.IsNullOrEmpty(codicePromo))
                {
                    Promo = Promo.Where(x => x.PZTID == codicePromo).ToList();
                }

                this.Grid.DataSource = Promo;
                this.Grid.DataBind();
            }
        }

        protected void Grid_OnServerCommandButtonClick(object sender, GridEventArgs e)
        {
            var obj = e.Arguments;
            string codiceArticolo = string.Empty;
            bool attivo = false;
            string operation = string.Empty;

            Models.ProdottiDFL prod = new Models.ProdottiDFL();

            foreach (KeyValuePair<string, object> item in obj)
            {
                Console.WriteLine("Key: {0}, Value: {1}", item.Key, item.Value);
                if (item.Key == "data")
                {
                    var json = JsonConvert.SerializeObject(item.Value);
                    prod = JsonConvert.DeserializeObject<Models.ProdottiDFL>(json);
                }

                if (item.Key == "commandType")
                {
	                operation = item.Value.ToString();
                }
            }
            using (Models.DataEntities context = new Models.DataEntities())
            {
	            if (operation == "modify")
	            {
		            Models.ProdottiApp row =
			            context.ProdottiApp.SingleOrDefault(r => r.CodiceProdottoApp == prod.CDART && r.CodicePromo == prod.PZTID);
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
					            CodiceProdottoApp = prod.CDART,
					            CodicePromo = prod.PZTID
                            };
				            context.ProdottiApp.Add(row);
				            context.SaveChanges();
			            }
		            }

		            if (prod.Vetrina == true)
		            {
			            // rimuove
			            context.Entry(row).State = EntityState.Deleted;
			            context.SaveChanges();
		            }
                } else if (operation == "featuring")
	            {
		            Models.Vetrina row =
			            context.Vetrina.SingleOrDefault(r => r.CodiceProdottoApp == prod.CDART && r.CodicePromo == prod.PZTID);
		            if (prod.Vetrina == true)
		            {
			            // rimuove
			            context.Entry(row).State = EntityState.Deleted;
			            context.SaveChanges();
		            }
		            else
		            {
			            if (row == null)
			            {
				            row = new Models.Vetrina
                            {
					            CodiceProdottoApp = prod.CDART,
					            CodicePromo = prod.PZTID
                            };
				            context.Vetrina.Add(row);
				            context.SaveChanges();
			            }
		            }
                }



               
            }

            BindDataSource();
        }
    }
}