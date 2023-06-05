package com.bandi.novel.test;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class PasswordCheck {
	
	public static void main(String[] args) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		String str = "123123";
		String encodedP = encoder.encode(str);
		System.out.println(encodedP);
	}

}
