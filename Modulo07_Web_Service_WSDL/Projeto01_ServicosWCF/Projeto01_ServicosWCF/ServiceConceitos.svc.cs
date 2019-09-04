using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using Projeto01_ServicosWCF.Models;

namespace Projeto01_ServicosWCF
{
    // OBSERVAÇÃO: Você pode usar o comando "Renomear" no menu "Refatorar" para alterar o nome da classe "Service1" no arquivo de código, svc e configuração ao mesmo tempo.
    // OBSERVAÇÃO: Para iniciar o cliente de teste do WCF para testar esse serviço, selecione Service1.svc ou Service1.svc.cs no Gerenciador de Soluções e inicie a depuração.
    public class ServiceConceitos : IServiceConceitos
    {
        private List<Aluno> alunos = new List<Aluno>();

        public void AdicionarAlunos(Aluno aluno)
        {
            alunos.Add(aluno);
        }

        public double CalcularSoma(double x, double y)
        {
            return x + y;
        }

        public List<Aluno> ListarAlunos()
        {
            return alunos;
        }

        public List<string> ListarNomes()
        {
            return new List<string>
            {
                "Francisco", "Guilherme", "Luan", "Caiky", "Pedro"
            };
        }
    }
}
