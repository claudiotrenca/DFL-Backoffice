using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DFLWebForm.Models;

namespace DFLWebForm
{
	public partial class StoreList : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				BindDataSource();
			}
		}

		//private void BindDataSource()
		//{
		//	using (Models.DataEntities context = new Models.DataEntities())
		//	{
		//		//public string DescrizionePromo { get; set; }
		//		//public string DescrizioneGruppoMerceologico { get; set; }
		//		//public string DescrizioneSottoGruppoMerceologico { get; set; }
		//		Promo = context.Product
		//			.GroupBy(row => new
		//			{
		//				row.CDART,
		//				row.DEART,
		//				row.FRETIT,
		//				row.FREDES,
		//				row.NMDIS,
		//				row.DescrizionePromo,
		//				row.DescrizioneGruppoMerceologico,
		//				row.DescrizioneSottoGruppoMerceologico
		//			})
		//			.AsEnumerable().Select(a => a.First()).Select(p => new Models.ProdottiDFL()
		//			{
		//				CDART = p.CDART,
		//				DEART = p.DEART,
		//				FRETIT = p.FRETIT,
		//				FREDES = p.FREDES,
		//				NMDIS = p.NMDIS,
		//				DescrizionePromo = p.DescrizionePromo,
		//				Attivo = p.CodiceProdottoApp == null ? false : true
		//			}).OrderBy(x => x.DEART).ToList();



		//		this.Grid.DataSource = Promo;
		//		this.Grid.DataBind();
		//	}
		//}

	}
}