using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DesenvolvimentoWeb.Vendas.Data;

namespace DesenvolvimentoWeb.Vendas.Views
{
    public partial class ListaItens : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                pedidosDropDownList.DataSource = PedidosDao.ListarPedidosVM();
                pedidosDropDownList.DataTextField = "NomeCliente";
                pedidosDropDownList.DataValueField = "NumeroPedido";
                pedidosDropDownList.DataBind();
                pedidosDropDownList.Items.Insert(0, "Selecione um pedido");
            }
        }

        protected void pedidosDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            ListarItens();
        }

        protected void excluirLinkButton_Click(object sender, EventArgs e)
        {
            var x = ((LinkButton)sender).CommandArgument;

            ItensDao.RemoverItem(int.Parse(x));
            ListarItens();
        }

        private void ListarItens()
        {
            try
            {
                string numeroPedido = pedidosDropDownList.SelectedValue;
                ItensRepeater.DataSource = ItensDao.ListarItensPorPedido(numeroPedido);
                ItensRepeater.DataBind();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
                //throw;
            }
        }
    }
}