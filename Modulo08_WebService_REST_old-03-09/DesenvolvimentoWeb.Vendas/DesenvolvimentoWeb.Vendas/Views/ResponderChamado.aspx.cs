using DesenvolvimentoWeb.Vendas.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DesenvolvimentoWeb.Vendas.Views
{
    public partial class ResponderChamado : System.Web.UI.Page
    {
        HttpClient client;

        public ResponderChamado()
        {
            client = new HttpClient();
            client.BaseAddress = new Uri("http://localhost:50698/");
            client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
        }

        protected async void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    HttpResponseMessage response = client.GetAsync("chamadosPendentes").Result;
                    if (response.IsSuccessStatusCode)
                    {
                        var resultado = await response.Content.ReadAsStringAsync();

                        var lista = JsonConvert.DeserializeObject<Chamado[]>(resultado).ToList();

                        chamadoDropDownList.DataSource = lista;
                        chamadoDropDownList.DataTextField = "ChamadoId";
                        chamadoDropDownList.DataValueField = "ChamadoId";
                        chamadoDropDownList.DataBind();
                    }
                }
                catch (Exception ex)
                {
                    
                }
            }
        }

        protected async void buscarButton_Click(object sender, EventArgs e)
        {
            try
            {
                int id = int.Parse(chamadoDropDownList.SelectedValue);
                HttpResponseMessage response = client.GetAsync("api/chamados/").Result;
                if (response.IsSuccessStatusCode)
                {
                    var resultado = await response.Content.ReadAsStringAsync();

                    var lista = JsonConvert.DeserializeObject<Chamado[]>(resultado).ToList();
                }
            }
            catch (Exception ex)
            {

                throw;
            }
        }

        protected void responderButton_Click(object sender, EventArgs e)
        {

        }
    }
}