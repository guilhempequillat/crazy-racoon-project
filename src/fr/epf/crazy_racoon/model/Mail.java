package fr.epf.crazy_racoon.model;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class Mail {
	

		private String username = "crazy.racoon.jee@gmail.com";
		private String password="JEE@pass1";
		private String url="http://localhost:8080/crazy-racoon/register";
				
		public Mail() {
		}
	
	public void sendmail() throws AddressException, MessagingException {

		
		
Properties props = new Properties();
	props.put("mail.smtp.auth","true");
	props.put("mail.smtp.starttls.enable", "true");
	props.put("mail.smtp.host", "smtp.gmail.com");
	props.put("mail.smtp.port", "587");

	Session session = Session.getInstance(props,
	  new javax.mail.Authenticator() {
		protected PasswordAuthentication getPasswordAuthentication() {
			return new PasswordAuthentication(username, password);
		}
	  });
	
	
	Message message = new MimeMessage(session);
	message.setFrom(new InternetAddress(username));
	message.setRecipients(Message.RecipientType.TO,
		InternetAddress.parse("gwladys.lemoine@epfedu.fr"));
	message.setSubject("Testing Subject");
	message.setText("Dear Mail Crawler,"
		+ "\n\n No spam to my email, please!"
			+ "\n\n Rendez-vous à cette addresse : " + url + " !");

	Transport.send(message);
	//Transport.close();
	}
	
}
