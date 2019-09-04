using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DesenvolvimentoWeb.Vendas.ViewModels
{
	public class ItensPedidoViewModel
	{
		public int IdItem { get; set; }
		public string DescricaoProduto { get; set; }
		public string NumeroPedido { get; set; }
		public DateTime DataPedido { get; set; }
		public double ValorTotalItem { get; set; }

	}
}