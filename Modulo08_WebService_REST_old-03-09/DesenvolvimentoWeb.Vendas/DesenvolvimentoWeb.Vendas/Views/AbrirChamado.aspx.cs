using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Http;
using System.Net.Http.Headers;
using DesenvolvimentoWeb.Vendas.Models;
using DesenvolvimentoWeb.Vendas.Data;
using Newtonsoft.Json;
using System.Text;
using System.Threading.Tasks;

namespace DesenvolvimentoWeb.Vendas.Views
{
    public partial class AbrirChamado : System.Web.UI.Page
    {
        HttpClient client;

        public AbrirChamado()
        {
            client = new HttpClient();
            client.BaseAddress = new Uri("http://localhost:50698/");
            client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                assuntoDropDownList.Items.Add("RECLAMAÇÃO");
                assuntoDropDownList.Items.Add("SUGESTÃO");
                assuntoDropDownList.Items.Add("ELOGIOS");
                assuntoDropDownList.Items.Add("TROCAS");
                assuntoDropDownList.Items.Add("DÚVIDAS");
            }
        }

        protected async void enviarButton_Click(object sender, EventArgs e)
        {
            try
            {
                var cliente = ClientesDao.BuscarCliente(documentoTextBox.Text);
                if (cliente == null)
                {
                    throw new Exception("Não existe nenhum cliente com o documento informado");
                }
                Chamado chamado = new Chamado();
                chamado.Assunto = assuntoDropDownList.SelectedValue;
                chamado.Documento = documentoTextBox.Text;
                chamado.Descricao = descricaoTextBox.Text;

                //criando objeto em formato json
                string json = JsonConvert.SerializeObject(chamado);

                //definindo o fluxo de bytes
                HttpContent content = new StringContent(json, Encoding.Unicode, "application/json");

                //enviando objeto serializado
                var response = await client.PostAsync("api/chamados", content);

                //verificamos se ocorreu a inclusão corretamente
                if (response.IsSuccessStatusCode)
                {
                    mensagemLabel.CssClass = "alert alert-success";
                    mensagemLabel.Text = "Chamado aberto com sucesso";
                }
                else
                {
                    string erro = response.StatusCode + " - " + response.ReasonPhrase;
                    throw new Exception(erro);
                }
            }
            catch (Exception ex)
            {
                mensagemLabel.CssClass = "alert alert-success";
                mensagemLabel.Text = ex.Message;
            }
        }
    }
}