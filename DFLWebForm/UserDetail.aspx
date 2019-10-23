<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserDetail.aspx.cs" Inherits="DFLWebForm.UserDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <!-- /.container-fluid -->
    <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">Scheda Utente</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <div class="form">
                            <div class="form-group">
                                <label for="name">Nome</label>
                                <asp:TextBox ID="name" runat="server" CssClass="form-control" placeholder="nome"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="surname">Cognome</label>
                                <asp:TextBox ID="surname" runat="server" CssClass="form-control" placeholder="cognome"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="username">Username</label>
                                <asp:TextBox ID="username" runat="server" CssClass="form-control" placeholder="username"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="email">Email</label>
                                <asp:TextBox ID="email" runat="server" CssClass="form-control" placeholder="email"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="password">Password</label>
                                <asp:TextBox ID="password" runat="server" CssClass="form-control" placeholder="Password"></asp:TextBox>
                            </div>
                            <asp:Button ID="savePass" runat="server" Text="SALVA" CssClass="btn btn-default" OnClick="savePass_OnClick" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterPlaceHolder" runat="server">
</asp:Content>