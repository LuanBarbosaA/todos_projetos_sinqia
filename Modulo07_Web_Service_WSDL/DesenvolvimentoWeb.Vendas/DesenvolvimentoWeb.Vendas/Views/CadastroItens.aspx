<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layout.Master" AutoEventWireup="true" CodeBehind="CadastroItens.aspx.cs" Inherits="DesenvolvimentoWeb.Vendas.Views.CadastroItens" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="conteudo" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-5">
                <h3>Forneça os dados</h3>
                <div class="form-group">
                    <asp:Label ID="categoriaLabel" runat="server" Text="Pedido: "></asp:Label>
                    <asp:DropDownList ID="pedidoDropDownList" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>                

                <div class="form-group">
                    <asp:Label ID="produtoLabel" runat="server" Text="Produto: "></asp:Label>
                    <asp:DropDownList ID="produtoDropDownList" CssClass="form-control" runat="server"></asp:DropDownList>
                </div>

                <div class="form-group">
                    <asp:Label ID="quantidadeLabel" runat="server" Text="Quantidade: "></asp:Label>
                    <asp:TextBox ID="quantidadeTextBox" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator 
                        ID="quantidadeRequiredFieldValidator" runat="server" 
                        ControlToValidate="quantidadeTextBox"
                        CssClass="text-danger"                        
                        ErrorMessage="Este campo é obrigatorio" Display="Dynamic"></asp:RequiredFieldValidator>

                    <asp:RangeValidator ID="RangeValidator1" runat="server" 
                        ErrorMessage="A quantidade deve ser entre 1 e 100"
                        ControlToValidate="quantidadeTextBox"
                        Display="Dynamic"
                        MaximumValue="100"
                        MinimumValue="1"
                        Type="Integer"></asp:RangeValidator>
                </div>
                
                <div class="form-group">
                    <asp:Button ID="enviarButton" CssClass="btn btn-primary" runat="server" Text="Incluir Itens" OnClick="enviarButton_Click"/>
                </div>                

                <div style="margin-top:20px;">
                    <asp:Label ID="mensagemLabel" runat="server"></asp:Label>
                </div>
            </div>
        <%--<div class="col-md-7">
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
        </div>--%>
        </div>
    </div>
</asp:Content>
