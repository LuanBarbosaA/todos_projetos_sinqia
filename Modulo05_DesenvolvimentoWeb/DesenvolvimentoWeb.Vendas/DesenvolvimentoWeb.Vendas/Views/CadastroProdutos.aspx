<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layout.Master" AutoEventWireup="true" CodeBehind="CadastroProdutos.aspx.cs" Inherits="DesenvolvimentoWeb.Vendas.Views.CadastroProdutos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="conteudo" runat="server">
    <h2>Cadastro Produtos</h2>
     <div class="container">
        <div class="row">
            <div class="col-md-5">
                <h3>Forneça os dados</h3>
                <div class="form-group">
                    <asp:Label ID="categoriaLabel" runat="server" Text="Categoria: "></asp:Label>
                    <asp:DropDownList ID="categoriaDropDownList" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>

                <div class="form-group">
                    <asp:Label ID="descricaoLabel" runat="server" Text="Descricao: "></asp:Label>
                    <asp:TextBox ID="descricaoTextBox" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator 
                        ID="descricaoRequiredFieldValidator" runat="server" 
                        ControlToValidate="descricaoTextBox"
                        CssClass="text-danger"                        
                        ErrorMessage="Este campo é obrigatorio" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <asp:Label ID="unidadeLabel" runat="server" Text="Unidade: "></asp:Label>
                    <asp:DropDownList ID="unidadeDropDownList" CssClass="form-control" runat="server"></asp:DropDownList>                    
                </div>

                <div class="form-group">
                    <asp:Label ID="precoLabel" runat="server" Text="Preço: "></asp:Label>
                    <asp:TextBox ID="precoTextBox" CssClass="form-control" placeholder="R$ 0,00" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator 
                        ID="precoRequiredFieldValidator" runat="server" 
                        ControlToValidate="precoTextBox"
                        CssClass="text-danger"                        
                        ErrorMessage="Este campo é obrigatorio" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" 
                        ErrorMessage="O valor deve ser entre 1 e 1000 reais"
                        ControlToValidate="precoTextBox"
                        Display="Dynamic"
                        MaximumValue="1000"
                        MinimumValue="1"
                        Type="Double"></asp:RangeValidator>
                </div>

                <div class="form-group">
                    <asp:Label ID="figuraLabel" runat="server" Text="Figura: "></asp:Label>
                    <asp:FileUpload ID="figuraFileUpload" CssClass="form-control" runat="server"></asp:FileUpload>
                </div>

                <div class="form-group">
                    <asp:Button ID="enviarButton" CssClass="btn btn-primary" runat="server" Text="Incluir Cliente" OnClick="enviarButton_Click"/>
                </div>                

                <div style="margin-top:20px;">
                    <asp:Label ID="mensagemLabel" runat="server"></asp:Label>
                </div>
            </div>
        <div class="col-md-7">
            <h3>Lista de produtos</h3>
            <asp:Repeater ID="produtosRepeater" runat="server" OnItemDataBound="produtosRepeater_ItemDataBound">
                <HeaderTemplate>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Descrição</th>
                                <th>Preço</th>
                                <th>Imagem</th>
                            </tr>
                        </thead>
                        <tbody>
                </HeaderTemplate>

                <ItemTemplate>
                    <tr>
                        <td>
                            <asp:Label runat="server" Text='<%# Eval("Id")%>'></asp:Label>
                        </td>
                        <td>
                            <asp:Label runat="server" Text='<%# Eval("Descricao")%>'></asp:Label>
                        </td>
                        <td>
                            <asp:Label runat="server" Text='<%# Eval("Preco")%>'></asp:Label>
                        </td>
                        <td>
                            <asp:HiddenField runat="server" ID="idHiddenField" Value='<%# Eval("Id")%>'/>
                            <asp:Image ID="produtoImage" Width="100" runat="server" />                            
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
