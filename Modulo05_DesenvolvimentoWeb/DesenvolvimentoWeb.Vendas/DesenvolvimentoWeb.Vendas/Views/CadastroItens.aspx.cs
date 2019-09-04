using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DesenvolvimentoWeb.Vendas.Data;
using DesenvolvimentoWeb.Vendas.Models;

namespace DesenvolvimentoWeb.Vendas.Views
{
    public partial class CadastroItens : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                pedidoDropDownList.DataSource = PedidosDao.ListarPedidosVM();
                pedidoDropDownList.DataTextField = "NomeCliente";
                pedidoDropDownList.DataValueField = "IdPedido";
                pedidoDropDownList.DataBind();

                produtoDropDownList.DataSource = ProdutosDao.ListarProdutos();
                produtoDropDownList.DataTextField = "Descricao";
                produtoDropDownList.DataValueField = "Id";
                produtoDropDownList.DataBind();
            }
        }

        protected void enviarButton_Click(object sender, EventArgs e)
        {
            try
            {
                Item item = new Item();
                item.IdPedido = int.Parse(pedidoDropDownList.SelectedValue);
                item.IdProduto = int.Parse(produtoDropDownList.SelectedValue);
                item.Quantidade = double.Parse(quantidadeTextBox.Text);

                ItensDao.IncluirItem(item);

                mensagemLabel.CssClass = "alert alert-success";
                mensagemLabel.Text = "Item incluido com sucesso";
            }
            catch (Exception ex)
            {
                mensagemLabel.CssClass = "alert alert-danger";
                mensagemLabel.Text = ex.Message;
                //throw;
            }
        }
    }
}