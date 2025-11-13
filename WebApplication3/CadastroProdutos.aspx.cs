using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Datapost.DB;

namespace WebApplication3
{
    public partial class CadastroProdutos : System.Web.UI.Page
    {
      

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Salvar_Click(object sender, EventArgs e)
        {
            // 1. validar os dados
            if (Nome.Text.Trim() == "")
            {
                Alerta.Text = "Digite o nome do produto";
            }
            else
            {
                // 2. Gravar o produto na tabela produtos

                // 2.1 Criar a String de conexão com banco de dados
                // https://www.connectionstrings.com
                string conexao = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath("~/App_Data/Database.accdb") + ";Persist Security Info=False;";

                // 3. Obtem o nome da nossa imagem

                string imagem = "";
                if (FileUpload.FileName != "")
                {

                    imagem = Path.GetFileName(FileUpload.FileName);

                    string imagemCaminho = Server.MapPath("~/App_Files/") + Path.GetFileName(FileUpload.FileName);
                    FileUpload.SaveAs(imagemCaminho);
                }
                
                    // 4. Cria uma string com o Comando SQL para inserir dados no banco de dados
                    string sql = "INSERT INTO Produtos(Nome,Imagem,Quantidade,PrecoCompra,PrecoVenda,Descricao,DataHoraRegistro,Situacao) VALUES('" + Nome.Text.Trim() + "','" + imagem + "'," + Quantidade.Text + ",'" + PrecoCompra.Text + "','" + PrecoVenda.Text + "','" + Descricao.Text + "','" + DateTime.Now.ToString() + "'," + Situacao.SelectedValue + ");";
                

                // 5. Conectar no banco de dados

                Datapost.DB.DAO db = new Datapost.DB.DAO();
                db.ConnectionString = conexao;
                db.DataProviderName = DAO.ProviderName.OleDb;
                db.Query(sql);

                // 6. Limpa o formulario
                Nome.Text = "";
                Quantidade.Text = "";
                PrecoCompra.Text = "";
                PrecoVenda.Text = "";
                Descricao.Text = "";
                Situacao.Text = "";

                Alerta.Text = "Cadastro bem Sucedido!";
                Alerta.ForeColor = System.Drawing.Color.Green;


            }
        }
    }
}