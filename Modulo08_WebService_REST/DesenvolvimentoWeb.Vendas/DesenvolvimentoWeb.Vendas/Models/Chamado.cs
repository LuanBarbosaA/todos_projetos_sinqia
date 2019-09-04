using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DesenvolvimentoWeb.Vendas.Models
{
    public class Chamado
    {
        public int ChamadoId { get; set; }
        public DateTime Data { get; set; }
        public string Documento { get; set; }
        public string Assunto { get; set; }
        public string Descricao { get; set; }
        public string Resposta { get; set; }
        public int Resolvido { get; set; } //0 - Pendente, 1 - Resolvido
    }
}