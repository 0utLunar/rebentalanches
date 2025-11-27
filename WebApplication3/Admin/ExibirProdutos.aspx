<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ExibirProdutos.aspx.cs" Inherits="WebApplication3.ExibirProdutos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Conteudo" runat="server">


    <!-- OVERLAY DE EDIÇÃO -->
    <div class="overlayDiv" id="overlay" runat="server">
        <div class="row margin-top-60">
            <div class="col-3 border box-shadow overlayInfo">
                <div class=" padding-14">
                    <h2>Atualizar de Produto</h2>
                    <br />
                    <asp:Label ID="Alerta" runat="server" Font-Size="16px" ForeColor="#FF0000"></asp:Label>
                    <br />
                    <br />
                    <label>Código</label>
                    <asp:Label ID="lblCodigo" runat="server" Text=""></asp:Label>
                    <label>Nome Do Produto</label>
                    <asp:TextBox ID="Nome" MaxLength="255" runat="server"></asp:TextBox>
                    <label>Quantidade</label>
                    <asp:TextBox ID="Quantidade" Text="0" TextMode="Number" runat="server"></asp:TextBox>
                    <label>Preço Compra</label>
                    <asp:TextBox ID="PrecoCompra" Text="0" MaxLength="15" CssClass="moeda" runat="server"></asp:TextBox>
                    <label>Preço Venda</label>
                    <asp:TextBox ID="PrecoVenda" Text="0" MaxLength="15" CssClass="moeda" runat="server"></asp:TextBox>
                    <label>Descrição</label>
                    <asp:TextBox ID="Descricao" MaxLength="255" TextMode="MultiLine" Rows="5" runat="server"></asp:TextBox>
                    <asp:FileUpload ID="FileUpload" runat="server" />
                    <br />
                    <br />

                    <asp:Button ID="Update" OnClick="Update_Click" runat="server" Text="Atualizar" />
                    <asp:Button ID="Ativar" runat="server" OnClick="Ativar_Click" Text="Ativar" />
                    <asp:Button ID="Voltar" runat="server" OnClick="Voltar_Click" Text="Voltar" />
                    <br />
                   
                </div>
            </div>
            <div class="col-3 border box-shadow  overlayInfo" id="divImagem" runat="server">
                <div>
                    <asp:Image ID="Imagem" Width="100%" runat="server" />
                </div>
            </div>
        </div>
    </div>





    <!-- TABELA PRINCIPAL DE PRODUTOS -->
    <div class="row margin-top-60">
        <div class="col-10">
            <div class="border box-shadow padding-14">

                <asp:TextBox ID="BuscarProduto" Width="74.76%" runat="server"></asp:TextBox>
                <asp:Button ID="Buscar" OnClick="Buscar_Click" runat="server" Text="Buscar" />
                <asp:Button ID="Cancelar" OnClick="Cancelar_Click" runat="server" Text="Cancelar" />

                <br />
                <br />
                <asp:GridView ID="Produtos" Width="100%" CellPadding="8" BorderColor="#c0c0c0" runat="server" AutoGenerateColumns="False" EmptyDataText="Produto não encontrado!" EmptyDataRowStyle-ForeColor="Red" EmptyDataRowStyle-HorizontalAlign="Center" EmptyDataRowStyle-BorderColor="White">
                        <Columns>
                            <asp:BoundField DataField="Codigo" HeaderText="Código" />
                            <asp:BoundField DataField="Nome" HeaderText="Nome" />
                            <asp:BoundField DataField="Quantidade" HeaderText="Qtd." />
                            <asp:BoundField DataField="PrecoCompra" HeaderText="Preço de Compra"
                                            DataFormatString="{0:C2}" HtmlEncode="False" />
                            <asp:BoundField DataField="PrecoVenda" HeaderText="Preço de Venda"
                                            DataFormatString="{0:C2}" HtmlEncode="False" />
                            <asp:BoundField DataField="Situacao" HeaderText="Situação" />
                            <asp:TemplateField>
                            <HeaderTemplate>
                               <asp:Label ID="lblAcoes" Text="Ações" runat="server"/>
                             </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="Editar" CommandArgument='<%# Eval("Codigo") %>' CssClass="margin-right-20" OnClick="Editar_Click" runat="server">
                                        <i class="fa-solid fa-pen fa-lg"></i>
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="Excluir" CommandArgument='<%# Eval("Codigo") %>' OnClick="Excluir_Click" runat="server">
                                        <i class="fa-solid fa-trash fa-lg"></i>   
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                </asp:GridView>

                <asp:Button ID="Cadastrar_produto" runat="server" OnClick="Cadastrar_produto_Click" Text="Cadastrar novo produto" />
                

            </div>
        </div>
    </div>
    
</asp:Content>
