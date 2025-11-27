<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication3.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- este conteúdo será enviado para o HEAD do site.maste -->
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Conteudo" runat="server">
    <!-- este conteúdo será exibido no BODY da pagina mestra -->
    <div class="flexslider">
        <ul class="slides">
            <li>
                <img src="images/rebentaexterior.png" />
            </li>
            <li>
                <img src="images/rebentainterior.jpeg" />
            </li>
            <li>
                <img src="images/rebentafeliz.png" />
            </li>
        </ul>
    </div>
    <script>
        $(window).load(function () {
            $('.flexslider').flexslider({
                animation: "slide",
                ontimeupdate: 10
            });
        });
    </script>
    <hr id="cardapio" />
    <div class="margin-top-60">
        <h1 class="titulos">CARDÁPIO</h1>
        <div class="margin-top-60">
            <div class="row">
                <asp:DataList RepeatDirection="Horizontal" RepeatColumns="4" OnItemDataBound="DataList_ItemDataBound" ID="DataList" runat="server">
                    <ItemTemplate>
                        <div class="border" style="margin: 10px; padding: 14px;">
                            <asp:HyperLink ID="LinkImagem" Target="_blank" runat="server">
                                <asp:Image Width="200px" Height="200px" CssClass="imagemGaleria" ID="Imagem" runat="server" />
                            </asp:HyperLink>
                            <br />
                            <h2>
                                <asp:Label ID="Nome" runat="server" Text=""></asp:Label></h2>
                            <br />
                            <p>
                                <asp:Label ID="Descricao" runat="server" Text=""></asp:Label>
                            </p>
                            <br />
                            <h2>R$
                               <asp:Label ID="PrecoVenda" runat="server"></asp:Label>
                            </h2>

                            <br />
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </div>
    </div>
    <hr id="sobre" />
    <div class="margin-top-60">

        <h1 class="titulos">SOBRE NÓS</h1>
        <br />
        <div class="row margin-top-60">
            <div class="col-6 border box-shadow">
                <br />
                <div class="padding-14">
                    <p>
                        No Rebenta Lanches, a gente acredita que um lanche bom de verdade não é só comida — é experiência.
Nasceu da vontade de entregar aquele sabor que “rebenta” na boca: suculento, generoso e feito com capricho.
                    </p>
                    <p>
                        Somos uma lanchonete moderna, simples e acolhedora, feita pra quem gosta de comer bem sem frescura.
Aqui tudo é feito na hora, com ingredientes selecionados e combinações que realmente matam a fome e a vontade.
                    </p>
                    <p>
                        Somos uma lanchonete moderna, simples e acolhedora, feita pra quem gosta de comer bem sem frescura.
Aqui tudo é feito na hora, com ingredientes selecionados e combinações que realmente matam a fome e a vontade.
                    </p>
                    <p>
                        Nossa missão é clara:
servir lanches que surpreendem no sabor, no tamanho e na qualidade — sempre com atendimento de gente que gosta do que faz.
                    </p>
                    <p>
                        Seja pra matar a larica da madrugada, aquele rango rápido no dia corrido ou um date comendo aquele smash perfeito…
O Rebenta Lanches é o lugar certo.
                    </p>
                </div>
            </div>
            <div class="col-6 border box-shadow">
                <br />
                <div class="padding-14">
                    <img src="Images/rebentalogo.png" width="100%" height="100%" />
                </div>

            </div>
            <h2>Rebenta Lanches — onde o sabor estoura na primeira mordida.</h2>
        </div>
    </div>
    <hr />
</asp:Content>
