package com.korail.client.user.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.korail.client.user.vo.EmailVO;

@Service
public class EmailServiceImpl implements EmailService {

	@Autowired
	private JavaMailSender mailSender;
	
	@Override
	public EmailVO sendMail(EmailVO emailVO){
		MimeMessage msg = mailSender.createMimeMessage();
		
		try {
			int ran = new Random().nextInt(1000000)+10000;
			
			String key = String.valueOf(ran);
			
			String title = "회원 가입 인증 코드 발급 안내 입니다.";
			
			String content = "귀하의 인증 코드는  " + key + " 입니다.";
			
			
			msg.setSubject(title);
            msg.setText(content.toString());
            msg.setRecipients(MimeMessage.RecipientType.TO , InternetAddress.parse(emailVO.getUsermail()));
            msg.setFrom(emailVO.getFrom());
            
			mailSender.send(msg);
			emailVO.setAuthNum(key);
		} catch (MessagingException e) {
			System.out.println("MessagingException");
			e.printStackTrace();
		} catch (MailException e) {
			System.out.println("MailException발생");
			e.printStackTrace();
		}
		return emailVO;
	}
	/* 슬기형 */
}
