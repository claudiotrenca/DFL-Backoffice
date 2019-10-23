<%@ Page Language="C#" AutoEventWireup="false" CodeBehind="Login.aspx.cs" Inherits="DFLWebForm.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <!-- Bootstrap Core CSS -->
    <link href="/content/bootstrap.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/admin/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/admin/css/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <style type="text/css">
        #LoginError {
            border-left: 4px solid #dd3d36;
            background: #fff;
            box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
            margin-left: 0;
            padding: 12px;
			}
    </style>
    <script src="scripts/jquery-3.3.1.min.js"></script>
    <script src="/Scripts/bootstrap.min.js"></script>

</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-md-offset-4">

                    <div class="login-panel panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Emmmemedia CMS Login</h3>
                        </div>
                        <div class="panel-body">
                            <div role="form">
                                <fieldset>
                                    <div class="form-group input-group">
                                        <asp:TextBox ID="AdminUsername" runat="server" CssClass="form-control" placeholder="Username"></asp:TextBox>
                                        <div class="input-group-addon">
                                            <i class="glyphicon glyphicon-envelope"></i>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage=" * required" CssClass="alert-danger" Display="Dynamic" ControlToValidate="AdminUsername"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <br />
                                    <div class="form-group input-group">
                                        <asp:TextBox ID="AdminPassword" TextMode="Password" CssClass="form-control" placeholder="Password" runat="server"></asp:TextBox>
                                        <div class="input-group-addon">
                                            <i class="glyphicon glyphicon-lock"></i>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage=" * required" CssClass="alert-danger" Display="Dynamic" ControlToValidate="AdminPassword"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="checkbox">
                                        <label>
                                            <input name="remember" type="checkbox" value="Remember Me">Remember Me
                                        </label>
                                    </div>
                                    <asp:Button ID="BtnLogin" CssClass="btn btn-primary btn-block btn-flat" runat="server" Text="Login" />
                                </fieldset>
                            </div>
                        </div>
                    </div>
                    <asp:Panel ID="LoginError" ClientIDMode="Static" runat="server">
                        <b>ERRORE!</b>
                        <asp:Literal ID="LoginErrorMessage" runat="server"></asp:Literal>
                    </asp:Panel>
                </div>
            </div>
        </div>
    </form>
</body>
</html>