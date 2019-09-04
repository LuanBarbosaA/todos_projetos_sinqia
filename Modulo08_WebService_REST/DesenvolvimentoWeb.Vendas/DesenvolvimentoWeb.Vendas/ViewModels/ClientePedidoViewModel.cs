using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DesenvolvimentoWeb.Vendas.ViewModels
{
	public class ClientePedidoViewModel
	{
		public string DocumentoCliente { get; set; }
		public string NomeCliente { get; set; }
		public string NumeroPedido { get; set; }
		public int IdPedido { get; set; }
	}
}