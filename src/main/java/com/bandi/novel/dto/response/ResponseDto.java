package com.bandi.novel.dto.response;

import org.springframework.http.HttpStatus;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ResponseDto<T> {

	private HttpStatus statusCode; // 상태코드
	private String message; // 메세지
	private Boolean isSuccess; // 성공여부
	private T data; // 데이터

}
