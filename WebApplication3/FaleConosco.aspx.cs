using System;
using System.Collections.Generic;
using System.Linq;

using System.Net.Mail;
using System.Net;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace WebApplication3
{
   public partial class FaleConosco : System.Web.UI.Page
   {
      protected void Page_Load(object sender, EventArgs e)
      {

      }

      protected void Enviar_Click(object sender, EventArgs e)
      {
         // 1. validação dos dados
         if (SeuNome.Text.Trim() == "")
         {
            Alerta.Text = "Digite seu nome";
         }
         else if (Email.Text.Trim() == "")
         {
            Alerta.Text = "Digite seu e-mail";
         }
         else if (Mensagem.Text.Trim() == "")
         {
            Alerta.Text = "Digite a mensagem";
         }
         else
         {
            try
            {
               // 2. Cria o e-mail

               MailMessage email = new MailMessage();

               email.To.Add("contato@seudominio.com.br");
               MailAddress efrom = new MailAddress("contato@seudominio.com.br");
               email.From = efrom;
               email.Subject = "e-mail recebido pela pagina fale conosco";
               email.Body = "Nome: " + SeuNome.Text + "\n";
               email.Body += "E-mail: " + Email.Text + "\n";
               email.Body += "Mensagem: " + Mensagem.Text + "\n";

               // 3. Envia o email

               SmtpClient smtp = new SmtpClient();
               smtp.Host = "seudominio.com.br";

               smtp.Credentials = new System.Net.NetworkCredential("contato@seudominio.com.br", "suasenha");

               // envia o email
               smtp.Send(email);

            }
            catch (Exception ex)
            {
               Alerta.Text = "Houve uma falha no envio do email, tente mais tarde";

               // Grave "append" no arquivo "excecoes.txt" o stacktrace  da exceção.

              
            }
         }
      }
   }
}