<%@ Page Async="true" Title="" Language="C#" MasterPageFile="~/Views/Layout.Master" AutoEventWireup="true" CodeBehind="AbrirChamado.aspx.cs" Inherits="DesenvolvimentoWeb.Vendas.Views.AbrirChamado" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="conteudo" runat="server">

    <div class="container">
        <h2 class="text-center text-primary">Abertura de Chamado</h2>
        <div class="row">
            <div class="col-md-7">

                <%-- Assunto --%>
                <div class="form-group">
                    <asp:Label ID="assuntoLabel" runat="server" Text="Assunto:"></asp:Label>
                    <asp:DropDownList ID="assuntoDropDownList"
                        runat="server" CssClass="form-control">
                    </asp:DropDownList>
                </div>

                <%-- Documento --%>
                <div class="form-group">
                    <asp:Label ID="documentoLabel" runat="server" Text="Documento:"></asp:Label>
                    <asp:TextBox ID="documentoTextBox" 
                        CssClass="form-control" runat="server"></asp:TextBox>
                </div>

                <%-- Descrição --%>
                <div class="form-group">
                    <asp:Label ID="descricaoLabel" runat="server" Text="Descrição:"></asp:Label>
                    <asp:TextBox ID="descricaoTextBox" TextMode="MultiLine"
                        Rows="4" Columns="50"
                        CssClass="form-control" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:Button ID="enviarButton" CssClass="btn btn-primary"
                        runat="server" Text="Abrir Chamado" OnClick="enviarButton_Click" />
                </div>

                <div class="form-group" style="width:100%;">
                    <asp:Label ID="mensagemLabel" runat="server"></asp:Label>
                </div>

            </div>
        </div>

    </div>

</asp:Content>
