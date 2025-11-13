using Datapost.DB;
using System;
using System.Collections.Generic;
using System.Data;
using System.EnterpriseServices;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class ExibirProdutos : System.Web.UI.Page
    {
        string conexao = "";
        string sql = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            conexao = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath("~/App_Data/Database.accdb") + ";Persist Security Info=False;";

            Exibir("SELECT Codigo,Nome,Quantidade,PrecoCompra,PrecoVenda,Situacao FROM Produtos ORDER BY Nome ASC;");
        }

        protected void Exibir(string sql)
        {
            

            // 4. Conectar no banco de dados

            Datapost.DB.DAO db = new Datapost.DB.DAO();
            db.ConnectionString = conexao;
            db.DataProviderName = DAO.ProviderName.OleDb;

            Produtos.DataSource = db.Query(sql); //Diz onde está os produtios
            Produtos.DataBind();  // Processa os produtos, mostra
            overlay.Style.Add(HtmlTextWriterStyle.Display, "none");
        }

        protected void Cadastrar_produto_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/CadastroProdutos.aspx");
        }

        protected void Buscar_Click(object sender, EventArgs e)
        {
            conexao = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath("~/App_Data/Database.accdb") + ";Persist Security Info=False;";

            Exibir("SELECT Codigo,Nome,Quantidade,PrecoCompra,PrecoVenda,Situacao FROM Produtos WHERE Nome LIKE '%" + BuscarProduto.Text + "%';");
        }

        protected void Cancelar_Click(object sender, EventArgs e)
        {
            BuscarProduto.Text = "";

        }

        protected void Editar_Click(object sender, EventArgs e)
        {
            overlay.Style.Add(HtmlTextWriterStyle.Display, "block");
            

            LinkButton btn = (LinkButton)sender;
            string codigo = btn.CommandArgument.ToString();

            conexao = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath("~/App_Data/Database.accdb") + ";Persist Security Info=False;";

            sql = "SELECT * FROM Produtos WHERE Codigo LIKE " + codigo + ";";

            lblCodigo.Text = codigo;
            Datapost.DB.DAO db = new Datapost.DB.DAO();
            db.ConnectionString = conexao;
            db.DataProviderName = DAO.ProviderName.OleDb;

            DataTable dat = (DataTable)db.Query(sql);

            Nome.Text = dat.Rows[0]["Nome"].ToString();
            Quantidade.Text = dat.Rows[0]["Quantidade"].ToString();
            PrecoCompra.Text = dat.Rows[0]["PrecoCompra"].ToString();
            PrecoVenda.Text = dat.Rows[0]["PrecoVenda"].ToString();
            Descricao.Text = dat.Rows[0]["Descricao"].ToString();

            if (dat.Rows[0]["Imagem"].ToString().Equals(""))
            {
                divImagem.Style.Add(HtmlTextWriterStyle.Display, "none");
            }
            else
            {
                divImagem.Style.Add(HtmlTextWriterStyle.Display, "block");
                Imagem.ImageUrl = ResolveUrl("~/App_Files/" + dat.Rows[0]["Imagem"].ToString());
            }

            if (dat.Rows[0]["Situacao"].ToString().Equals("1"))
            {
                Ativar.Visible = false;
            }
            else
            {
                Ativar.Visible = true;
            }

            

        }


        protected void Excluir_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string codigo = btn.CommandArgument.ToString();

            mudarSituacao(codigo, 0);

            Exibir("SELECT Codigo,Nome,Quantidade,PrecoCompra,PrecoVenda,Situacao FROM Produtos ORDER BY Nome ASC;");
        }

        protected void Ativar_Click(object sender, EventArgs e)
        {
            string codigo = lblCodigo.Text;

            mudarSituacao(codigo, 1);

            Exibir("SELECT Codigo,Nome,Quantidade,PrecoCompra,PrecoVenda,Situacao FROM Produtos ORDER BY Nome ASC;");
            

        }

        void mudarSituacao(string codigo, int n)
        {
            conexao = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath("~/App_Data/Database.accdb") + ";Persist Security Info=False;";

            sql = "UPDATE Produtos SET Situacao = "+n+" WHERE Codigo LIKE " + codigo + ";";

            Datapost.DB.DAO db = new Datapost.DB.DAO();
            db.ConnectionString = conexao;
            db.DataProviderName = DAO.ProviderName.OleDb;
            db.Query(sql);
        }

        protected void Update_Click(object sender, EventArgs e)
        {
            string codigo = lblCodigo.Text;
            string nome = Nome.Text;
            string quantidade = Quantidade.Text;
            string precoCompra = PrecoCompra.Text;
            string precoVenda = PrecoVenda.Text;
            string descricao = Descricao.Text;
            string imagem = Path.GetFileName(Imagem.ImageUrl);
            if (FileUpload.FileName != "")
            {

                imagem = Path.GetFileName(FileUpload.FileName);

                string imagemCaminho = Server.MapPath("~/App_Files/") + Path.GetFileName(FileUpload.FileName);
                FileUpload.SaveAs(imagemCaminho);
            }

            conexao = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath("~/App_Data/Database.accdb") + ";Persist Security Info=False;";

            sql = "UPDATE Produtos SET Nome = '" + nome + "', Quantidade = " + quantidade + ", PrecoCompra = '" + precoCompra + "', PrecoVenda = '" + precoVenda + "', Descricao = '" + descricao + "', Imagem = '"+ imagem + "' WHERE Codigo LIKE " + codigo + ";";

            Datapost.DB.DAO db = new Datapost.DB.DAO();
            db.ConnectionString = conexao;
            db.DataProviderName = DAO.ProviderName.OleDb;
            db.Query(sql);
            Exibir("SELECT Codigo,Nome,Quantidade,PrecoCompra,PrecoVenda,Situacao FROM Produtos ORDER BY Nome ASC;");
         
        }


        protected void Voltar_Click(object sender, EventArgs e)
        {
            Exibir("SELECT Codigo,Nome,Quantidade,PrecoCompra,PrecoVenda,Situacao FROM Produtos ORDER BY Nome ASC;");
        }
    }
}