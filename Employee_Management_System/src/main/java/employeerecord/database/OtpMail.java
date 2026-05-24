package employeerecord.database;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class OtpMail {
	public static String sendMail(String recepient) throws MessagingException {
		Properties properties = new Properties();
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.host","smtp.gmail.com");
		properties.put("mail.smtp.port", "587");
		
		String myAccountDetails="username";
		String password="password";
		int min=1000;
		int max=9999;
		int otp = (int)(Math.random()*(max-min+1)+min); 
		String otpval=String.valueOf(otp);
		Session session = Session.getInstance(properties,new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				
				return new PasswordAuthentication(myAccountDetails,password);
				
			}
		});
		Message message=prepareMessage(session, myAccountDetails, recepient,otpval);
		Transport.send(message);
		System.out.println("message sent successfully");
		return otpval;
		}

	private static Message prepareMessage(Session session, String myAccountDetails, String recepient,String otpval) {
		try {
			Message message=new MimeMessage(session);
			message.setFrom(new InternetAddress(myAccountDetails,"EMPLOYEE MANAGEMENT SYSTEM"));
			message.setRecipient(Message.RecipientType.TO,new InternetAddress(recepient));
			message.setSubject("OTP Verification");
			String s="<head>"+"<style type=\"text/css\">"+".blue { color:#00FFFF; }"+"p{color:#FFFFFF;padding-top:10px;font-family:\"Courier\";}"+"h2{color:#FFFFFF;padding-top:15px;font-family:\"Courier\";}"+".card{background-color:#000000;border-radius: 5px;width: 100%;height:400px;text-align:center;margin: 0 auto;}"+".cardpara{background-color:#000000;border-radius:5px;width:40%;height:30px;text-align:center;border-style: solid;border-color:#FFFFFF;margin:10px auto 10px;}"+"h1{font-family: \"Courier\";padding-top:80px;}"+"</style>" +"</head>" +"<div class=\"card\">"+"<h1 class=\"blue\">Welcome to the Employee Management System</h1>" +"<h2>YOUR OTP</h2>"+"<p class=\"cardpara\"><b>"+otpval+"</b></p><br>The OTP is Valid for 1 minute"+"</div>";
			message.setContent(s, "text/html; charset=utf-8");
			return message;
			
		}catch(Exception ex ) {
			System.out.println("Error");
		}
		// TODO Auto-generated method stub
		return null;
	}
}
