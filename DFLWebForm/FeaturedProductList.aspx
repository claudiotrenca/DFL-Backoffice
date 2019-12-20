<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FeaturedProductList.aspx.cs" Inherits="DFLWebForm.FeaturedProductList" %>

<asp:Content ID="Content2" ContentPlaceHolderID="Head" runat="server">
    <style type="text/css">
        ::-ms-clear {
            display: none;
        }
    </style>
    <style type="text/css" class="cssStyles">
        .Expand {
            background-position: -180px 3px;
        }

        .Collapse {
            background-position: -205px 3px;
        }

        .Refresh {
            background-position: -80px 3px;
        }

        .e-toolbaricons {
            background-image: url("../Content/ejthemes/common-images/icons-gray.png");
        }

        .Expand:hover, .Collapse:hover, .refresh:hover {
            background-image: url("../Content/ejthemes/common-images/icons-white.png");
        }
    </style>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">Elenco Prodotti APP in vetrina </h3>
                        <p class=""></p>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">

                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                            <%--    PZTCD, PZTDE, PZTD1, PZTDI, PZTDF, PZTID--%>

                                <ej:Grid ID="Grid" runat="server" AllowFiltering="True" EnableViewState="False" AllowPaging="True" AllowGrouping="True" AllowSorting="True" OnServerCommandButtonClick="Grid_OnServerCommandButtonClick"> 
                                    <ClientSideEvents RecordClick="recordClick" ToolbarClick="onToolBarClick" />
                                    <ToolbarSettings ShowToolbar="True">
                                        <CustomToolbarItem>
                                            <ej:CustomToolbarItem Text="Expand" />
                                            <ej:CustomToolbarItem Text="Collapse" />
                                            <ej:CustomToolbarItem Text="Refresh" />
                                        </CustomToolbarItem>
                                    </ToolbarSettings>
                                     
                                    <Columns>
                                        <ej:Column Field="CDART" HeaderText="Codice" IsPrimaryKey="true" TextAlign="Left" Width="90" />
                                        <ej:Column Field="DEART" HeaderText="Descr. 1" TextAlign="Left"  AllowSorting="True" />
                                        <ej:Column Field="FRETIT" HeaderText="Descr. 2" TextAlign="Left"  />
                                        <ej:Column Field="FREDES" HeaderText="Descr. 3" TextAlign="Left"   />
                                        <ej:Column Field="DescrizionePromo" HeaderText="Promo" TextAlign="Left"   />
	                                    <ej:Column HeaderText="Foto" Template="#columnTemplate1" TextAlign="Center" Width="110" />
	                                    <ej:Column HeaderText="Vetrina" Template="#columnTemplate2" TextAlign="Center" Width="110" AllowSorting="True" />
                                        <ej:Column HeaderText="Modifica Stato" TextAlign="Center" Width="250">                     
                                            <Command> 
                                                <ej:Commands Type="modify"> 
	                                                <ButtonOptions Text="Modifica" Width="100" ></ButtonOptions> 
	                                             
	                                            </ej:Commands> 
	                                            <ej:Commands Type="featuring"> 
 		                                            <ButtonOptions Text="Vetrina" Width="100"></ButtonOptions> 
	                                            </ej:Commands> 
                                            </Command> 
                                        </ej:Column>     
                                    </Columns>
                                    <FilterSettings FilterType="Excel"></FilterSettings>
                                </ej:Grid>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FooterPlaceHolder" runat="server">
    <script type="text/x-jsrender" id="columnTemplate1">
        <img style="width: 75px; height: 75px" src="https://www.nuovadfl.it/Images/articoli/fotoApp/{{:NMDIS}}.jpg" alt="{{ : NMDIS }}" />
    </script>
  
	<script type="text/x-jsrender" id="columnTemplate2">
     {{if Vetrina }}
         <span>SI</span>
     {{/if}}

    
    </script>
    
     <script type="text/javascript">
        function expandCollapse() {
            var gridObj = $('#<%= Grid.ClientID %>').data("ejGrid");
            if (localStorage.getItem("isExpand") == "null" || $.parseJSON(localStorage.getItem("isExpand"))) {
                gridObj.expandAll();
            } else if (localStorage.getItem("isExpand") != null) {
                gridObj.collapseAll();
                localStorage.setItem("isExpand", "null");
            }
            $('#<%= Grid.ClientID %>').ejWaitingPopup("show");
            setTimeout(function() {
                    $('#<%= Grid.ClientID %>').ejWaitingPopup("hide");
                },
                1000);
        }

        function onToolBarClick(sender, args) {
            $('#<%= Grid.ClientID %>').ejWaitingPopup("show");
            var tbarObj = $(sender.target);
            if (tbarObj.hasClass("Expand")) {
                this.expandAll();
                localStorage.setItem("isExpand", true);
            } else if (tbarObj.hasClass("Collapse")) {
                this.collapseAll();
                localStorage.setItem("isExpand", false);
            } else {
                this.refreshContent();
            }
        }

        function recordClick(args) {
            $('#<%= Grid.ClientID %>').ejWaitingPopup("show");
        }
    </script>
    <script type="text/javascript">
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(expandCollapse);
    </script>
</asp:Content>
