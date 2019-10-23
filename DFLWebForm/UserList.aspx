<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserList.aspx.cs" Inherits="DFLWebForm.UserList" %>

 <asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
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
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <!-- /.container-fluid -->
    <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">Elenco utenti</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>

                                <ej:Grid ID="Grid" runat="server" AllowFiltering="True" EnableViewState="False" AllowPaging="True" AllowGrouping="True" AllowSorting="True" AllowMultiSorting="True"
                                    OnServerPdfExporting="FlatGrid_ServerPdfExporting" OnServerExcelExporting="FlatGrid_ServerExcelExporting">
                                    <clientsideevents recordclick="recordClick" toolbarclick="onToolBarClick" />
                                    <toolbarsettings showtoolbar="True" toolbaritems="excelExport,pdfExport">
                                        <CustomToolbarItem>
                                            <ej:CustomToolbarItem Text="Expand" />
                                            <ej:CustomToolbarItem Text="Collapse" />
                                            <ej:CustomToolbarItem Text="Refresh" />
                                        </CustomToolbarItem>
                                    </toolbarsettings>
                                    <groupsettings></groupsettings>
                                    <columns>
                                        <ej:Column Field="Id" HeaderText="Order ID" IsPrimaryKey="true" TextAlign="Right" Width="90" />
                                        <ej:Column Field="LastName" HeaderText="Cognome" TextAlign="Left" Width="120" />
                                        <ej:Column Field="FirstName" HeaderText="Nome" TextAlign="Left" Width="130" />
                                        <ej:Column Field="Email" HeaderText="Username" TextAlign="Left" Width="90" />
                                        <ej:Column Field="Username" HeaderText="Username" TextAlign="Left" Width="90" />
                                        <ej:Column HeaderText="Dettagli" Template="<a href='/userdetail.aspx?id={{:Id}}'> >>>> </a>" />
                                    </columns>
                                    <filtersettings filtertype="Excel" enablecomplexblankfilter="True"></filtersettings>
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