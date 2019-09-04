<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFormWCF.aspx.cs" Inherits="Projeto02_ConsumoWCF.WebFormWCF" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="valor1TextBox" runat="server"></asp:TextBox>
            <asp:TextBox ID="valor2TextBox" runat="server"></asp:TextBox>
            <asp:Button ID="calcularButton" runat="server" Text="Calcular Soma" Onclick="calcularButton_Click"/>
            <br />
            <asp:Button ID="nomesButton" runat="server" Text="Listar Nomes" OnClick="nomesButton_Click" />
            <br />
            <asp:ListBox ID="nomesListBox" runat="server"></asp:ListBox>
        </div>
    </form>
</body>
</html>
