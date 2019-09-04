using Projeto02_ApiChamados.Dados;
using Projeto02_ApiChamados.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Projeto02_ApiChamados.Controllers
{
    public class ChamadosController : ApiController
    {
        //propriedade para acessar os métodos de acesso a dados
        private ChamadosDao Dao { get; set; }

        //construtor incluído para instanciar a classe ChamadosDao,
        //se nenhuma instância for encontrada
        public ChamadosController()
        {
            if(Dao == null)
            {
                Dao = new ChamadosDao();
            }
        }

        //HTTP GET - Todos os chamados
        public IEnumerable<Chamado> GetChamados()
        {
            return Dao.BuscarChamados();
        }

        [HttpGet]
        [Route("chamadosPendentes")]
        public IEnumerable<Chamado> GetChamadosPendentes()
        {
            return Dao.BuscarChamados().Where(p => p.Resolvido == 0);
        }

        [HttpGet]
        [Route("chamadosResolvidos")]
        public IEnumerable<Chamado> GetChamadosResolvidos()
        {
            return Dao.BuscarChamados().Where(p => p.Resolvido == 1);
        }

        [HttpGet]
        public Chamado GetChamado(int id)
        {
            return Dao.BuscarChamados().FirstOrDefault(p => p.ChamadoId == id);
        }

        //HTTP POST - Incluir um novo Chamado
        public HttpResponseMessage PostChamado(Chamado chamado)
        {
            if (Dao.IncluirChamado(chamado))
            {
                var response = Request
                    .CreateResponse<Chamado>(HttpStatusCode.Created, chamado);

                string uri = Url.Link("DefaultApi", new { id = chamado.ChamadoId });
                response.Headers.Location = new Uri(uri);

                return response;
            }
            else
            {
                var erro = new HttpResponseMessage(HttpStatusCode.BadRequest)
                {
                    Content = new StringContent("Erro no serviço"),
                    ReasonPhrase = "Não foi possivel incluir o chamado."
                };

                throw new HttpResponseException(erro);
            }
        }

        //HTTP DELETE - Remover um chamado pelo id
        public HttpResponseMessage DeleteChamado(int id)
        {
            if (Dao.RemoverChamado(id))
            {
                var response = new HttpResponseMessage(HttpStatusCode.OK);

                string uri = Url.Link("DefaultApi", new { id });
                response.Headers.Location = new Uri(uri);

                return response;
            }
            else
            {
                var erro = new HttpResponseMessage(HttpStatusCode.BadRequest)
                {
                    Content = new StringContent("Erro no serviço"),
                    ReasonPhrase = "Este chamado já foi finalizado."
                };

                throw new HttpResponseException(erro);
            }
        }
    }
}
