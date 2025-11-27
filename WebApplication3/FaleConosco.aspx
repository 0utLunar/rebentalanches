<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FaleConosco.aspx.cs" Inherits="WebApplication3.FaleConosco" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="Conteudo" runat="server">
  <div class="row margin-top-60">
    <div class="col-6">
      <div class="border box-shadow padding-14">
        <h2>Fale Conosco</h2>
        <br />
        <asp:Label ID="Alerta" runat="server" Font-Size="16px" ForeColor="#FF0000"></asp:Label>
        <br />
        <label>Seu Nome</label>
        <asp:TextBox ID="SeuNome" MaxLength="100" runat="server"></asp:TextBox>
        <label>E-mail</label>
        <asp:TextBox ID="Email" MaxLength="255" TextMode="Email" runat="server"></asp:TextBox>
        <label>Mensagem</label>
        <asp:TextBox ID="Mensagem" MaxLength="255" TextMode="MultiLine" Rows="6" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="Enviar" OnClick="Enviar_Click" runat="server" Text="Enviar" />
        <br />
        <br />
      </div>
    </div>
    <div class="col-6">
      <div class="border box-shadow">
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3679.692128009133!2d-47.35273622378284!3d-22.739681831922066!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x94c89bea5cdb94f9%3A0xffb368bd91ea12ae!2sFatec%20Americana%20-%20Faculdade%20de%20Tecnologia%20de%20Americana%20Ministro%20Ralph%20Biasi!5e0!3m2!1spt-BR!2sbr!4v1764255750358!5m2!1spt-BR!2sbr" width="100%" height="100%" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
      </div>
    </div>
  </div>
</asp:Content>
