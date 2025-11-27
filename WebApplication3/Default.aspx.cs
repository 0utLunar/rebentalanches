using Datapost.DB;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ExibirProdutos();
        }

        protected void ExibirProdutos()
        {
            // 2. Criar a string de conexão com o banco de dados
            // https://www.connectionstrings.com
            string conexao = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath("~/App_Data/DataBase.accdb") + ";Persist Security Info=False;";

            string sql = "SELECT * FROM Produtos WHERE Situacao=1 ORDER BY Nome ASC";

            DAO db = new DAO();
            db.DataProviderName = DAO.ProviderName.OleDb; // DataBase Access
            db.ConnectionString = conexao;
            DataList.DataSource = db.Query(sql);
            DataList.DataBind();
        }

        protected void DataList_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType != ListItemType.Item && e.Item.ItemType != ListItemType.AlternatingItem)
            {
                return;
            }
            // Obtem os itens
            DataRowView rowView = (DataRowView)e.Item.DataItem;

            HyperLink LinkImagem = (HyperLink)e.Item.FindControl("LinkImagem");
            Image Imagem = (Image)e.Item.FindControl("Imagem");

            LinkImagem.NavigateUrl = ResolveUrl("~/App_Files/") + rowView["Imagem"].ToString();

            Imagem.ImageUrl = ResolveUrl("~/App_Files/") + rowView["Imagem"].ToString();

            Label Nome = (Label)e.Item.FindControl("Nome");
            Nome.Text = rowView["Nome"].ToString();

            Label Descricao = (Label)e.Item.FindControl("Descricao");
            Descricao.Text = rowView["Descricao"].ToString();

            Label PrecoVenda = (Label)e.Item.FindControl("PrecoVenda");
            PrecoVenda.Text = rowView["PrecoVenda"].ToString();
        }
    }
}