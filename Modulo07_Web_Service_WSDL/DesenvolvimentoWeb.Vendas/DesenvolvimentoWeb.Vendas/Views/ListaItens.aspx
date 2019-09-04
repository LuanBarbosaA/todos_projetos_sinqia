<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layout.Master" AutoEventWireup="true" CodeBehind="ListaItens.aspx.cs" Inherits="DesenvolvimentoWeb.Vendas.Views.ListaItens" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="conteudo" runat="server">

    <div class="container">
        <div class="row">
            <div class="col-md-5">
                <h3>Forneça os dados</h3>
                <div class="form-group">
                    <asp:Label ID="pedidoLabel" runat="server" Text="Pedido: "></asp:Label>
                    <asp:DropDownList ID="pedidosDropDownList" runat="server" CssClass="form-control"
                        OnSelectedIndexChanged="pedidosDropDownList_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                </div>
                <asp:Repeater ID="ItensRepeater" runat="server">
                    <HeaderTemplate></HeaderTemplate>
                    <ItemTemplate>
                        <div class="alert alert-secondary">
                            <div style="float:right;">
                                <asp:LinkButton ID="excluirLinkButton" runat="server" 
                                    onClientClick="javascript:return confirm('Tem certeza?')"
                                    Onclick="excluirLinkButton_Click"
                                    CommandArgument='<%# Eval("IdItem") %>'>[x]</asp:LinkButton>
                            </div>
                            <strong>Produto:</strong>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("DescricaoProduto") %>'></asp:Label><br />

                            <strong>Num. Pedido:</strong>
                            <asp:Label ID="Label2" runat="server" 
                                Text='<%# Eval("NumeroPedido") %>'></asp:Label><br />

                            <strong>Data Pedido:</strong>
                            <asp:Label ID="Label3" runat="server"                                
                                Text='<%# Eval("DataPedido") %>'></asp:Label><br />

                            <strong>Valor Pedido:</strong>
                            <asp:Label ID="Label4" runat="server" 
                                Text='<%# Eval("ValorTotalItem") %>'></asp:Label><br />
                        </div>
                    </ItemTemplate>
                    <FooterTemplate></FooterTemplate>
                </asp:Repeater>
            </div>        
        </div>
    </div>

</asp:Content>
