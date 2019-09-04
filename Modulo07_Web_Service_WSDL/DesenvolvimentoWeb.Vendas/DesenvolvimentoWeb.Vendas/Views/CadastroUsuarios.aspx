<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layout.Master" AutoEventWireup="true" CodeBehind="CadastroUsuarios.aspx.cs" Inherits="DesenvolvimentoWeb.Vendas.Views.CadastroUsuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="conteudo" runat="server">
    <div class="container">
        <h2 class="text-center text-primary">Cadastro de Usuários</h2>
        <div class="row">
            <div class="col-md-5">
                <div class="form-group">
                    <asp:Label ID="nomeLabel" runat="server" Text="Nome"></asp:Label>
                    <asp:TextBox ID="nomeTextBox" runat="server" MaxLength="20" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator 
                        ID="nomeRequiredFieldValidator" runat="server" 
                        ControlToValidate="nomeTextBox"
                        CssClass="text-danger"                        
                        ErrorMessage="Este campo é obrigatorio" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <asp:Label ID="senhaLabel" runat="server" Text="Senha"></asp:Label>
                    <asp:TextBox ID="senhaTextBox" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator 
                        ID="senhaRequiredFieldValidator" runat="server" 
                        ControlToValidate="senhaTextBox"
                        CssClass="text-danger"                        
                        ErrorMessage="Este campo é obrigatorio" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <asp:Label ID="confirmaLabel" runat="server" Text="Confirme sua senha"></asp:Label>
                    <asp:TextBox ID="confirmaTextBox" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>                    
                    <asp:CompareValidator ID="CompareValidator1" runat="server"
                        ErrorMessage="A senha não confere"
                        ControlToValidate="confirmaTextBox"
                        ControlToCompare="senhaTextBox"
                        Display="Dynamic"></asp:CompareValidator>
                </div>

                <div class="form-group">
                    <asp:Button ID="enviarButton" CssClass="btn btn-primary" runat="server" Text="Incluir Usuário" OnClick="enviarButton_Click"/>
                </div>                

                <div style="margin-top:20px;">
                    <asp:Label ID="mensagemLabel" runat="server"></asp:Label>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
