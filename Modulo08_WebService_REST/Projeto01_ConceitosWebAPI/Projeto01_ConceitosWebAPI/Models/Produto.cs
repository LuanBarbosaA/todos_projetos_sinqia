using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Projeto01_ConceitosWebAPI.Models
{
    public class Produto
    {
        public int Id { get; set; }
        public string Descricao { get; set; }
        public double Preco { get; set; }
        public Categoria CatProduto { get; set; }
    }
}