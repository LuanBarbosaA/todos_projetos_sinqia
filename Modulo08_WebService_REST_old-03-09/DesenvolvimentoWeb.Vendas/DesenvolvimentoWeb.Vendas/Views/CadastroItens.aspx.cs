using DesenvolvimentoWeb.Vendas.Data;
using DesenvolvimentoWeb.Vendas.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DesenvolvimentoWeb.Vendas.Views
{
	public partial class CadastroItens : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				pedidosDropDownList.DataSource = PedidosDao.ListarPedidosVM();
				pedidosDropDownList.DataTextField = "NomeCliente";
				pedidosDropDownList.DataValueField = "IdPedido";
				pedidosDropDownList.DataBind();

				produtosDropDownList.DataSource = ProdutosDao.ListarProdutos();
				produtosDropDownList.DataTextField = "Descricao";
				produtosDropDownList.DataValueField = "Id";
				produtosDropDownList.DataBind();
			}
		}

		protected void enviarButton_Click(object sender, EventArgs e)
		{
			try
			{
				Item item = new Item();
				item.IdPedido = int.Parse(pedidosDropDownList.SelectedValue);
				item.IdProduto = int.Parse(produtosDropDownList.SelectedValue);
				item.Quantidade = double.Parse(quantidadeTextBox.Text);

				ItensDao.IncluirItem(item);

				mensagemLabel.CssClass = "alert alert-success";
				mensagemLabel.Text = "Item incluído com sucesso";
			}
			catch (Exception ex)
			{
				mensagemLabel.CssClass = "alert alert-danger";
				mensagemLabel.Text = ex.Message;
			}
		}
	}
}