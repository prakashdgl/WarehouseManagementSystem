using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;
using System.Text;

/// <summary>
/// Summary description for Email
/// </summary>
public class Email
{
	

    public void sendEmail(string RegEmail,string body){

        MailMessage mailMessage = new MailMessage(new MailAddress("indiafreeclassified@gmail.com")
                                      , new MailAddress(RegEmail));

        mailMessage.Subject = "Dens N Dente Forgot Password";
        mailMessage.IsBodyHtml = true;
        mailMessage.Body = body;

        System.Net.NetworkCredential networkCredentials = new
        System.Net.NetworkCredential("indiafreeclassified@gmail.com", "japan1234");

        SmtpClient smtpClient = new SmtpClient();
        smtpClient.EnableSsl = true;
        smtpClient.UseDefaultCredentials = false;
        smtpClient.Credentials = networkCredentials;
        smtpClient.Host = "smtp.gmail.com";
        smtpClient.Port = 587;
        smtpClient.Send(mailMessage);
    
    }

    private string RandomString(int size, bool lowerCase)
    {

        StringBuilder builder = new StringBuilder();
        Random random = new Random();
        char ch;

        for (int i = 0; i < size; i++)
        {

            ch = Convert.ToChar(Convert.ToInt32(Math.Floor(26 * random.NextDouble() + 65)));
            builder.Append(ch);

        }

        if (lowerCase)
            return builder.ToString().ToLower();
        return builder.ToString();
    }


    public string GetPassword()
    {
        Random rnd = new Random();

        StringBuilder builder = new StringBuilder();
        builder.Append(RandomString(4, true));
        builder.Append(rnd.Next());
        builder.Append(RandomString(6, false));
        return builder.ToString();
    }
}
