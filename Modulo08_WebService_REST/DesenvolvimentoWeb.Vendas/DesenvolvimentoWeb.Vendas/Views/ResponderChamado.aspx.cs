using DesenvolvimentoWeb.Vendas.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DesenvolvimentoWeb.Vendas.Views
{
    public partial class ResponderChamado : System.Web.UI.Page
    {
        HttpClient client;
        static Chamado chamado = null;
        public ResponderChamado()
        {
            if (client == null)
            {
                client = new HttpClient();
                client.BaseAddress = new Uri("http://localhost:50698/");
                client.DefaultRequestHeaders.Accept.Add(
                    new MediaTypeWithQualityHeaderValue("application/json"));
            }
        }

        protected async void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    HttpResponseMessage response =
                        client.GetAsync("chamadosPendentes").Result;

                    if (response.IsSuccessStatusCode)
                    {
                        var resultado = await response.Content.ReadAsStringAsync();

                        var lista = JsonConvert
                            .DeserializeObject<Chamado[]>(resultado)
                            .ToList();

                        chamadoDropDownList.DataSource = lista;
                        chamadoDropDownList.DataTextField = "ChamadoId";
                        chamadoDropDownList.DataValueField = "ChamadoId";
                        chamadoDropDownList.DataBind();

                        enviarButton.Enabled = (chamado != null);
                    }
                }
                catch (Exception)
                {
                    throw;
                }
            }
        }
        
        protected async void buscarButton_Click(object sender, EventArgs e)
        {
            try
            {
                int id = int.Parse(chamadoDropDownList.SelectedValue);
                HttpResponseMessage response =
                    client.GetAsync("api/chamados/" + id).Result;

                if (response.IsSuccessStatusCode)
                {
                    var resultado = await response.Content.ReadAsStringAsync();

                    chamado = JsonConvert
                        .DeserializeObject<Chamado>(resultado);

                    enviarButton.Enabled = (chamado != null);

                    descricaoTextBox.Text = chamado.Assunto + "\n\n" + chamado.Descricao;
                }
            }
            catch (Exception ex)
            {
                throw new Exception("", ex);
            }
        }

        protected async void enviarButton_Click(object sender, EventArgs e)
        {
            try
            {
                if(chamado == null)
                {
                    throw new Exception("Por favor, buscar o chamado");
                }

                chamado.Resposta = responderTextBox.Text;

                string json = JsonConvert.SerializeObject(chamado);

                HttpContent content = new StringContent(
                    json, Encoding.Unicode, "application/json");

                var response = await client.PutAsync("api/chamados", content);

                if (response.IsSuccessStatusCode)
                {
                    mensagemLabel.CssClass = "alert alert-success";
                    mensagemLabel.Text = "Chamado respondido com sucesso";
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

        protected async void removerButton_Click(object sender, EventArgs e)
        {
            try
            {
                if (chamado == null)
                {
                    throw new Exception("Por favor, buscar o chamado");
                }

                int id = Convert.ToInt32(chamadoDropDownList.SelectedValue);

                string json = JsonConvert.SerializeObject(chamado);

                HttpContent content = new StringContent(
                    json, Encoding.Unicode, "application/json");

                var response = await client.DeleteAsync("api/chamados/" + id);

                if (response.IsSuccessStatusCode)
                {
                    mensagemLabel.CssClass = "alert alert-success";
                    mensagemLabel.Text = "Chamado apagado com sucesso com sucesso";
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