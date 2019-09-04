using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProjetoWebCadastroEventos.Paginas;
using ProjetoWebCadastroEventos.DAL;
using ProjetoWebCadastroEventos.Dados;

namespace ProjetoWebCadastroEventos.Paginas
{
    public partial class CadastroConvidados : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //string s = Request.RequestType;

            if (!IsPostBack)
            {
                try
                {
                    eventoDropDownList.DataSource = EventosDao.ListarEvento();
                    eventoDropDownList.DataTextField = "Descricao";
                    eventoDropDownList.DataValueField = "Id";
                    eventoDropDownList.DataBind();
                }
                catch (Exception ex)
                {

                    throw;
                }
            }            
        }

        protected void incluirButton_Click(object sender, EventArgs e)
        {
            try
            {
                Convidado convidado = new Convidado();
                convidado.Cpf = cpfTextBox.Text;
                convidado.IdEvento = Convert.ToInt32(eventoDropDownList.SelectedValue);
                convidado.Nome = nomeTextBox.Text;
                convidado.Email = emailTextBox.Text;
                convidado.Telefone = telefoneTextBox.Text;

                ConvidadosDao.IncluirConvidado(convidado);

                mensagemLabel.ForeColor = System.Drawing.Color.Blue;
                mensagemLabel.Text = "Convidado incluido com sucesso";
            }
            catch (Exception ex)
            {
                mensagemLabel.ForeColor = System.Drawing.Color.Red;
                mensagemLabel.Text = ex.Message;
                //throw;
            }
        }
    }
}