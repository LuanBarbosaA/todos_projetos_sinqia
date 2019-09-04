<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layout.Master" AutoEventWireup="true" CodeBehind="CadastroProdutos.aspx.cs" Inherits="DesenvolvimentoWeb.Vendas.Views.CadastroProdutos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="conteudo" runat="server">
        
    <div class="container">
    
        <h2 class="text-center text-primary">Cadastro de Produtos</h2>

        <div class="row">
            <div class="col-md-5">
                <h3 class="text-center">Forneça os dados</h3>

                <%-- Categoria --%>
                <div class="form-group">
                    <asp:Label ID="categoriaLabel" runat="server" Text="Categoria:"></asp:Label>
                    <asp:DropDownList ID="categoriaDropDownList" 
                        runat="server" CssClass="form-control"></asp:DropDownList>                    
                </div>

                <%-- Descrição --%>
                <div class="form-group">
                    <asp:Label ID="descricaoLabel" runat="server" Text="Descrição:"></asp:Label>
                    <asp:TextBox ID="descricaoTextBox"
                        CssClass="form-control" runat="server"></asp:TextBox>
                </div>

                <%-- Unidade --%>
                <div class="form-group">
                    <asp:Label ID="unidadeLabel" runat="server" Text="Unidade:"></asp:Label>
                    <asp:DropDownList ID="unidadeDropDownList" 
                        runat="server" CssClass="form-control"></asp:DropDownList>                    
                </div>

                <%-- Preço --%>
                <div class="form-group">
                    <asp:Label ID="precoLabel" runat="server" Text="Preço:"></asp:Label>
                    <asp:TextBox ID="precoTextBox" 
                        CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator 
                        ID="precoRequiredFieldValidator" 
                        runat="server" 
                        CssClass="text-danger"
                        ControlToValidate="precoTextBox"
                        ErrorMessage="O Preço deve ser informado" 
                        Display="Dynamic"></asp:RequiredFieldValidator>

                    <asp:RangeValidator 
                        ID="precoRangeValidator" 
                        runat="server" 
                        CssClass="text-danger"
                        ErrorMessage="O valor deve ser entre 1 e 10000 reais" 
                        ControlToValidate="precoTextBox" 
                        Display="Dynamic" 
                        MinimumValue="1" 
                        MaximumValue="10000" 
                        Type="Double"></asp:RangeValidator>

                </div>

                <%-- Figura --%>
                <div class="form-group">
                    <asp:Label ID="figuraLabel" runat="server" Text="Figura:"></asp:Label>
                    <asp:FileUpload ID="figuraFileUpload" 
                        runat="server" CssClass="form-control" />
                </div>

                <div class="form-group">
                    <asp:Button ID="enviarButton" CssClass="btn btn-primary"
                        runat="server" Text="Incluir Produto" OnClick="enviarButton_Click" />
                </div>

                <div class="form-group">
                    <asp:Label ID="mensagemLabel" runat="server"></asp:Label>
                </div>
            </div>


            <div class="col-md-7">

                <h3 class="text-center">Lista de Produtos</h3>

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
                                <asp:Label runat="server" Text='<%# Eval("Id")  %>' ></asp:Label>
                            </td>
                            <td>
                                <asp:Label runat="server" Text='<%# Eval("Descricao")  %>' ></asp:Label>
                            </td>
                            <td>
                                <asp:Label runat="server" Text='<%# Eval("Preco") %>' ></asp:Label>
                            </td>
                            <td>
                                <asp:HiddenField runat="server" ID="idHiddenField" Value='<%# Eval("Id")  %>' />
                                <asp:Image ID="produtoImage" runat="server" Width="100" />
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
