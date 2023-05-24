package com.bandi.novel.dto.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ResponseDto<T> {

	private Integer statusCode;
	private String code; 
	private String message;
	private String resultCode;
	private T data; 
	
}
