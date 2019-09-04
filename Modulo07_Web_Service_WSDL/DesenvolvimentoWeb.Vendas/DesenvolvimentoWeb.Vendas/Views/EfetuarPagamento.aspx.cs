using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DesenvolvimentoWeb.Vendas.Data;

namespace DesenvolvimentoWeb.Vendas.Views
{
    public partial class EfetuarPagamento : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                pedidosDropDownList.DataSource = PedidosDao.ListarPedidosVM();
                pedidosDropDownList.DataTextField = "NomeCliente";
                pedidosDropDownList.DataValueField = "NumeroPedido";
                pedidosDropDownList.DataBind();
            }
        }

        protected void pagamentoButton_Click(object sender, EventArgs e)
        {
            try
            {
                string numPedido = pedidosDropDownList.SelectedValue;
                double totalPedido = ItensDao.ListarItensPorPedido(numPedido).Sum(p => p.ValorTotalItem);
                string cartao = cartaoTextBox.Text;

                ServiceProxy.PagamentoContract pagamento = new ServiceProxy.PagamentoContract();
                pagamento.NumeroCartao = cartao;
                pagamento.NumeroPedido = numPedido;
                pagamento.Valor = totalPedido;

                ServiceProxy.ServicePagamentosClient service = new ServiceProxy.ServicePagamentosClient();

                int resposta = service.EfetuarPagamento(pagamento);

                switch (resposta)
                {
                    case 1: throw new Exception("Este cartão não existe");
                    case 2: throw new Exception("Este pedido já foi pago");
                    case 3: throw new Exception("Limite excedido");
                }
                mensagemLabel.CssClass = "text text-success";
                mensagemLabel.Text = "Pedido <strong>" + numPedido + "</strong> pago com sucesso";
            }
            catch (Exception ex)
            {
                mensagemLabel.CssClass = "text text-danger";
                mensagemLabel.Text = ex.Message;
            }
        }
    }
}