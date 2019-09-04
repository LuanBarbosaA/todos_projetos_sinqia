using DesenvolvimentoWeb.Vendas.Data;
using DesenvolvimentoWeb.Vendas.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DesenvolvimentoWeb.Vendas.Views
{
    public partial class AbrirChamado : System.Web.UI.Page
    {
        //OBJETO DE ACESSO AO SERVIÇO
        //HttpClient - presente no namespace System.Net.Http
        HttpClient client;

        public AbrirChamado()
        {
            if(client == null)
            {
                client = new HttpClient();
                client.BaseAddress = new Uri("http://localhost:50698/");
                client.DefaultRequestHeaders.Accept.Add(
                    new MediaTypeWithQualityHeaderValue("application/json"));
            }
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
                if(cliente == null)
                {
                    throw new Exception("Não existe nenhum cliente com o documento informado");
                }

                Chamado chamado = new Chamado();
                chamado.Assunto = assuntoDropDownList.SelectedValue;
                chamado.Documento = documentoTextBox.Text;
                chamado.Descricao = descricaoTextBox.Text;

                //criando o objeto no formato JSON
                string json = JsonConvert.SerializeObject(chamado);

                //definindo o json para um fluxo de bytes
                HttpContent content = new StringContent(
                    json, Encoding.Unicode, "application/json");

                //enviando o objeto serializado para o webservice
                var response = await client.PostAsync("api/chamados", content);

                //verificamos se ocorreu a inclusão corretamente
                if (response.IsSuccessStatusCode)
                {
                    mensagemLabel.CssClass = "alert alert-success";
                    mensagemLabel.Text = "Chamado aberto com sucesso";
                }
                else
                {
                    string erro = response.StatusCode + " - " +
                        response.ReasonPhrase;
                    throw new Exception(erro);
                }
            }
            catch (Exception ex)
            {
                mensagemLabel.CssClass = "alert alert-danger";
                mensagemLabel.Text = ex.Message;
            }
        }
    }
}