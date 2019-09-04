using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Projeto02_ApiChamados.Models
{
    //Relacionamento de Agregação: Toda pessoa TEM um Endereco


    public class Pessoa
    {
        public string Nome { get; set; }
        public DateTime DataNascimento { get; set; }
        public Endereco EnderecoInfo { get; set; }
    }
}