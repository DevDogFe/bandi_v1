package com.bandi.novel.service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.bandi.novel.model.AuthKey;
import com.bandi.novel.model.User;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MailService {
	
	private JavaMailSender mailSender;
	private static final String ADMIN_EMAIL = "khl4459@naver.com";
	// TODO 
	// MimeMessage message = mailSender.createMimeMessage();
		
	
	// 임시 비밀번호 전송
	public void sendTempPassword(User user) {
		
		String title = "[BANDI]" + user.getUsername() + "님,";
		
		String content = "";
		
		content += "<div>";
		content += "<h3>" + user.getUsername() + "님의 임시비밀번호" + "</h3>";
		content += user.getPassword() +"</div>";	
		
		MimeMessage message = mailSender.createMimeMessage();
		
		try {
			message.addRecipients(RecipientType.TO, user.getEmail());
			message.setFrom(ADMIN_EMAIL);
			message.setSubject(title);
			message.setText(content, "utf-8", "html");
		} catch (MessagingException e) {
			e.printStackTrace();
		}		
		mailSender.send(message);		
	}
	
	// 이메일 인증번호 전송
	//public void sendAuthKey(AuthKey authKey) {
		public void sendAuthKey(AuthKey authKey) {
		
		String title = "[BANDI]" + "회원가입 인증코드";
		
		String content = authKey.getEmail() +"님";
		
		content += "<div>";
		content += "<h3>이메일 주소 확인</h3>";
		content += "아래 확인 코드를 회원가입 화면에서 입력해주세요";
		content += "</div>";
		content += "<div>";
		content += "<span>" + authKey.getAuthKey() + "</span>";
		content += "</div>";
		
		MimeMessage message = mailSender.createMimeMessage();
		
		try {
			message.addRecipients(RecipientType.TO, authKey.getEmail());
			message.setFrom(ADMIN_EMAIL);
			message.setSubject(title);
			message.setText(content, "utf-8", "html");
		} catch (MessagingException e) {
			e.printStackTrace();
		}		
		mailSender.send(message);				
	}	
	
}
