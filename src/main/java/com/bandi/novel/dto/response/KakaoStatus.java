package com.bandi.novel.dto.response;

import lombok.Data;

@Data
public class KakaoStatus {
	
	public String READY;
	public String SEND_TMS;
	public String OPEN_PAYMENT;
	public String SELECT_METHOD;
	public String ARS_WAITING;
	public String AUTH_PASSWORD;
	public String ISSUED_SID;
	public String SUCCESS_PAYMENT;
	public String PART_CANCEL_PAYMENT;
	public String CANCEL_PAYMENTDY;
	public String FAIL_AUTH_PASSWORD;
	public String QUIT_PAYMENT;
	public String FAIL_PAYMENT;
}
