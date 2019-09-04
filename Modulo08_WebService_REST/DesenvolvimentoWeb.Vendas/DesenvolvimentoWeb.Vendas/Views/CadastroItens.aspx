<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layout.Master" AutoEventWireup="true" CodeBehind="CadastroItens.aspx.cs" Inherits="DesenvolvimentoWeb.Vendas.Views.CadastroItens" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="conteudo" runat="server">
    <div class="container">
    
        <h2 class="text-center text-primary">Inclusão de Pedidos</h2>

        <div class="row">
            <div class="col-md-5">
                <h3 class="text-center">Forneça os dados</h3>

                <%-- Pedido + Cliente --%>
                <div class="form-group">
                    <asp:Label ID="pedidoLabel" runat="server" Text="Pedido:"></asp:Label>
                    <asp:DropDownList ID="pedidosDropDownList" 
                        runat="server" CssClass="form-control"></asp:DropDownList>                    
                </div>

                <%-- Produto --%>
                <div class="form-group">
                    <asp:Label ID="produtoLabel" runat="server" Text="Produto:"></asp:Label>
                    <asp:DropDownList ID="produtosDropDownList" 
                        runat="server" CssClass="form-control"></asp:DropDownList>                    
                </div>

                <%-- Quantidade --%>
                <div class="form-group">
                    <asp:Label ID="quantidadeLabel" runat="server" Text="Quantidade:"></asp:Label>
                    <asp:TextBox ID="quantidadeTextBox"
                        CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RangeValidator 
                        ID="quantidadeRangeValidator" 
                        runat="server" 
                        CssClass="text-danger"
                        ErrorMessage="A quantidade deve ser um valor entre 1 e 100" 
                        ControlToValidate="quantidadeTextBox" 
                        Display="Dynamic" 
                        MinimumValue="1" 
                        MaximumValue="100" 
                        Type="Double"></asp:RangeValidator>
                </div>

                <div class="form-group">
                    <asp:Button ID="enviarButton" CssClass="btn btn-primary"
                        runat="server" Text="Incluir Item" OnClick="enviarButton_Click" />
                </div>

                <div class="form-group" style="width:100%;">
                    <asp:Label ID="mensagemLabel" runat="server"></asp:Label>
                </div>
            </div>

            <div class="col-md-7">

<%--                <h3 class="text-center">Lista de Clientes</h3>

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
                                <asp:Label runat="server" Text='<%# Eval("Documento")  %>' ></asp:Label>
                            </td>
                            <td>
                                <asp:Label runat="server" Text='<%# Eval("Nome")  %>' ></asp:Label>
                            </td>
                            <td>
                                <asp:Label runat="server" Text='<%# Eval("Telefone")  %>' ></asp:Label>
                            </td>
                            <td>
                                <asp:Label runat="server" Text='<%# Eval("Email")  %>' ></asp:Label>
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
