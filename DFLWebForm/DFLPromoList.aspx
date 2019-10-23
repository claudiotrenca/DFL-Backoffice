<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DFLPromoList.aspx.cs" Inherits="DFLWebForm.DFLPromoList" %>

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

    <!-- /.container-fluid -->
    <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">Elenco Promo DFL </h3>
                        <p class=""></p>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">

                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <%--    PZTCD, PZTDE, PZTD1, PZTDI, PZTDF, PZTID--%>

                                <ej:Grid ID="Grid" runat="server" AllowFiltering="True" EnableViewState="False" AllowPaging="True" AllowGrouping="True" AllowSorting="True">
                                    <ClientSideEvents RecordClick="recordClick" ToolbarClick="onToolBarClick" />
                                    <ToolbarSettings ShowToolbar="True">
                                        <CustomToolbarItem>
                                            <ej:CustomToolbarItem Text="Expand" />
                                            <ej:CustomToolbarItem Text="Collapse" />
                                            <ej:CustomToolbarItem Text="Refresh" />
                                        </CustomToolbarItem>
                                    </ToolbarSettings>

                                    <Columns>
                                        <ej:Column Field="PZTID" HeaderText="ID" IsPrimaryKey="true" TextAlign="Left" Width="90" />
                                        <ej:Column Field="PZTCD" HeaderText="Codice" TextAlign="Left" Width="120" />
                                        <ej:Column Field="PZTDE" HeaderText="Descr. 1" TextAlign="Left" />
                                        <ej:Column Field="PZTD1" HeaderText="Descr. 2" TextAlign="Left" />
                                        <ej:Column Field="PZTDI" HeaderText="Data Inizio" TextAlign="Right" Width="90" Format="{0:dd/MM/yyyy}" AllowSorting="True" />
                                        <ej:Column Field="PZTDF" HeaderText="Data Fine" TextAlign="Right" Width="90" Format="{0:dd/MM/yyyy}" AllowSorting="True" />
                                        <ej:Column HeaderText="Dettagli" Template="<a href='/PromoApp.aspx?id={{:PZTID}}'> >>>> </a>" />
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
    <script type="text/javascript">
        function expandCollapse() {
            var gridObj = $('#<%= Grid.ClientID %>').data("ejGrid");
            if (localStorage.getItem("isExpand") == "null" || $.parseJSON(localStorage.getItem("isExpand"))) {
                gridObj.expandAll();
            }
            else if (localStorage.getItem("isExpand") != null) {
                gridObj.collapseAll();
                localStorage.setItem("isExpand", "null");
            }
            $('#<%= Grid.ClientID %>').ejWaitingPopup("show");
            setTimeout(function () {
                $('#<%= Grid.ClientID %>').ejWaitingPopup("hide");
            }, 1000);
        }
        function onToolBarClick(sender, args) {
            $('#<%= Grid.ClientID %>').ejWaitingPopup("show");
            var tbarObj = $(sender.target);
            if (tbarObj.hasClass("Expand")) {
                this.expandAll();
                localStorage.setItem("isExpand", true);
            }
            else if (tbarObj.hasClass("Collapse")) {
                this.collapseAll();
                localStorage.setItem("isExpand", false);
            }
            else {
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