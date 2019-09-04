using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DesenvolvimentoWeb.Vendas.Data;
using DesenvolvimentoWeb.Vendas.Models;

namespace DesenvolvimentoWeb.Vendas.Views
{
    public partial class CadastroProdutos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                categoriaDropDownList.DataSource = ProdutosDao.ListarCategorias();
                categoriaDropDownList.DataTextField = "Descricao";
                categoriaDropDownList.DataValueField = "Id";
                categoriaDropDownList.DataBind();

                List<string> unidades = new List<string>()
                {
                    "UNIDADE", "KILOS", "GRAMAS", "LITROS", "POLEGADAS"
                };
                unidadeDropDownList.DataSource = unidades;
                unidadeDropDownList.DataBind();

                produtosRepeater.DataSource = ProdutosDao.ListarProdutos();
                produtosRepeater.DataBind();
            }
        }

        protected void enviarButton_Click(object sender, EventArgs e)
        {
            try
            {
                HttpPostedFile file = figuraFileUpload.PostedFile;

                if (file == null || string.IsNullOrEmpty(file.FileName) || file.InputStream == null)
                {
                    throw new Exception("Arquivo inválido para produto");
                }

                Produto produto = new Produto();
                produto.IdCategoria = Convert.ToInt32(categoriaDropDownList.SelectedValue);
                produto.Descricao = descricaoTextBox.Text;
                produto.Unidade = unidadeDropDownList.SelectedValue;
                produto.Preco = Convert.ToDouble(precoTextBox.Text);               

                produto.MimeType = file.ContentType;
                byte[] bytes = new byte[file.InputStream.Length];
                file.InputStream.Read(bytes, 0, bytes.Length);
                produto.Foto = bytes;

                ProdutosDao.IncluirProduto(produto);

                mensagemLabel.CssClass = "alert alert-success";
                mensagemLabel.Text = "Produto incluido com sucesso";
            }
            catch (Exception ex)
            {
                mensagemLabel.CssClass = "alert alert-danger";
                mensagemLabel.Text = ex.Message;
                //throw;
            }
        }

        protected void produtosRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            HiddenField idField = (HiddenField)e.Item.FindControl("idHiddenField");

            if (idField!=null)
            {
                int id = Convert.ToInt32(idField.Value);
                Image image = (Image)e.Item.FindControl("produtoImage");
                image.ImageUrl = "data:" + ProdutosDao.BuscarProduto(id).MimeType + ";base64," + ProdutosDao.ExibirImagem(id);
            }
        }
    }
}