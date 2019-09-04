<%@ Page Title="" Async="true" Language="C#" MasterPageFile="~/Views/Layout.Master" AutoEventWireup="true" CodeBehind="ResponderChamado.aspx.cs" Inherits="DesenvolvimentoWeb.Vendas.Views.ResponderChamado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="conteudo" runat="server">
    <div class="container">
        <h2 class="text-center text-primary">Inclusão de Pedidos</h2>
        <div class="row">
            <div class="col-md-7">
                <%-- Chamado --%>
                <div class="form-group">
                    <asp:Label ID="chamadoLabel" runat="server" Text="Chamado:"></asp:Label>
                    <asp:DropDownList ID="chamadoDropDownList"
                        runat="server" CssClass="form-control"></asp:DropDownList>                    
                </div>

                <div class="form-group">
                    <asp:Button ID="buscarButton" CssClass="btn btn-info"
                        runat="server" Text="Buscar chamado" OnClick="buscarButton_Click" />
                </div>

                <%-- Buscar Chamado --%>
                <div class="form-group">
                    <asp:Label ID="buscarLabel" runat="server" Text="Descrição:"></asp:Label>
                    <asp:TextBox ID="descricaoTextBox"
                        CssClass="form-control text-primary"
                        TextMode="MultiLine" Rows="4" Columns="50"
                        ReadOnly="true"
                        runat="server"></asp:TextBox>                 
                </div>

                <%-- Responder Chamado --%>
                <div class="form-group">
                    <asp:Label ID="responderLabel" runat="server" Text="Responder:"></asp:Label>
                    <asp:TextBox ID="responderTextBox"
                        CssClass="form-control text-primary"
                        TextMode="MultiLine" Rows="4" Columns="50"
                        runat="server"></asp:TextBox>                 
                </div>

                <div class="form-group">
                    <asp:Button ID="responderButton" CssClass="btn btn-primary"
                        runat="server" Text="Buscar chamado" OnClick="responderButton_Click" />
                </div>

                <div class="form-group" style="width:100%;">
                    <asp:Label ID="mensagemLabel" runat="server"></asp:Label>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
