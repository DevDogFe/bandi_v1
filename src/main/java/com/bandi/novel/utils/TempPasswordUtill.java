package com.bandi.novel.utils;

import java.util.Random;

public class TempPasswordUtill {
		
	// 임시 비밀번호 생성
	public static String getTempPassword() {
		
		byte[] strs = new byte[8];

	      //49-122
	      for(int i = 0; i < strs.length; i++) {
	         strs[i] = (byte)(int)(Math.random() * 73 + 49);
	      }
	      String tempPassword = new String(strs);	      
	      return tempPassword;
	}
	
	// 인증번호 생성
	public static String getAuthKey() {
		
		StringBuffer key = new StringBuffer();
		Random random = new Random();		
		
		for (int i = 0; i < 6; i++) {
			key.append(random.nextInt(10));
		}				
		return key.toString();		
	}
}
