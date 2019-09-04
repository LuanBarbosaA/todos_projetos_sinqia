<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layout.Master" AutoEventWireup="true" CodeBehind="CadastroClientes.aspx.cs" Inherits="DesenvolvimentoWeb.Vendas.Views.CadastroClientes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="conteudo" runat="server">
    <h2>Cadastro de clientes</h2>
    <div class="container">
        <div class="row">
            <div class="col-md-5">
                <h3>Forneça os dados</h3>
                <div class="form-group">
                    <asp:Label ID="documentoLabel" runat="server" Text="Documento: "></asp:Label>
                    <asp:TextBox ID="documentoTextBox" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator 
                        ID="documentoRequiredFieldValidator" runat="server" 
                        ControlToValidate="documentoTextBox"
                        CssClass="text-danger"                        
                        ErrorMessage="Este campo é obrigatorio" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <asp:Label ID="nomeLabel" runat="server" Text="Nome: "></asp:Label>
                    <asp:TextBox ID="nomeTextBox" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator 
                        ID="nomeRequiredFieldValidator" runat="server" 
                        ControlToValidate="nomeTextBox"
                        CssClass="text-danger"                        
                        ErrorMessage="Este campo é obrigatorio" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <asp:Label ID="telefoneLabel" runat="server" Text="Telefone: "></asp:Label>
                    <asp:TextBox ID="telefoneTextBox" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator 
                        ID="telefoneRequiredFieldValidator" runat="server" 
                        ControlToValidate="telefoneTextBox"
                        CssClass="text-danger"                        
                        ErrorMessage="Este campo é obrigatorio" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <asp:Label ID="emailLabel" runat="server" Text="Email: "></asp:Label>
                    <asp:TextBox ID="emailTextBox" CssClass="form-control" TextMode="Email" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator 
                        ID="emailRequiredFieldValidator" runat="server" 
                        ControlToValidate="emailTextBox"
                        CssClass="text-danger"                        
                        ErrorMessage="Este campo é obrigatorio" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator 
                        ID="RegularExpressionValidator1" runat="server" 
                        ErrorMessage="Email inválido"
                        ControlToValidate="emailTextBox" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                        ></asp:RegularExpressionValidator>
                </div>

                <div class="form-group">
                    <asp:Button ID="enviarButton" CssClass="btn btn-primary" runat="server" Text="Incluir Cliente" OnClick="enviarButton_Click"/>
                </div>                

                <div style="margin-top:20px;">
                    <asp:Label ID="mensagemLabel" runat="server"></asp:Label>
                </div>
            </div>
        <div class="col-md-7">
            <h3>Lista de clientes</h3>
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
            </asp:Repeater>
        </div>
    </div>
    </div>
</asp:Content>
