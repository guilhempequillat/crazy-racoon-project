package fr.epf.crazy_racoon.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


public class Mail {
	

		private static String username = "crazy.racoon.jee@gmail.com";
		private static String password="JEE@pass1";
		private static String url="http://localhost:8080/crazy-racoon/register";
		
		@Id
		@GeneratedValue(strategy = GenerationType.AUTO)
		private Long id;
		private String subject;
		private String content;
				
		public Mail() {}
		
		public Mail(String subject, String content) {
		
			this.subject = subject;
			this.content = content;
		}	
	
	public static void sendmail(InternetAddress[] toUsers,String subject, String content) throws AddressException, MessagingException {
		
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
	
	
	MimeMessage message = new MimeMessage(session);
	
	message.setFrom(new InternetAddress(username));
	message.setRecipients(Message.RecipientType.TO,
		toUsers);
	message.setSubject(subject);
	message.setContent(content, "text/html; charset=utf-8");

	Transport.send(message);
	//Transport.close();
	}
	
	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public static InternetAddress[] listusersemail(List<User> listu) throws AddressException{
		if(listu!=null) {
			if(listu.size() > 1) {
				InternetAddress[] listemail = new InternetAddress[listu.size()];
				for(int i=0;i<listu.size();i++) {
					listemail[i] =  new InternetAddress(listu.get(i).getEmail());
				}
				return listemail;
		}
	}
	return null;
	}
	
	
}
