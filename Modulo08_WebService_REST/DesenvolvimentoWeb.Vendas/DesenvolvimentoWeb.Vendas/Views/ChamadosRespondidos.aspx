<%@ Page Title="" Async="true" Language="C#" MasterPageFile="~/Views/Layout.Master" AutoEventWireup="true" CodeBehind="ChamadosRespondidos.aspx.cs" Inherits="DesenvolvimentoWeb.Vendas.Views.ChamadosRespondidos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="conteudo" runat="server">
    <div class="container">
        <h2 class="text-center text-primary">Lista de Itens</h2>        

        <asp:Repeater ID="itensRepeater" runat="server">
            <HeaderTemplate></HeaderTemplate>
            <ItemTemplate>
                <div class="alert alert-secondary">                   

                    <strong>Data:</strong>
                    <asp:Label ID="Label1" 
                        runat="server" 
                        Text='<%# Eval("ChamadoId") %>'>
                    </asp:Label> <br />

                    <strong>Data:</strong>
                    <asp:Label ID="dataLabel" 
                        runat="server" 
                        Text='<%# Eval("Data") %>'>
                    </asp:Label> <br />

                    <strong>Documento:</strong>
                    <asp:Label ID="documentoLabel" 
                        runat="server" 
                        Text='<%# Eval("Documento") %>'>
                    </asp:Label> 

                    <strong>Assunto:</strong>
                    <asp:Label ID="assuntoLabel" 
                        runat="server" 
                        Text='<%# Eval("Assunto") %>'>
                    </asp:Label> <br />

                    <strong>Descrição:</strong>
                    <asp:Label ID="descricaoLabel" 
                        runat="server" 
                        Text='<%# Eval("Descricao") %>'>
                    </asp:Label> <br />

                    <strong>Resposta:</strong>
                    <asp:Label ID="respostaLabel" 
                        runat="server" 
                        Text='<%# Eval("Resposta") %>'>
                    </asp:Label> <br />
                </div>

            </ItemTemplate>
            <FooterTemplate></FooterTemplate>
        </asp:Repeater>

    </div>
</asp:Content>
