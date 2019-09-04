<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layout.Master" AutoEventWireup="true" CodeBehind="CadastroUsuarios.aspx.cs" Inherits="DesenvolvimentoWeb.Vendas.Views.CadastroUsuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="conteudo" runat="server">

    <div class="container">
        <h2 class="text-center text-primary">Cadastro de Usuários</h2>
        <div class="row">
            <div class="col-md-5">

                <div class="form-group">
                    <asp:Label ID="nomeLabel" runat="server" Text="Nome:"></asp:Label>
                    <asp:TextBox ID="nomeTextBox"
                        CssClass="form-control" MaxLength="20" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator
                        ID="nomeRequiredFieldValidator"
                        runat="server"
                        CssClass="text-danger"
                        ControlToValidate="nomeTextBox"
                        ErrorMessage="O nome do usuário deve ser informado"
                        Display="Dynamic"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <asp:Label ID="senhaLabel" runat="server" Text="Senha:"></asp:Label>
                    <asp:TextBox ID="senhaTextBox" TextMode="Password"
                        CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator
                        ID="senhaRequiredFieldValidator"
                        runat="server"
                        CssClass="text-danger"
                        ControlToValidate="senhaTextBox"
                        ErrorMessage="A senha deve ser informada"
                        Display="Dynamic"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <asp:Label ID="confirmaLabel" runat="server" 
                        Text="Confirme sua Senha:"></asp:Label>
                    <asp:TextBox ID="confirmaTextBox" TextMode="Password"
                        CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:CompareValidator 
                        ID="confirmaCompareValidator" 
                        runat="server" 
                        CssClass="text-danger"
                        ErrorMessage="As senhas não conferem"
                        ControlToValidate="confirmaTextBox"
                        ControlToCompare="senhaTextBox"
                        Display="Dynamic"></asp:CompareValidator>
                </div>

                <div class="form-group">
                    <asp:Button ID="enviarButton" CssClass="btn btn-primary"
                        runat="server" Text="Incluir Usuário" 
                        OnClick="enviarButton_Click" />
                </div>

                <div class="form-group">
                    <asp:Label ID="mensagemLabel" runat="server"></asp:Label>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
