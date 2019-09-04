<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layout.Master" AutoEventWireup="true" CodeBehind="CadastroPedidos.aspx.cs" Inherits="DesenvolvimentoWeb.Vendas.Views.CadastroPedidos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="conteudo" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-5">
                <h3>Forneça os dados</h3>
                <div class="form-group">
                    <asp:Label ID="clienteLabel" runat="server" Text="Cliente: "></asp:Label>
                    <asp:DropDownList ID="clienteDropDownList" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>

                <div class="form-group">
                    <asp:Label ID="dataLabel" runat="server" Text="Data: "></asp:Label>
                    <asp:TextBox ID="dataTextBox" CssClass="form-control" TextMode="Date" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator 
                        ID="dataRequiredFieldValidator" runat="server" 
                        ControlToValidate="dataTextBox"
                        CssClass="text-danger"                        
                        ErrorMessage="Este campo é obrigatorio" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <asp:Label ID="pedidoLabel" runat="server" Text="Num Pedido: "></asp:Label>
                    <asp:TextBox ID="pedidoTextBox" CssClass="form-control" MaxLength="20" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator 
                        ID="pedidoRequiredFieldValidator" runat="server" 
                        ControlToValidate="pedidoTextBox"
                        CssClass="text-danger"                        
                        ErrorMessage="Este campo é obrigatorio" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>                

                <div class="form-group">
                    <asp:Button ID="enviarButton" CssClass="btn btn-primary" runat="server" Text="Incluir pedido" OnClick="enviarButton_Click"/>
                </div>                

                <div style="margin-top:20px;">
                    <asp:Label ID="mensagemLabel" runat="server"></asp:Label>
                </div>
            </div>
        <div class="col-md-7">
            <%--<h3>Lista de clientes</h3>
            <asp:Repeater ID="clientesRepeater" runat="server">
                <HeaderTemplate>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>Cpf</th>
                                <th>Nome</th>
                                <th>Telefone</th>
                                <th>Email</th>
                            </tr>
                        </thead>
                        <tbody>
                </HeaderTemplate>

                <ItemTemplate>
                    <tr>
                        <td>
                            <asp:Label runat="server" Text='<%# Eval("Documento")%>'></asp:Label>
                        </td>
                        <td>
                            <asp:Label runat="server" Text='<%# Eval("Nome")%>'></asp:Label>
                        </td>
                        <td>
                            <asp:Label runat="server" Text='<%# Eval("Telefone")%>'></asp:Label>
                        </td>
                        <td>
                            <asp:Label runat="server" Text='<%# Eval("Email")%>'></asp:Label>
                        </td>
                    </tr>
                </ItemTemplate>

                <FooterTemplate>
                        </tbody>
                    </table>
                </FooterTemplate>
            </asp:Repeater>--%>
        </div>
        </div>
    </div>
</asp:Content>
