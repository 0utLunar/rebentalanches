<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CadastroProdutos.aspx.cs" Inherits="WebApplication3.CadastroProdutos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/cleave.js/1.6.0/cleave.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function () {

            const inputs = document.querySelectorAll('.moeda');

            function formatarMoeda(input) {
                let valor = input.value.replace(/\D/g, '');
                if (!valor) valor = '0';

                let numero = (parseInt(valor) / 100).toFixed(2);

                numero = numero.replace('.', ',');
                numero = numero.replace(/\B(?=(\d{3})+(?!\d))/g, '.');

                input.value = 'R$ ' + numero;
            }

            inputs.forEach(function (input) {
                formatarMoeda(input);

                input.addEventListener('input', function () {
                    formatarMoeda(input);
                });
            });
        });
    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Conteudo" runat="server">
    <div class="row margin-top-60">
        <div class="col-8">
            <div class="border box-shadow padding-14">
                <h2>Cadastro de Produtos</h2>
                <br />
                <asp:Label ID="Alerta" runat="server" Font-Size="16px" ForeColor="#FF0000"></asp:Label>
                <br />
                <br />
                <label>Nome Do Produto</label>
                <asp:TextBox ID="Nome" MaxLength="255" runat="server"></asp:TextBox>
                <label>Quantidade</label>
                <asp:TextBox ID="Quantidade" Text="0" TextMode="Number" runat="server"></asp:TextBox>
                <label>Preço Compra</label>
                <asp:TextBox ID="PrecoCompra" Text="0" MaxLength="15" CssClass="moeda" runat="server"></asp:TextBox>
                <label>Preço Venda</label>
                <asp:TextBox ID="PrecoVenda" Text="0" MaxLength="15" CssClass="moeda" runat="server"></asp:TextBox>
                <label>Descrição</label>
                <asp:TextBox ID="Descricao" MaxLength="255" TextMode="MultiLine" Rows="6" runat="server"></asp:TextBox>
                <label>Imagem</label>
                <asp:FileUpload ID="FileUpload" runat="server" />
                <label>Situação</label>
                <asp:DropDownList ID="Situacao" runat="server">
                    <asp:ListItem Text="Ativo" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Inativo" Value="0"></asp:ListItem>
                </asp:DropDownList>
                <br />
                <asp:Button ID="Salvar" OnClick="Salvar_Click" runat="server" Text="Salvar" />
                <br />
                <br />

            </div>
        </div>
    </div>
    
</asp:Content>
