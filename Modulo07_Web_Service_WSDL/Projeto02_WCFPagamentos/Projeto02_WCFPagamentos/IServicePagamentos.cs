using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using Projeto02_WCFPagamentos.Models;

namespace Projeto02_WCFPagamentos
{
    // OBSERVAÇÃO: Você pode usar o comando "Renomear" no menu "Refatorar" para alterar o nome da interface "IService1" no arquivo de código e configuração ao mesmo tempo.
    [ServiceContract]
    public interface IServicePagamentos
    {
        [OperationContract]
        List<CartaoContract> ListarCartoes();

        [OperationContract]
        int EfetuarPagamento(PagamentoContract pagamento);

        [OperationContract]
        List<PagamentoContract> ListarPagamentos();
    }   
}
