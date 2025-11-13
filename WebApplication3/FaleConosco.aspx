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
        <iframe src="https://www.google.com/maps/embed?pb=!3m2!1spt-BR!2sbr!4v1759410694881!5m2!1spt-BR!2sbr!6m8!1m7!1sCAoSFkNJSE0wb2dLRUlDQWdJQzRsX25TRnc.!2m2!1d-27.12553929009142!2d-109.2772584039277!3f125.40846572857163!4f17.841733492401744!5f0.7820865974627469" width="100%" height="100%" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
      </div>
    </div>
  </div>
</asp:Content>
