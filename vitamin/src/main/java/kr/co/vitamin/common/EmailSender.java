package kr.co.vitamin.common;

import java.util.Date;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailSender {
	@Autowired
	private JavaMailSender mailSender = null;
	
	private static final String SENDER_MAIL[] = {
		"init@n4oah.kr",
		"비트캠프 관리자"
	};
	
	MimeMessage message = null;
	
	public EmailSender() {}
	
	public void sendMail(String receiveMail, String receiveTitle, String receiveContent) throws Exception {
		
		if(receiveMail == null && receiveTitle == null && receiveContent == null) {
			throw new Exception("email receive info not input");
		}
		
		System.out.println(receiveMail);
		
		message = mailSender.createMimeMessage();
		
		message.addHeader("Content-type", "text/HTML; charset=UTF-8");
		message.addHeader("format", "flowed");
		message.addHeader("Content-Transfer-Encoding", "8bit");
		
		message.setFrom(new InternetAddress(SENDER_MAIL[0], SENDER_MAIL[1]));
		
		message.setSubject(receiveTitle, "UTF-8");
		message.setContent(receiveContent, "text/html; charset=UTF-8");
		message.setSentDate(new Date());
		
		message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(receiveMail, false));
		
		mailSender.send(message);
	}
}
