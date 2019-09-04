<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DesenvolvimentoWeb.Vendas.Views.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <meta charset="utf-8" />
    <link href="../Styles/Estilos.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Lexend+Tera&display=swap" rel="stylesheet">
    <link href="../Content/bootstrap.min.css" rel="stylesheet"/> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/> 
</head>
<body>
    <form id="form1" runat="server">
        <div style="margin-top: 50px;">
            <div class="container">
                <div class="row">                                           
                    <div class="col-md-4 alert alert-primary">
                        <div class="col-md-4">

                        </div>
                        <div id="cabecalho">
                            <h3>Forneça suas credenciais</h3>
                        </div>
                        
                        <%--Usuario--%>
                        <div class="form-group">
                            <asp:Label ID="usuarioLabel" runat="server" Text="Usuario: "></asp:Label>
                            <asp:TextBox ID="usuarioTextBox" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <asp:Label ID="senhaLabel" runat="server" Text="Senha: "></asp:Label>
                            <asp:TextBox ID="senhaTexrBox" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:Button ID="enviarButton" CssClass="btn btn-primary" runat="server" Text="Button" OnClick="enviarButton_Click"/>
                        </div>
                        <div style="margin-top:20px;">
                            <asp:Label ID="mensagemLabel" runat="server"></asp:Label>
                        </div>
                    <div class="col-md-4">
                        
                    </div>
                </div>                
            </div>
        </div>
    </form>
</body>
</html>
