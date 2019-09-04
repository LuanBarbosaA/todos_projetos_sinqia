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
	public partial class CadastroPedidos : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				clienteDropDownList.DataSource = ClientesDao.ListarClientes();
				clienteDropDownList.DataTextField = "Nome";
				clienteDropDownList.DataValueField = "Documento";
				clienteDropDownList.DataBind();
			}
		}

		protected void enviarButton_Click(object sender, EventArgs e)
		{
			try
			{
				Pedido pedido = new Pedido();
				pedido.DocCliente = clienteDropDownList.SelectedValue;
				pedido.Data = Convert.ToDateTime(dataTextBox.Text);
				pedido.NumeroPedido = pedidoTextBox.Text;

				PedidosDao.IncluirPedido(pedido);

				mensagemLabel.CssClass = "alert alert-success";
				mensagemLabel.Text = "Pedido incluído com sucesso";
			}
			catch (Exception ex)
			{
				mensagemLabel.CssClass = "alert alert-danger";
				mensagemLabel.Text = ex.Message;
			}
		}
	}
}