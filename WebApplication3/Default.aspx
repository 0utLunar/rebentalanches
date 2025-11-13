<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication3.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <!-- este conteúdo será enviado para o HEAD do site.maste -->
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Conteudo" runat="server">
  <!-- este conteúdo será exibido no BODY da pagina mestra -->
  <div class="flexslider">
    <ul class="slides">
      <li>
        <img src="images/banner0.png" />
      </li>
      <li>
        <img src="images/banner1.png" />
      </li>
      <li>
        <img src="images/banner2.png" />
      </li>
      <li>
        <img src="images/banner3.png" />
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
  <div class="margin-top-60">
    <div class="row">
      <div class="col-3">
        <div class="border">
          <img width="100%" src="images/si1.png" />
          <br />
          <div class="padding-14">
            <h2>Desenvolvimento de Sistemas</h2>
            <br />
            nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur
          </div>
        </div>
      </div>
      <div class="col-3">
        <div class="border">
          <img width="100%" src="images/si2.jpg" />
          <br />
          <div class="padding-14">
            <h2>Desenvolvimento de Sistemas</h2>
            <br />
            nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur
          </div>
        </div>
      </div>
      <div class="col-3">
        <div class="border">
          <img width="100%" src="images/si3.jpg" />
          <br />
          <div class="padding-14">
            <h2>Desenvolvimento de Sistemas</h2>
            <br />
            nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur
          </div>
        </div>
      </div>
      <div class="col-3">
        <div class="border">
          <img width="100%" src="images/si4.jpg" />
          <br />
          <div class="padding-14">
            <h2>Desenvolvimento de Sistemas</h2>
            <br />
            nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur
          </div>
        </div>
      </div>
    </div>

    <div class="row margin-top-120">
      <div class="col-6">
        <div class="border padding-14 box-shadow">
          <img width="100%" src="Images/CS.png" />
          <h2>A linguagem C#</h2>
          <br />
          <p>O desenvolvimento de sistemas com C# abrange a criação de diversas aplicações — como desktop, web, mobile e embarcadas — utilizando a linguagem de programação C# e o ecossistema .NET, conhecido por ser multiplataforma e de código aberto. Essa tecnologia, uma iniciativa da Microsoft, foca em orientação a objetos, o que resulta em código mais estruturado, organizado e fácil de manter. Profissionais de desenvolvimento com C# podem atuar no mercado de software criando sistemas robustos, eficientes e escaláveis, com foco em segurança e integração com bancos de dados.</p>
        </div>
      </div>
      <div class="col-6">
        <div class="border padding-14 box-shadow">
          <h2>Assuntos relacionados</h2>
          <hr />
          
          <a target="_blank" href="https://www-w3schools-com.translate.goog/cs/cs_intro.php?_x_tr_sl=en&_x_tr_tl=pt&_x_tr_hl=pt&_x_tr_pto=tc">Introdução ao C#</a>

        </div>
      </div>
     

    </div>
  </div>
</asp:Content>
