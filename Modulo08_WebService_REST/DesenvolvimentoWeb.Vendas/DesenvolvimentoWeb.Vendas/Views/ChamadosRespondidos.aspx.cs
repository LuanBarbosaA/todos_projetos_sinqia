using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DesenvolvimentoWeb.Vendas.Models;
using System.Net.Http.Headers;
using Newtonsoft.Json;

namespace DesenvolvimentoWeb.Vendas.Views
{
    public partial class ChamadosRespondidos : System.Web.UI.Page
    {
        HttpClient client;
        static Chamado chamado = null;
        public ChamadosRespondidos()
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
            ListarChamados();
        }

        private async void ListarChamados()
        {
            try
            {
                HttpResponseMessage response =
                        client.GetAsync("chamadosResolvidos").Result;

                if (response.IsSuccessStatusCode)
                {
                    var resultado = await response.Content.ReadAsStringAsync();

                    var lista = JsonConvert
                        .DeserializeObject<Chamado[]>(resultado)
                        .ToList();

                    itensRepeater.DataSource = lista;
                    itensRepeater.DataBind();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}