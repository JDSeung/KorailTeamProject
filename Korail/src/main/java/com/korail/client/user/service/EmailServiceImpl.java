package com.korail.client.user.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.korail.client.signup.dao.SignupDAO;
import com.korail.client.user.dao.UserInfoDAO;
import com.korail.client.user.vo.EmailVO;
import com.korail.client.user.vo.UserVO;

@Service
public class EmailServiceImpl implements EmailService {

	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private SignupDAO signDAO;
	@Autowired
	private UserInfoDAO userInfoDAO;
	private String title;
	private String content;
	@Override
	/*메일 발송*/
	public void sendMail(EmailVO emailVO){
		MimeMessage msg = mailSender.createMimeMessage();
		
		try {
		
			
			msg.setSubject(title);
            msg.setText(content);
            msg.setRecipients(MimeMessage.RecipientType.TO , InternetAddress.parse(emailVO.getUserEmail()));
            msg.setFrom(emailVO.getFrom());
            
			mailSender.send(msg);
		} catch (MessagingException e) {
			System.out.println("MessagingException");
			e.printStackTrace();
		} catch (MailException e) {
			System.out.println("MailException발생");
			e.printStackTrace();
		}
		
	}
	
	@Override
	/*이메일 중복체크*/
	public String getChkEmail(EmailVO emailVO) {
		// TODO Auto-generated method stub
		signDAO.getChkEmail(emailVO);
		String result = signDAO.getChkEmail(emailVO);
		return result;
	}

	@Override
	/*인증번호생성*/
	public void makeKey(EmailVO emailVO) {
		int ran = new Random().nextInt(1000000)+10000;
		
		String key = String.valueOf(ran);
		
		title = "Korail 회원 가입 인증 코드 발급 안내 입니다.";
		
		content = "귀하의 인증 코드는  " + key + " 입니다.";
		System.out.println(content);
		emailVO.setAuthNum(key);
		sendMail(emailVO);
	}
	
	@Override
	/*ID 발송*/
	public void sendId(EmailVO emailVO){
		title = "Korail ID찾기 입니다.";
		UserVO userVO = userInfoDAO.searchId(emailVO);
		content = "귀하의 인증 코드는  " + userVO.getUserId() + " 입니다.";
		System.out.println(content);
		sendMail(emailVO);
	}
}
