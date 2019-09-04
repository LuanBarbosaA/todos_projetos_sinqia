using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace Projeto01_ServicosWCF.Models
{
    [DataContract]
    public class Aluno
    {
        [DataMember]
        public int Matricula { get; set; }

        [DataMember]
        public string Nome { get; set; }

        [DataMember]
        public int Idade { get; set; }

        [DataMember]
        public string Curso { get; set; }
    }
}