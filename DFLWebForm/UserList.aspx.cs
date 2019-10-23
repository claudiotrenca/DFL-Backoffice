using Syncfusion.EJ.Export;
using Syncfusion.JavaScript;
using Syncfusion.JavaScript.Web;
using Syncfusion.XlsIO;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

namespace DFLWebForm
{
    public partial class UserList : System.Web.UI.Page
    {
        private List<Models.Customers> Customers = new List<Models.Customers>();

        protected void Page_Load(object sender, EventArgs e)
        {
            Grid.FilterSettings.FilterType = FilterType.Menu;
            BindDataSource();
        }

        private void BindDataSource()
        {
            using (Models.DataEntities context = new Models.DataEntities())
            {
                Customers = context.Customers.ToList();
            }

            this.Grid.DataSource = Customers;
            this.Grid.DataBind();
        }

        protected void FlatGrid_ServerExcelExporting(object sender, Syncfusion.JavaScript.Web.GridEventArgs e)

        {
            ExcelExport exp = new ExcelExport();

            exp.Export(Grid.Model, (IEnumerable)Grid.DataSource, "Export.xlsx", ExcelVersion.Excel2010, true, true, "flat-lime");
        }

        protected void FlatGrid_ServerPdfExporting(object sender, Syncfusion.JavaScript.Web.GridEventArgs e)

        {
            PdfExport exp = new PdfExport();
            exp.Export(Grid.Model, (IEnumerable)Grid.DataSource, "Export.pdf", true, true, "flat-lime");
        }
    }
}