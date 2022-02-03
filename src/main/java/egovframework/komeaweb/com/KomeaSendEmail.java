package egovframework.komeaweb.com;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class KomeaSendEmail {
	 public static void sendMessage(String mail) {

		  String host = "smtp.cafe24.com";
		  final String user = "komea@komeaweb.cafe24.com";
		  final String password = "qkfms1203";

		  String to     = "qeg355@bareuntech.co.kr";
		  //String to = mail;
		  int port = 587;
		  
		  // Get the session object
		  Properties props = new Properties();
		  // SMTP 서버 정보 설정 
		  props.put("mail.smtp.host", host); 
		  props.put("mail.smtp.port", port); 
		  props.put("mail.smtp.auth", "true"); 
		  //props.put("mail.smtp.ssl.enable", "true"); 
		  //props.put("mail.smtp.ssl.trust", host);

		  Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
		   protected PasswordAuthentication getPasswordAuthentication() {
		    return new PasswordAuthentication(user, password);
		   }
		  });

		  // Compose the message
		  try {
		   MimeMessage message = new MimeMessage(session);
		   message.setFrom(new InternetAddress(user));
		   message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

		   // Subject
		   message.setSubject("[Subject] Java Mail Test");
		   
		   // Text
		   message.setText("Simple mail test..");

		   // send the message
		   Transport.send(message);
		   System.out.println("message sent successfully...");

		  } catch (MessagingException e) {
		   e.printStackTrace();
		  }
	}
}
