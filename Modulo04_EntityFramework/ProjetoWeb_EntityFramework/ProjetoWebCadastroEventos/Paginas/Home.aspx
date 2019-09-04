<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="ProjetoWebCadastroEventos.Paginas.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Gestão de eventos</h1>
            <h2>Escolha uma opção:</h2>
            <ul>
                <li><asp:HyperLink ID="eventosHyperLink" runat="server" NavigateUrl="~/Paginas/CadastroEventos.aspx">Cadastro de eventos</asp:HyperLink></li>
                <li><asp:HyperLink ID="convidadosHyperLink" runat="server" NavigateUrl="~/Paginas/CadastroConvidados.aspx">Cadastro de convidados</asp:HyperLink></li>
            </ul>
        </div>
    </form>
</body>
</html>
