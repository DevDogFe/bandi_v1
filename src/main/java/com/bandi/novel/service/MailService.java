package com.bandi.novel.service;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.bandi.novel.model.User;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MailService {
	
	private JavaMailSender mailSender;
	private static final String ADMIN_EMAIL = "khl4459@naver.com";
	
	// 임시 비밀번호 전송
	public void sendMail(User user) {
		
		String title = "[BANDI]" + user.getUsername() + "님,";
		String content = 
				
				user.getUsername() + "님" 
						+ "임시비밀번호" + user.getPassword() ;
		
		SimpleMailMessage message = new SimpleMailMessage();
		//MimeMessage message = mailSender.createMimeMessage();
		message.setTo(user.getEmail());
		message.setFrom(MailService.ADMIN_EMAIL);		
		message.setSubject(title);
		message.setText(content);
		
		mailSender.send(message);		
	}
	
	// 이메일 인증 번호 
	
	
}
