<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AppPromoDetail.aspx.cs" Inherits="DFLWebForm.AppPromoDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
	<style type="text/css">
		.posupload {
			margin-left: 50px;
			margin-top: 20px;
		}

		.cols-sample-area {
			position: relative;
		}

		.uploadtext {
			text-align: center;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

	<!-- /.container-fluid -->
	<section class="content">
		<div class="row">
			<div class="col-lg-12">
				<div class="box">
					<div class="box-header">
						<h3 class="box-title">Scheda Promozione</h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<div class="form">
							<div class="row">
								<div class="col-lg-6">
									<div class="form-group">
										<label for="PZTID">Id Promozione</label>
										<asp:TextBox ID="PZTID" runat="server" CssClass="form-control" placeholder="nome"></asp:TextBox>
									</div>
								</div>
								<div class="col-lg-6">
									<div class="form-group">
										<label for="PZTCD">Codice</label>
										<asp:TextBox ID="PZTCD" runat="server" CssClass="form-control" placeholder="cognome"></asp:TextBox>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-6">
									<div class="form-group">
										<label for="PZTDE">Descrizione Promozione 1</label>
										<asp:TextBox ID="PZTDE" runat="server" CssClass="form-control" placeholder="username"></asp:TextBox>
									</div>
								</div>
								<div class="col-lg-6">
									<div class="form-group">
										<label for="PZTD1">Descrizione Promozione 2</label>
										<asp:TextBox ID="PZTD1" runat="server" CssClass="form-control" placeholder="email"></asp:TextBox>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-6">
									<div class="form-group">
										<label for="PZTDI">Data Inizio </label>
										<asp:TextBox ID="PZTDI" runat="server" CssClass="form-control" placeholder="email"></asp:TextBox>
									</div>
								</div>
								<div class="col-lg-6">
									<div class="form-group">
										<label for="PZTDF">Data Fine </label>
										<asp:TextBox ID="PZTDF" runat="server" CssClass="form-control" placeholder="email"></asp:TextBox>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-12">

									<%-- <div class="form-group">
                                        <label for="CodicePromo">Id Promozione</label>
                                        <asp:TextBox ID="CodicePromo" runat="server" CssClass="form-control" placeholder="nome"></asp:TextBox>
                                    </div>--%>
									<div class="form-group">
										<label for="PZTCD">Descrizione Promo APP</label>
										<asp:TextBox ID="DescrizionePromo" runat="server" TextMode="MultiLine" CssClass="form-control" placeholder="Descrizione Promo"></asp:TextBox>
									</div>
									<div class="form-group">
										<label for="PZTDE">SottotitoloPromo</label>
										<asp:TextBox ID="SottotitoloPromo" runat="server" CssClass="form-control" TextMode="MultiLine" placeholder="Sottotitolo"></asp:TextBox>
									</div>
									<div class="form-group">
										<label for="PZTD1">Testo Promo</label>
										<asp:TextBox ID="TestoPromo" runat="server" CssClass="form-control" TextMode="MultiLine" placeholder="Testo"></asp:TextBox>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-6">
									<div class="form-group">
										<label for="PZTDI">PercorsoImmagine</label>
										<asp:TextBox ID="PercorsoImmagine" runat="server" CssClass="form-control" placeholder="PercorsoImmagine"></asp:TextBox>
										<ej:UploadBox ID="UploadCopertina" runat="server" SaveUrl="saveFiles.ashx" RemoveUrl="removeFiles.ashx" OnComplete="UploadCopertina_OnComplete"></ej:UploadBox>
									</div>
								</div>

								<div class="col-lg-6">
									<div class="form-group">
										<label for="PZTDF">PercorsoLogo </label>
										<asp:TextBox ID="PercorsoLogo" runat="server" CssClass="form-control" placeholder="PercorsoLogo"></asp:TextBox>
										<ej:UploadBox ID="UploadLogo" runat="server" SaveUrl="saveFiles.ashx" RemoveUrl="removeFiles.ashx" OnComplete="UploadLogo_OnComplete"></ej:UploadBox>
									</div>
								</div>
							</div>
							<div class="row" style="padding-bottom: 20px">
								<div class="col-lg-12">
									<asp:Button ID="SavePromo" runat="server" Text="SALVA" CssClass="btn btn-default btn-info" OnClick="SavePromo_OnClick" />
									<asp:Button ID="DisablePromo" runat="server" Text="DISATTIVA" CssClass="btn btn-default btn-warning" OnClick="DisablePromo_OnClick" />
									<asp:Button ID="DeletePromo" runat="server" Text="ELIMINA" CssClass="btn btn-default btn-danger" OnClick="DeletePromo_OnClick" />
								</div>
							</div>
							<div class="row">
								<div class="col-lg-12">
									<asp:Button ID="InsertAllProduct" runat="server" Text="ATTIVA TUTTI I PRODOTTI" CssClass="btn btn-default btn-primary" OnClick="InsertAllProduct_OnClick" />
									<asp:Button runat="server" ID="DeleteAllProductPromo" Text="ELIMINA TUTTI I PRODOTTI DELLA PROMO" CssClass="btn btn-default btn-danger" OnClick="DeleteAllProductPromo_OnClick" />
									<asp:HyperLink ID="ShowProductPromoList" runat="server" CssClass="btn btn-default btn-primary">VISUALIZZA TUTTI PRODOTTI ATTIVI DELLA PROMOZIONE</asp:HyperLink>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterPlaceHolder" runat="server">
</asp:Content>